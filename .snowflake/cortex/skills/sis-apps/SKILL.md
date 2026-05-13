---
name: sis-apps
description: Use when creating, editing, debugging, or deploying Streamlit in Snowflake (SiS) applications. Covers warehouse-runtime API compatibility, supported parameters, data access patterns, and deployment via SQL. Triggers include streamlit, SiS, streamlit app, streamlit dashboard, create streamlit, deploy streamlit, streamlit error, bar_chart, dataframe, hide_index, set_page_config.
---

# Streamlit in Snowflake (SiS) — Skill Guide

## Critical: SiS Is NOT OSS Streamlit

SiS runs inside Snowflake's **warehouse runtime**, which bundles a specific Streamlit version. The default version for legacy (ROOT_LOCATION-based) apps is **1.22.0** unless overridden via `environment.yml`. Many OSS Streamlit features were added in later versions and will crash at runtime with `TypeError: unexpected keyword argument` errors.

---

## Step 1: Choose Runtime & Streamlit Version

### Option A — Legacy Warehouse Runtime (ROOT_LOCATION)
- Default Streamlit: **1.22.0** (very limited API)
- Override by placing `environment.yml` in the stage root:
  ```yaml
  dependencies:
  - streamlit=1.35.0
  ```
- Available versions: query `SELECT DISTINCT VERSION FROM INFORMATION_SCHEMA.PACKAGES WHERE PACKAGE_NAME='streamlit' AND LANGUAGE='python' ORDER BY VERSION DESC`

### Option B — Container Runtime (RUNTIME_NAME = 'CONTAINER')
- Supports newer Streamlit versions
- Requires a compute pool

**Recommendation:** Always create `environment.yml` with an explicit Streamlit version.

---

## Step 2: API Compatibility Reference

### st.bar_chart()
| Parameter | Min Version | Safe Alternative (1.22) |
|-----------|------------|------------------------|
| `x`, `y`  | 1.28       | Set column as DataFrame index |
| `color`   | 1.28       | Use separate columns for each series |
| `stack`   | 1.37       | Not available; omit |
| `horizontal` | 1.37    | Not available; omit |

**Pattern — 1.22-safe bar chart:**
```python
# WRONG (requires >= 1.28):
st.bar_chart(df, x="Category", y="Value", color="Category")

# CORRECT (works on 1.22+):
chart_data = df.set_index("Category")
st.bar_chart(chart_data)

# CORRECT — grouped bar chart (1.22+):
pivot = df.pivot(index="Group", columns="Series", values="Count").fillna(0)
st.bar_chart(pivot)
```

### st.dataframe()
| Parameter | Min Version | Safe Alternative (1.22) |
|-----------|------------|------------------------|
| `hide_index` | 1.28    | Omit (index always shown) |
| `column_config` | 1.28 | Omit |
| `column_order` | 1.28  | Select/reorder columns in the DataFrame before passing |
| `use_container_width` | 1.0 | Safe to use |

### st.set_page_config()
| Parameter | Warehouse Runtime Support |
|-----------|--------------------------|
| `layout`  | Supported |
| `page_title` | Ignored (no effect, but no error) |
| `page_icon` | Ignored |
| `menu_items` | Ignored |

### st.line_chart() / st.area_chart()
Same restrictions as `st.bar_chart()` — `x`, `y`, `color` params require >= 1.28.

### Other Version-Gated Features
| Feature | Min Version |
|---------|------------|
| `st.divider()` | 1.28 |
| `st.tabs()` | 1.24 |
| `st.toggle()` | 1.28 |
| `st.chat_input()` / `st.chat_message()` | 1.28 |
| `st.status()` | 1.28 |
| `st.link_button()` | 1.28 |

---

## Step 3: Data Access Pattern

