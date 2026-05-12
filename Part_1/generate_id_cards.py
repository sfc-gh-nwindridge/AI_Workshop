"""
Generate fake Marvel/Avengers ID card images for the KYC Workshop.
Produces ID_11.png through ID_20.png matching the style of existing cards.

Usage:
    python generate_id_cards.py [output_dir]
"""

import os
import sys
import random
import string
import io
import ssl
import time
import urllib.request
import urllib.error
from datetime import date, timedelta
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

# Hero data from KYC_SUPERHERO_DB.RAW.HEROES
HEROES = [
    {
        "hero_id": 1,
        "hero_name": "Iron Man",
        "real_name": "Tony Stark",
        "alias": "The Merchant of Death",
        "affiliation": "Avengers",
        "nationality": "American",
        "dob": "1970-05-29",
        "status": "ACTIVE",
        "risk_level": "HIGH",
        "address": "10880 Malibu Point, Malibu, CA",
    },
    {
        "hero_id": 2,
        "hero_name": "Captain America",
        "real_name": "Steve Rogers",
        "alias": "The First Avenger",
        "affiliation": "Avengers",
        "nationality": "American",
        "dob": "1918-07-04",
        "status": "ACTIVE",
        "risk_level": "LOW",
        "address": "Washington DC",
    },
    {
        "hero_id": 3,
        "hero_name": "Black Widow",
        "real_name": "Natasha Romanoff",
        "alias": "Natalia Alianovna Romanova",
        "affiliation": "Avengers",
        "nationality": "Russian",
        "dob": "1984-11-22",
        "status": "ACTIVE",
        "risk_level": "HIGH",
        "address": "Classified",
    },
    {
        "hero_id": 4,
        "hero_name": "Hulk",
        "real_name": "Bruce Banner",
        "alias": "The Green Goliath",
        "affiliation": "Avengers",
        "nationality": "American",
        "dob": "1969-12-18",
        "status": "ACTIVE",
        "risk_level": "CRITICAL",
        "address": "Unknown",
    },
    {
        "hero_id": 5,
        "hero_name": "Thor",
        "real_name": "Thor Odinson",
        "alias": "God of Thunder",
        "affiliation": "Avengers",
        "nationality": "Asgardian",
        "dob": "0964-01-01",
        "status": "ACTIVE",
        "risk_level": "MEDIUM",
        "address": "New Asgard, Tonsberg, Norway",
    },
    {
        "hero_id": 6,
        "hero_name": "Spider-Man",
        "real_name": "Peter Parker",
        "alias": "The Web-Slinger",
        "affiliation": "Avengers",
        "nationality": "American",
        "dob": "2001-08-10",
        "status": "ACTIVE",
        "risk_level": "LOW",
        "address": "Queens, New York",
    },
    {
        "hero_id": 7,
        "hero_name": "Black Panther",
        "real_name": "T'Challa",
        "alias": "King of Wakanda",
        "affiliation": "Avengers",
        "nationality": "Wakandan",
        "dob": "1980-04-15",
        "status": "ACTIVE",
        "risk_level": "MEDIUM",
        "address": "Wakanda",
    },
    {
        "hero_id": 8,
        "hero_name": "Scarlet Witch",
        "real_name": "Wanda Maximoff",
        "alias": "The Scarlet Witch",
        "affiliation": "Avengers",
        "nationality": "Sokovian",
        "dob": "1989-02-10",
        "status": "ACTIVE",
        "risk_level": "HIGH",
        "address": "Westview, New Jersey",
    },
    {
        "hero_id": 9,
        "hero_name": "Doctor Strange",
        "real_name": "Stephen Strange",
        "alias": "Sorcerer Supreme",
        "affiliation": "Avengers",
        "nationality": "American",
        "dob": "1975-11-18",
        "status": "ACTIVE",
        "risk_level": "MEDIUM",
        "address": "177A Bleecker Street, New York",
    },
    {
        "hero_id": 10,
        "hero_name": "Hawkeye",
        "real_name": "Clint Barton",
        "alias": "The Marksman",
        "affiliation": "Avengers",
        "nationality": "American",
        "dob": "1971-01-07",
        "status": "RETIRED",
        "risk_level": "LOW",
        "address": "Rural Missouri",
    },
]

# Colors
NAVY = (18, 32, 64)
DARK_BLUE = (25, 50, 100)
GOLD = (218, 165, 32)
WHITE = (255, 255, 255)
LIGHT_GRAY = (240, 240, 240)
MEDIUM_GRAY = (180, 180, 180)
DARK_GRAY = (60, 60, 60)
RED_ACCENT = (180, 30, 30)
CARD_BG = (250, 248, 245)

