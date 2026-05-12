"""
Generate KYC application form PDFs for the Avengers heroes (ID_11 - ID_20).
Matches the structure of existing KYC forms in the workshop.

Usage:
    python generate_kyc_forms.py [output_dir]
"""

import os
import sys
from datetime import date

from fpdf import FPDF


def sanitize_text(text):
    """Replace Unicode characters not supported by Latin-1 core fonts."""
    return text.replace("\u2014", " - ").replace("\u2013", "-").replace("\u2018", "'").replace("\u2019", "'")


# Hero KYC data mapped to match extracted fields from existing forms
HEROES_KYC = [
    {
        "hero_id": 1,
        "applicant_name": "Tony Stark",
        "date_of_birth": "May 29, 1970",
        "nationality": "American",
        "residential_address": "10880 Malibu Point, Malibu, CA 90265, USA",
        "occupation": "CEO / Engineer / Inventor",
        "employer": "Stark Industries",
        "source_of_funds": "Corporate Dividends, Patents, Defence Contracts",
        "purpose_of_account": "Business Operations, Philanthropic Trust Management",
        "annual_income": "$500,000,000+",
        "politically_exposed": "No",
        "associated_entities": "Stark Industries, Avengers Initiative, Stark Relief Foundation",
        "id_document_type": "US Passport",
        "id_document_number": "US-PAS-553921847",
        "date_signed": "March 15, 2024",
    },
    {
        "hero_id": 2,
        "applicant_name": "Steve Rogers",
        "date_of_birth": "July 4, 1918",
        "nationality": "American",
        "residential_address": "1600 Pennsylvania Avenue NW, Washington DC 20500, USA",
        "occupation": "Military Consultant / Retired",
        "employer": "Department of Defence (formerly)",
        "source_of_funds": "Government Pension, Back-pay Settlement (1945-2011)",
        "purpose_of_account": "Personal Banking, Veterans Charity Donations",
        "annual_income": "$85,000",
        "politically_exposed": "No",
        "associated_entities": "S.H.I.E.L.D. (dissolved), Avengers Initiative, US Army",
        "id_document_type": "US Military ID",
        "id_document_number": "MIL-USA-000000001",
        "date_signed": "February 28, 2024",
    },
    {
        "hero_id": 3,
        "applicant_name": "Natasha Romanoff",
        "date_of_birth": "November 22, 1984",
        "nationality": "Russian",
        "residential_address": "Classified — c/o Avengers Compound, Upstate New York",
        "occupation": "Intelligence Consultant / Former Agent",
        "employer": "Self-employed (formerly S.H.I.E.L.D.)",
        "source_of_funds": "Undisclosed (Classified Government Operations)",
        "purpose_of_account": "Operational Expenses, Personal Savings",
        "annual_income": "Classified",
        "politically_exposed": "Yes — former state intelligence operative",
        "associated_entities": "Red Room (former), S.H.I.E.L.D. (former), Avengers Initiative",
        "id_document_type": "Passport (multiple aliases)",
        "id_document_number": "RU-PAS-N70220200",
        "date_signed": "January 10, 2024",
    },
    {
        "hero_id": 4,
        "applicant_name": "Bruce Banner",
        "date_of_birth": "December 18, 1969",
        "nationality": "American",
        "residential_address": "Variable — last known: Avengers Tower, Manhattan, NY",
        "occupation": "Nuclear Physicist / Researcher",
        "employer": "Culver University (formerly), self-employed researcher",
        "source_of_funds": "Research Grants, Academic Publications, Consulting Fees",
        "purpose_of_account": "Research Funding, Laboratory Equipment Procurement",
        "annual_income": "$220,000",
        "politically_exposed": "No",
        "associated_entities": "Culver University, Avengers Initiative, Ross Biotech (estranged)",
        "id_document_type": "US Passport",
        "id_document_number": "US-PAS-667788990",
        "date_signed": "April 2, 2024",
    },
    {
        "hero_id": 5,
        "applicant_name": "Thor Odinson",
        "date_of_birth": "Unknown — approximately 964 CE",
        "nationality": "Asgardian",
        "residential_address": "New Asgard, Tønsberg, Norway",
        "occupation": "King of Asgard / Protector",
        "employer": "N/A — Head of State",
        "source_of_funds": "Asgardian Treasury, Norwegian Government Settlement",
        "purpose_of_account": "Diplomatic Banking, Asgardian Refugee Resettlement Fund",
        "annual_income": "N/A — sovereign entity",
        "politically_exposed": "Yes — Head of State (Asgard)",
        "associated_entities": "Asgardian Royal Family, Avengers Initiative, Norwegian Government",
        "id_document_type": "Asgardian Royal Decree (accepted as equivalent)",
        "id_document_number": "ASG-ROYAL-001",
        "date_signed": "December 1, 2023",
    },
    {
        "hero_id": 6,
        "applicant_name": "Peter Parker",
        "date_of_birth": "August 10, 2001",
        "nationality": "American",
        "residential_address": "20 Ingram Street, Forest Hills, Queens, NY 11375",
        "occupation": "Freelance Photographer / Student",
        "employer": "Daily Bugle (freelance)",
        "source_of_funds": "Photography Income, Stark Industries Internship Stipend",
        "purpose_of_account": "Personal Savings, Tuition Payments",
        "annual_income": "$32,000",
        "politically_exposed": "No",
        "associated_entities": "Daily Bugle, Midtown School of Science, Stark Industries (intern)",
        "id_document_type": "New York State Driver's License",
        "id_document_number": "DL-NY-987654321",
        "date_signed": "May 5, 2024",
    },
    {
        "hero_id": 7,
        "applicant_name": "T'Challa",
        "date_of_birth": "April 15, 1980",
        "nationality": "Wakandan",
        "residential_address": "Royal Palace, Birnin Zana, Wakanda",
        "occupation": "King of Wakanda / Head of State",
        "employer": "N/A — Monarch",
        "source_of_funds": "Vibranium Exports, Wakandan National Treasury",
        "purpose_of_account": "International Diplomatic Operations, Humanitarian Aid",
        "annual_income": "N/A — sovereign wealth",
        "politically_exposed": "Yes — Head of State (Wakanda)",
        "associated_entities": "Wakandan Royal Council, Avengers Initiative, Wakandan Outreach Centre",
        "id_document_type": "Wakandan Royal Passport",
        "id_document_number": "WK-ROYAL-TC001",
        "date_signed": "November 20, 2023",
    },
    {
        "hero_id": 8,
        "applicant_name": "Wanda Maximoff",
        "date_of_birth": "February 10, 1989",
        "nationality": "Sokovian",
        "residential_address": "2800 Sherwood Drive, Westview, NJ 08530",
        "occupation": "Unemployed / Former Avenger",
        "employer": "None",
        "source_of_funds": "Avengers Compensation Fund, Sokovian Refugee Aid",
        "purpose_of_account": "Personal Living Expenses",
        "annual_income": "$45,000",
        "politically_exposed": "No — former HYDRA test subject (involuntary)",
        "associated_entities": "Avengers Initiative, HYDRA (former, involuntary), Sokovian Relief Fund",
        "id_document_type": "Sokovian Passport (expired — state dissolved)",
        "id_document_number": "SK-PAS-WM891002",
        "date_signed": "March 30, 2024",
    },
    {
        "hero_id": 9,
        "applicant_name": "Stephen Strange",
        "date_of_birth": "November 18, 1975",
        "nationality": "American",
        "residential_address": "177A Bleecker Street, Greenwich Village, New York, NY 10012",
        "occupation": "Sorcerer Supreme / Former Neurosurgeon",
        "employer": "Self-employed (Kamar-Taj)",
        "source_of_funds": "Medical Malpractice Settlement, Investment Portfolio, Donations",
        "purpose_of_account": "Property Maintenance, Artifact Acquisition, Medical Research",
        "annual_income": "$180,000 (investment income)",
        "politically_exposed": "No",
        "associated_entities": "Kamar-Taj, New York Sanctum, Metro-General Hospital (former)",
        "id_document_type": "US Passport",
        "id_document_number": "US-PAS-112233445",
        "date_signed": "January 22, 2024",
    },
    {
        "hero_id": 10,
        "applicant_name": "Clint Barton",
        "date_of_birth": "January 7, 1971",
        "nationality": "American",
        "residential_address": "Rural Route 4, Box 12, Waverly, MO 64096",
        "occupation": "Retired / Former S.H.I.E.L.D. Agent",
        "employer": "None (retired)",
        "source_of_funds": "Government Pension, S.H.I.E.L.D. Retirement Package",
        "purpose_of_account": "Family Expenses, Farm Operations",
        "annual_income": "$95,000",
        "politically_exposed": "No",
        "associated_entities": "S.H.I.E.L.D. (former), Avengers Initiative (former)",
        "id_document_type": "US Passport",
        "id_document_number": "US-PAS-334455667",
        "date_signed": "February 14, 2024",
    },
]