### ALWAYS use Snowpark session (NOT st.connection)
```python
# CORRECT — SiS:
from snowflake.snowpark.context import get_active_session
session = get_active_session()
df = session.sql("SELECT * FROM my_db.my_schema.my_table").to_pandas()

# WRONG — OSS pattern, will fail in SiS:
conn = st.connection("snowflake")
df = conn.query("SELECT ...")
```

### Key Data Access Rules
- Always use **fully qualified table names** (DB.SCHEMA.TABLE)
- `USE DATABASE` / `USE SCHEMA` are unreliable; don't depend on them
- The app runs as the **owner role** of the Streamlit object, not the viewer's role
- The owner role must have SELECT grants on all referenced objects
- Secrets (API keys, etc.) use Snowflake SECRET objects, not `st.secrets` or `.streamlit/secrets.toml`

---

## Step 4: Deployment via SQL

### Create the stage and upload code:
```sql
CREATE STAGE IF NOT EXISTS my_db.my_schema.dashboard_stage
  ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');

-- Upload dashboard.py to the stage (via PUT, Python proc, or UI)
```

### Create the Streamlit app:
```sql
CREATE OR REPLACE STREAMLIT my_db.my_schema.my_app
  ROOT_LOCATION = '@my_db.my_schema.dashboard_stage'
  MAIN_FILE = 'dashboard.py'
  QUERY_WAREHOUSE = my_warehouse
  TITLE = 'My Dashboard'
  COMMENT = 'Description here';
```

### Grant access to other roles:
```sql
GRANT USAGE ON STREAMLIT my_db.my_schema.my_app TO ROLE viewer_role;
```

---

## Step 5: Uploading Files to Stage

Since you cannot PUT files from a worksheet, use a Python stored procedure:

```sql
CREATE OR REPLACE PROCEDURE my_db.my_schema.write_app_file()
RETURNS STRING
LANGUAGE PYTHON
RUNTIME_VERSION = '3.11'
PACKAGES = ('snowflake-snowpark-python')
HANDLER = 'run'
AS
$$
def run(session):
    code = """import streamlit as st
...your code here...
"""
    with open('/tmp/dashboard.py', 'w') as f:
        f.write(code)
    session.file.put('/tmp/dashboard.py', '@my_stage', auto_compress=False, overwrite=True)
    return 'done'
$$;

CALL my_db.my_schema.write_app_file();
DROP PROCEDURE my_db.my_schema.write_app_file();
```

---

## Step 6: Common Permission Errors

If the app shows "permission denied" or "object does not exist":
1. Check the **owner role** of the Streamlit: `SHOW STREAMLITS LIKE 'name' IN SCHEMA db.schema`
2. Check object ownership: `SELECT TABLE_NAME, TABLE_OWNER FROM DB.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'SCHEMA'`
3. Grant SELECT: `GRANT SELECT ON ALL TABLES IN SCHEMA db.schema TO ROLE owner_role`
4. Grant SELECT on views too: `GRANT SELECT ON ALL VIEWS IN SCHEMA db.schema TO ROLE owner_role`
5. If views reference other schemas, grant USAGE + SELECT on those schemas as well

---

## Checklist Before Generating SiS Code

- [ ] Determined target Streamlit version (default 1.22 or explicit in environment.yml)
- [ ] All `st.bar_chart` / `st.line_chart` / `st.area_chart` use index-based API (no `x`, `y`, `color`, `stack` params) unless version >= 1.28 confirmed
- [ ] No `hide_index`, `column_config`, or `column_order` in `st.dataframe()` unless version >= 1.28 confirmed
- [ ] Using `get_active_session()`, not `st.connection()`
- [ ] All table references are fully qualified (DB.SCHEMA.TABLE)
- [ ] Owner role has SELECT grants on all referenced objects
- [ ] No `st.secrets` usage (use Snowflake SECRET objects instead)
- [ ] No local file I/O (no `open()`, `pd.read_csv("local_file")`)
- [ ] No `pip install` or external network calls unless external access integration is configured