# Card dimensions (pixels)
CARD_WIDTH = 1000
CARD_HEIGHT = 650

# Headshot image URLs (Wikimedia Commons - CC licensed portraits of MCU actors)
# URLs verified via MediaWiki API at 330px (a standard Wikimedia thumbnail size)
HEADSHOT_URLS = {
    "Tony Stark": "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg/330px-Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg",
    "Steve Rogers": "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Mark_Kassen%2C_Tony_C%C3%A1rdenas_and_Chris_Evans_%28cropped%29.jpg/330px-Mark_Kassen%2C_Tony_C%C3%A1rdenas_and_Chris_Evans_%28cropped%29.jpg",
    "Natasha Romanoff": "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Scarlett_Johansson_by_Gage_Skidmore_2_%28cropped%29.jpg/330px-Scarlett_Johansson_by_Gage_Skidmore_2_%28cropped%29.jpg",
    "Bruce Banner": "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Mark_Ruffalo_%2836201774756%29_%28cropped%29.jpg/330px-Mark_Ruffalo_%2836201774756%29_%28cropped%29.jpg",
    "Thor Odinson": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/330px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg",
    "Peter Parker": "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Tom_Holland_by_Gage_Skidmore.jpg/330px-Tom_Holland_by_Gage_Skidmore.jpg",
    "T'Challa": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chadwick_Boseman_by_Gage_Skidmore_July_2017_%28cropped%29.jpg/330px-Chadwick_Boseman_by_Gage_Skidmore_July_2017_%28cropped%29.jpg",
    "Wanda Maximoff": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Elizabeth_Olsen_by_Gage_Skidmore_2.jpg/330px-Elizabeth_Olsen_by_Gage_Skidmore_2.jpg",
    "Stephen Strange": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Benedict_Cumberbatch_SDCC_2014.jpg/330px-Benedict_Cumberbatch_SDCC_2014.jpg",
    "Clint Barton": "https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Jeremy_Renner_by_Gage_Skidmore.jpg/330px-Jeremy_Renner_by_Gage_Skidmore.jpg",
}


def download_headshot(real_name, cache_dir):
    """Download a headshot image for a hero, with caching.

    Args:
        real_name: The hero's real name (key into HEADSHOT_URLS)
        cache_dir: Directory to cache downloaded images

    Returns:
        PIL Image object or None if download fails
    """
    url = HEADSHOT_URLS.get(real_name)
    if not url:
        print(f"    No headshot URL for {real_name}, using placeholder")
        return None

    # Check cache first
    cache_file = Path(cache_dir) / f"{real_name.replace(' ', '_')}.jpg"
    if cache_file.exists():
        try:
            return Image.open(cache_file)
        except Exception:
            pass  # Re-download if cache is corrupt

    # Download
    try:
        print(f"    Downloading headshot for {real_name}...")
        # Create SSL context that doesn't verify (for corporate proxies)
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE

        req = urllib.request.Request(url, headers={
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) KYCWorkshop/1.0",
        })

        # Respect rate limits with retry
        for attempt in range(3):
            try:
                with urllib.request.urlopen(req, timeout=15, context=ctx) as response:
                    data = response.read()
                break
            except urllib.error.HTTPError as e:
                if e.code == 429 and attempt < 2:
                    wait = (attempt + 1) * 3
                    print(f"    Rate limited, waiting {wait}s...")
                    time.sleep(wait)
                else:
                    raise

        # Save to cache
        cache_file.parent.mkdir(parents=True, exist_ok=True)
        cache_file.write_bytes(data)

        # Be polite to Wikimedia servers
        time.sleep(1.5)

        return Image.open(io.BytesIO(data))
    except Exception as e:
        print(f"    Failed to download headshot for {real_name}: {e}")
        return None


def crop_to_fit(img, target_w, target_h):
    """Center-crop an image to fit the target aspect ratio, then resize."""
    img_w, img_h = img.size
    target_ratio = target_w / target_h
    img_ratio = img_w / img_h

    if img_ratio > target_ratio:
        # Image is wider - crop sides
        new_w = int(img_h * target_ratio)
        left = (img_w - new_w) // 2
        img = img.crop((left, 0, left + new_w, img_h))
    else:
        # Image is taller - crop top/bottom (bias toward top for headshots)
        new_h = int(img_w / target_ratio)
        top = int((img_h - new_h) * 0.2)  # Keep more of the top (face area)
        img = img.crop((0, top, img_w, top + new_h))

    return img.resize((target_w, target_h), Image.LANCZOS)