class KYCFormPDF(FPDF):
    """Custom PDF class for KYC Application Forms."""

    def header(self):
        # Logo area
        self.set_font("Helvetica", "B", 20)
        self.set_text_color(18, 32, 64)  # Navy
        self.cell(0, 10, "MARVEL FINANCIAL SERVICES", align="C", new_x="LMARGIN", new_y="NEXT")

        self.set_font("Helvetica", "", 12)
        self.set_text_color(100, 100, 100)
        self.cell(0, 6, "Know Your Customer (KYC) Application Form", align="C", new_x="LMARGIN", new_y="NEXT")

        # Gold line
        self.set_draw_color(218, 165, 32)
        self.set_line_width(0.8)
        self.line(10, self.get_y() + 2, 200, self.get_y() + 2)
        self.ln(8)

    def footer(self):
        self.set_y(-20)
        self.set_font("Helvetica", "I", 8)
        self.set_text_color(150, 150, 150)
        self.cell(0, 5, "CONFIDENTIAL - For authorised compliance use only", align="C", new_x="LMARGIN", new_y="NEXT")
        self.cell(0, 5, f"Page {self.page_no()}/{{nb}}", align="C")

    def section_header(self, title):
        self.set_font("Helvetica", "B", 11)
        self.set_text_color(18, 32, 64)
        self.set_fill_color(240, 240, 245)
        self.cell(0, 8, f"  {title}", fill=True, new_x="LMARGIN", new_y="NEXT")
        self.ln(2)

    def form_field(self, label, value):
        value = sanitize_text(value)
        self.set_font("Helvetica", "", 9)
        self.set_text_color(80, 80, 80)
        self.cell(60, 6, label + ":", new_x="END")

        self.set_font("Helvetica", "B", 10)
        self.set_text_color(0, 0, 0)
        # Handle long values
        if len(value) > 70:
            self.multi_cell(0, 6, value, new_x="LMARGIN", new_y="NEXT")
        else:
            self.cell(0, 6, value, new_x="LMARGIN", new_y="NEXT")
        self.ln(1)

    def checkbox_field(self, label, checked=False):
        self.set_font("Helvetica", "", 9)
        self.set_text_color(80, 80, 80)
        mark = "[X]" if checked else "[ ]"
        self.cell(60, 6, label + ":", new_x="END")
        self.set_font("Courier", "B", 10)
        self.cell(0, 6, mark, new_x="LMARGIN", new_y="NEXT")
        self.ln(1)


