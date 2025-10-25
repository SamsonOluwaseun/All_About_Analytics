# 🛡️ Customer Master Data Management (CMDM) for Insurance, Banking, and Healthcare (UK Use Case)
### *Registry-Style Implementation & Proof-of-Value Prototype*

![Python](https://img.shields.io/badge/Python-3.9%2B-blue)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange)
![MDM](https://img.shields.io/badge/Data-Management-success)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 🎯 Role Focus: MDM Strategy & Architecture Lead

This project demonstrates an **end-to-end Customer Master Data Management (CMDM)** solution built using Python, simulating the key processes of a **Registry-Style MDM Hub** — a core capability for achieving a **Single View of the Customer (360° View)** across fragmented systems in **insurance, banking, and healthcare**.

It also serves as a **proof-of-value prototype**, showing how lightweight open-source tools can model MDM principles before enterprise-wide rollout.

---

## 1. 🏢 Business Context & Importance of MDM in a Merged Ecosystem

When insurance, banking, and healthcare institutions merge, they inherit **disparate customer records**, each using different formats, identifiers, and standards. This creates serious challenges:

### ⚠️ Business Pain Points:
- 🔁 Duplicate or inconsistent customer records across systems  
- 🔒 High compliance risks (GDPR, FCA, NHS Digital)  
- 📉 Inefficient cross-sell, claims, and underwriting processes  
- 💬 Poor customer experience due to fragmented communications  

### ✅ MDM as the Solution:
A well-designed **Customer MDM (CMDM)** strategy enables:
- A unified **Golden Record** of each customer  
- **Data lineage and governance** across systems  
- Enhanced **risk management** and **fraud detection**  
- Improved **personalization** and **customer trust**  

---

## 2. 💡 Project Goal & Business Insight for Insurance

**Problem:** Customer data in insurance is siloed across various operational systems (Policy Admin, Claims, CRM), leading to duplicates, miscommunication, and regulatory exposure.  
**Solution:** Implement an automated **CMDM process** that links these disparate records via a **Cross-Reference (X-Ref) Table**, driven by a unique **Master ID**.

### 💼 Key Business Value for an Insurance Carrier:

| Business Driver | Before MDM | After MDM (Insight) |
| :--- | :--- | :--- |
| **Cross-Sell / Up-Sell** | Marketing targets a customer twice due to two Policy IDs. | **Efficiency:** Master ID links both policies → single targeted offer. |
| **Claims Fraud** | Hidden history under separate IDs in legacy systems. | **Risk Mitigation:** Master ID provides an enterprise-wide 360° view. |
| **Regulatory Compliance** | Inconsistent name/address for KYC/AML. | **Data Governance:** Master ID ensures validated Golden Records. |

---

## 3. 🧠 Technical Architecture & Approach

This Python notebook simulates a **registry-style MDM hub**, following a structured multi-phase process.

| Phase | Description | Key Artifact | Python Technique | MDM Style |
| :--- | :--- | :--- | :--- | :--- |
| **I. Data Staging** | Load simulated data from three sources (Life Policy, Auto Claims, CRM) with inconsistencies. | `raw_df` | Pandas DataFrame Creation | Source Systems |
| **II. Standardization** | Cleanse and normalize data (names, phone numbers, addresses). | `staged_df` | `pandas.str`, `regex` | Data Quality |
| **III. Matching & Linking** | Apply **deterministic rules** for customer record matching. | `Master_ID` generation | Grouping, Conditional Assignment | Registry / Consolidation |
| **IV. Cross-Reference (X-Ref)** | Build the final lookup table linking Master IDs to source IDs. | `final_result_df` | `pandas.groupby().agg()` | MDM Hub Output |
| **V. Syndication** | Simulate API lookups by Master ID. | `lookup_source_ids_by_master_id` | Python Function | Data Syndication |

### 🧩 Matching Rules (Deterministic Example):
1. **Rule 1 – High Confidence:** `[Full Name] + [DOB] + [Phone]` → Match & Link  
2. **Rule 2 – Medium Confidence:** `[Full Name] + [DOB]` → Match & Link (even if address/phone differ)  
3. **Rule 3 – Singleton:** Assign new `Master_ID` for unmatched records  

---

## 4. ⚙️ Tools & Technologies

| Category | Tools / Techniques |
|-----------|--------------------|
| 💻 Programming | Python (Pandas, NumPy, FuzzyWuzzy) |
| 📘 Environment | Jupyter Notebook |
| 🧩 Data Profiling | Custom Python scripts |
| 🔍 Matching Logic | Rule-based & fuzzy matching |
| 📈 Visualization | Matplotlib / Seaborn |
| 📂 Data Templates | CSV-based mock datasets |

---

## 5. 🚀 How to Run the Project (Google Colab)

1. Open the **`Customer_MDM.ipynb`** notebook in Google Colab.  
2. Run all cells sequentially.  
3. Review the **Final Cross-Reference Table** (Section 5).  
4. Test the lookup function using generated Master IDs (e.g., `CMD_001`, `CMD_003`).  

```python
# Example Lookup
lookup_source_ids_by_master_id('CMD_003')

## 6. 📺 Reference Insight

🎥 [**KPMG and Informatica for Master Data Management (MDM)**](https://www.youtube.com/watch?v=QZY4_1HGFC8)  
> Demonstrates how consulting and technology partners collaborate to deliver scalable MDM solutions aligned with strategic enterprise data goals.

---

## 7. 💬 Outcome & Business Impact

This prototype demonstrates how **Registry-Style Customer Master Data Management (CMDM)** can unify fragmented customer data across **insurance, banking, and healthcare** systems.  

### ✅ Key Outcomes:
- Establishes a **360° customer view** through cross-reference (X-Ref) logic.  
- Shows how **Python-based matching rules** simulate MDM core functionality.  
- Offers a **hands-on, low-cost approach** to validate MDM design and logic.  
- Provides a **proof-of-value framework** before enterprise-scale investment.  

By leveraging this prototype, organizations can better communicate the value of MDM, align stakeholders, and define clear business outcomes prior to implementing enterprise tools.

---

## 8. 🧭 Conclusion & Recommendation

While full-scale enterprise platforms such as **Informatica**, **Collibra**, or **Semarchy** deliver comprehensive Master Data Management capabilities — including data governance, lineage tracking, and orchestration — they typically require substantial investment and readiness.

This project illustrates that using **Python and structured data templates** allows teams to:
- Build **proof-of-value prototypes** to test data unification logic.  
- Validate **matching, survivorship, and golden record creation** early.  
- Enable **stakeholders to visualize results** and align expectations.  
- Demonstrate **real-world feasibility** of MDM before heavy software procurement.  

> ✅ This pragmatic approach enables decision-makers to understand relevant data for MDM, evaluate quality, and make informed investment choices for future implementation.

---

## 🤝 Get in Touch

For **proof-of-value development**, **data product prototypes**, or **data strategy consultation**, reach out to us:

> 🌐 [**samlytics.co.uk**](https://samlytics.co.uk)  
> 💬 We’ll help you understand your business data vision — and prove the value at close to no cost.

---

## 📂 Repository Structure
📁 Customer_MDM/
├── Customer_MDM.ipynb # Main Jupyter Notebook (prototype)
├── data/ # Sample / mock datasets
├── README.md # Documentation (this file)
└── requirements.txt # Python dependencies


---

## 🧩 Example Code Snippet

```python
# Example: Fuzzy Matching Between Customer Names
from fuzzywuzzy import fuzz

score = fuzz.token_set_ratio("John Smith", "Jon Smyth")
print(f"Matching score: {score}")

🧮 This example illustrates how simple Python logic can detect potential duplicates and link customer records before implementing enterprise MDM platforms.

# 📜 MIT License

Copyright (c) 2025 Samlytics

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

---

### 🧾 Terms & Conditions

The above copyright notice and this permission notice shall be included in  
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND,  
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF  
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,  
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,  
ARISING FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER  
DEALINGS IN THE SOFTWARE.

---

### 🧠 Summary (Plain English)
You are free to:
- ✅ Use this code for personal or commercial projects.  
- 🔄 Modify and distribute it.  
- 📚 Learn from it and share improvements.  

You must:
- 🏷️ Keep the copyright notice intact.  
- ⚖️ Accept that the software is provided **without any warranty**.

---

Made with ❤️ by [**Samlytics**](https://samlytics.co.uk)

.