def generate_id_number(hero_id):
    """Generate a realistic-looking ID number."""
    prefix = "AVG"
    number = f"{hero_id:03d}"
    suffix = "".join(random.choices(string.ascii_uppercase + string.digits, k=5))
    return f"{prefix}-{number}-{suffix}"


def generate_dates(dob_str):
    """Generate issue and expiry dates."""
    issue_year = random.randint(2020, 2024)
    issue_month = random.randint(1, 12)
    issue_day = random.randint(1, 28)
    issue_date = date(issue_year, issue_month, issue_day)
    expiry_date = issue_date + timedelta(days=365 * 5)
    return issue_date.strftime("%d/%m/%Y"), expiry_date.strftime("%d/%m/%Y")


def get_clearance(risk_level):
    """Map risk level to security clearance."""
    mapping = {
        "LOW": "LEVEL 2 - STANDARD",
        "MEDIUM": "LEVEL 4 - ENHANCED",
        "HIGH": "LEVEL 6 - TOP SECRET",
        "CRITICAL": "LEVEL 8 - OMEGA",
    }
    return mapping.get(risk_level, "LEVEL 1 - BASIC")


def generate_mrz(real_name, nationality, dob, id_number):
    """Generate a machine-readable zone string."""
    name_parts = real_name.upper().replace(" ", "<").replace("'", "")
    nat = nationality[:3].upper()
    dob_compact = dob.replace("-", "")[-6:]
    line1 = f"IDAVG<<{name_parts}{'<' * (44 - len(name_parts) - 6)}"[:44]
    line2 = f"{id_number.replace('-', '')}<{nat}<{dob_compact}{'<' * 20}"[:44]
    return line1, line2