def generate_kyc_form(hero, output_path):
    """Generate a single KYC form PDF for a hero."""
    pdf = KYCFormPDF()
    pdf.alias_nb_pages()
    pdf.add_page()
    pdf.set_auto_page_break(auto=True, margin=25)

    # Form reference
    form_num = hero["hero_id"] + 10
    pdf.set_font("Helvetica", "", 8)
    pdf.set_text_color(150, 150, 150)
    pdf.cell(0, 5, f"Form Ref: KYC-AVG-{form_num:04d}", align="R", new_x="LMARGIN", new_y="NEXT")
    pdf.ln(3)

    # Section 1: Personal Information
    pdf.section_header("SECTION 1: PERSONAL INFORMATION")
    pdf.form_field("Full Legal Name", hero["applicant_name"])
    pdf.form_field("Date of Birth", hero["date_of_birth"])
    pdf.form_field("Nationality / Citizenship", hero["nationality"])
    pdf.form_field("Residential Address", hero["residential_address"])
    pdf.ln(3)

    # Section 2: Employment & Occupation
    pdf.section_header("SECTION 2: EMPLOYMENT & OCCUPATION")
    pdf.form_field("Occupation / Profession", hero["occupation"])
    pdf.form_field("Employer / Organisation", hero["employer"])
    pdf.form_field("Annual Income", hero["annual_income"])
    pdf.ln(3)

    # Section 3: Financial Information
    pdf.section_header("SECTION 3: FINANCIAL INFORMATION")
    pdf.form_field("Source of Funds / Wealth", hero["source_of_funds"])
    pdf.form_field("Purpose of Account / Relationship", hero["purpose_of_account"])
    pdf.ln(3)

    # Section 4: Politically Exposed Person (PEP) Declaration
    pdf.section_header("SECTION 4: POLITICALLY EXPOSED PERSON (PEP) STATUS")
    pep = hero["politically_exposed"]
    is_pep = pep.lower().startswith("yes")
    pdf.checkbox_field("I am a Politically Exposed Person", checked=is_pep)
    pdf.checkbox_field("I am NOT a Politically Exposed Person", checked=not is_pep)
    if is_pep:
        pdf.form_field("PEP Details", pep)
    pdf.ln(3)

    # Section 5: Associated Entities
    pdf.section_header("SECTION 5: ASSOCIATED ENTITIES & RELATIONSHIPS")
    pdf.form_field("Associated Entities", hero["associated_entities"])
    pdf.ln(3)

    # Section 6: Identity Document
    pdf.section_header("SECTION 6: IDENTITY VERIFICATION")
    pdf.form_field("ID Document Type", hero["id_document_type"])
    pdf.form_field("ID Document Number", hero["id_document_number"])
    pdf.ln(3)

    # Section 7: Declaration & Signature
    pdf.section_header("SECTION 7: DECLARATION & SIGNATURE")
    pdf.set_font("Helvetica", "", 9)
    pdf.set_text_color(40, 40, 40)
    declaration = (
        "I hereby declare that the information provided in this form is true, complete, "
        "and correct to the best of my knowledge. I understand that providing false or "
        "misleading information may result in the termination of the business relationship "
        "and potential legal action. I consent to the verification of the information "
        "provided herein."
    )
    pdf.multi_cell(0, 5, declaration, new_x="LMARGIN", new_y="NEXT")
    pdf.ln(5)

    pdf.form_field("Applicant Signature", "______________________________")
    pdf.form_field("Date Signed", hero["date_signed"])
    pdf.ln(5)

    # Internal use section
    pdf.set_draw_color(200, 200, 200)
    pdf.set_line_width(0.3)
    pdf.line(10, pdf.get_y(), 200, pdf.get_y())
    pdf.ln(3)
    pdf.set_font("Helvetica", "I", 8)
    pdf.set_text_color(150, 150, 150)
    pdf.cell(0, 5, "FOR INTERNAL USE ONLY", align="C", new_x="LMARGIN", new_y="NEXT")
    pdf.ln(2)
    pdf.form_field("Reviewed By", "_______________")
    pdf.form_field("Review Date", "___/___/______")
    pdf.form_field("Risk Rating", "[ ] Low   [ ] Medium   [ ] High   [ ] Critical")

    # Save
    pdf.output(output_path)
    print(f"  Generated: {output_path}")


def main():
    output_dir = sys.argv[1] if len(sys.argv) > 1 else os.path.dirname(os.path.abspath(__file__))
    os.makedirs(output_dir, exist_ok=True)

    print(f"Generating {len(HEROES_KYC)} KYC forms in: {output_dir}")
    print()

    for hero in HEROES_KYC:
        form_num = hero["hero_id"] + 10
        filename = f"KYC_Form_{form_num}.pdf"
        output_path = os.path.join(output_dir, filename)
        generate_kyc_form(hero, output_path)

    print()
    print(f"Done! {len(HEROES_KYC)} KYC forms generated (KYC_Form_11.pdf - KYC_Form_20.pdf)")


if __name__ == "__main__":
    main()