def draw_card(hero, output_path, cache_dir):
    """Draw a single ID card for a hero."""
    img = Image.new("RGB", (CARD_WIDTH, CARD_HEIGHT), CARD_BG)
    draw = ImageDraw.Draw(img)

    # Try to use a system font, fall back to default
    try:
        font_title = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 28)
        font_subtitle = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 18)
        font_label = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 13)
        font_value = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 16)
        font_name = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 22)
        font_mrz = ImageFont.truetype("/System/Library/Fonts/Courier New.ttf", 14)
        font_photo = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 48)
    except (IOError, OSError):
        try:
            font_title = ImageFont.truetype("/System/Library/Fonts/SFNSMono.ttf", 28)
            font_subtitle = ImageFont.truetype("/System/Library/Fonts/SFNSMono.ttf", 18)
            font_label = ImageFont.truetype("/System/Library/Fonts/SFNSMono.ttf", 13)
            font_value = ImageFont.truetype("/System/Library/Fonts/SFNSMono.ttf", 16)
            font_name = ImageFont.truetype("/System/Library/Fonts/SFNSMono.ttf", 22)
            font_mrz = ImageFont.truetype("/System/Library/Fonts/SFNSMono.ttf", 14)
            font_photo = ImageFont.truetype("/System/Library/Fonts/SFNSMono.ttf", 48)
        except (IOError, OSError):
            font_title = ImageFont.load_default()
            font_subtitle = font_title
            font_label = font_title
            font_value = font_title
            font_name = font_title
            font_mrz = font_title
            font_photo = font_title

    # === HEADER BAR ===
    draw.rectangle([(0, 0), (CARD_WIDTH, 90)], fill=NAVY)

    # Marvel logo text
    draw.text((30, 15), "MARVEL", fill=RED_ACCENT, font=font_title)

    # Title
    draw.text((170, 12), "AVENGERS IDENTIFICATION CARD", fill=WHITE, font=font_title)

    # Subtitle
    draw.text((170, 50), "Strategic Homeland Intervention Division", fill=GOLD, font=font_subtitle)

    # Gold accent line
    draw.rectangle([(0, 90), (CARD_WIDTH, 94)], fill=GOLD)

    # === PHOTO AREA (left side) ===
    photo_x, photo_y = 30, 120
    photo_w, photo_h = 200, 250

    # Photo border
    draw.rectangle(
        [(photo_x - 2, photo_y - 2), (photo_x + photo_w + 2, photo_y + photo_h + 2)],
        outline=NAVY,
        width=2,
    )

    # Try to use downloaded headshot, fall back to placeholder
    headshot = download_headshot(hero["real_name"], cache_dir)
    if headshot:
        headshot = crop_to_fit(headshot, photo_w, photo_h)
        img.paste(headshot, (photo_x, photo_y))
    else:
        # Placeholder with initials
        draw.rectangle(
            [(photo_x, photo_y), (photo_x + photo_w, photo_y + photo_h)],
            fill=MEDIUM_GRAY,
        )
        initials = "".join(word[0] for word in hero["real_name"].split()[:2]).upper()
        bbox = draw.textbbox((0, 0), initials, font=font_photo)
        tw = bbox[2] - bbox[0]
        th = bbox[3] - bbox[1]
        draw.text(
            (photo_x + (photo_w - tw) // 2, photo_y + (photo_h - th) // 2),
            initials,
            fill=DARK_GRAY,
            font=font_photo,
        )

    # "PHOTO" label below
    draw.text((photo_x + 70, photo_y + photo_h + 5), "PHOTO", fill=DARK_GRAY, font=font_label)

    # === DATA FIELDS (right side) ===
    field_x = 270
    field_y_start = 110
    line_height = 45

    id_number = generate_id_number(hero["hero_id"])
    issue_date, expiry_date = generate_dates(hero["dob"])
    clearance = get_clearance(hero["risk_level"])

    fields = [
        ("FULL NAME", hero["real_name"].upper()),
        ("HERO DESIGNATION", hero["hero_name"]),
        ("ID NUMBER", id_number),
        ("NATIONALITY", hero["nationality"].upper()),
        ("DATE OF BIRTH", hero["dob"]),
        ("AFFILIATION", hero["affiliation"].upper()),
        ("SECURITY CLEARANCE", clearance),
        ("STATUS", hero["status"]),
    ]

    for i, (label, value) in enumerate(fields):
        y = field_y_start + (i * line_height)
        draw.text((field_x, y), label, fill=DARK_GRAY, font=font_label)
        draw.text((field_x, y + 15), value, fill=NAVY, font=font_value)

    # Issue/Expiry dates side by side below the main fields
    dates_y = field_y_start + (len(fields) * line_height)
    draw.text((field_x, dates_y), "ISSUED", fill=DARK_GRAY, font=font_label)
    draw.text((field_x, dates_y + 15), issue_date, fill=NAVY, font=font_value)
    draw.text((field_x + 200, dates_y), "EXPIRES", fill=DARK_GRAY, font=font_label)
    draw.text((field_x + 200, dates_y + 15), expiry_date, fill=NAVY, font=font_value)

    # === ADDRESS (below photo) ===
    addr_y = photo_y + photo_h + 30
    draw.text((30, addr_y), "ADDRESS", fill=DARK_GRAY, font=font_label)
    # Truncate long addresses
    addr_text = hero["address"][:40]
    draw.text((30, addr_y + 15), addr_text, fill=NAVY, font=font_value)

    # === MRZ ZONE (bottom) ===
    mrz_y = CARD_HEIGHT - 80
    draw.rectangle([(0, mrz_y - 5), (CARD_WIDTH, CARD_HEIGHT)], fill=LIGHT_GRAY)
    draw.rectangle([(0, mrz_y - 5), (CARD_WIDTH, mrz_y - 2)], fill=NAVY)

    mrz1, mrz2 = generate_mrz(hero["real_name"], hero["nationality"], hero["dob"], id_number)
    draw.text((30, mrz_y + 5), mrz1, fill=DARK_GRAY, font=font_mrz)
    draw.text((30, mrz_y + 30), mrz2, fill=DARK_GRAY, font=font_mrz)

    # === CARD BORDER ===
    draw.rectangle([(0, 0), (CARD_WIDTH - 1, CARD_HEIGHT - 1)], outline=NAVY, width=3)

    # Save
    img.save(output_path, "PNG")
    print(f"  Generated: {output_path}")


def main():
    output_dir = sys.argv[1] if len(sys.argv) > 1 else os.path.dirname(os.path.abspath(__file__))
    os.makedirs(output_dir, exist_ok=True)

    # Cache downloaded headshots to avoid re-downloading on each run
    cache_dir = os.path.join(output_dir, "headshots")
    os.makedirs(cache_dir, exist_ok=True)

    print(f"Generating {len(HEROES)} ID cards in: {output_dir}")
    print()

    for hero in HEROES:
        # Continue numbering from existing IDs (ID_1 through ID_10 exist)
        filename = f"ID_{hero['hero_id'] + 10}.png"
        output_path = os.path.join(output_dir, filename)
        draw_card(hero, output_path, cache_dir)

    print()
    print(f"Done! {len(HEROES)} ID cards generated (ID_11.png - ID_20.png)")


if __name__ == "__main__":
    main()
