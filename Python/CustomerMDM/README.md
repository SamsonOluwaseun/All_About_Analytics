# 🛡️ Customer Master Data Management (CMDM) for Insurance: Registry Style Implementation

## Role Focus: MDM Strategy & Architecture Lead

This project demonstrates an end-to-end Customer Master Data Management (CMDM) solution built using Python, simulating the core processes of a **Registry-Style MDM Hub**—essential for establishing a **Single View of the Customer (360° View)** in a fragmented insurance data landscape.

---

## 1. Project Goal & Business Insight for Insurance

**Problem:** Customer data in Insurance is siloed across various operational systems (Policy Admin, Claims, CRM) leading to duplicate records, inconsistent communication, and regulatory risk.
**Solution:** Implement an automated CMDM process to link these disparate records, creating a trusted **Cross-Reference (X-Ref) Table** keyed by a unique **Master ID**.

### Key Business Value to an Insurance Carrier:
| Business Driver | Before MDM | After MDM (Insight) |
| :--- | :--- | :--- |
| **Cross-Sell/Up-Sell** | Marketing targets a customer twice due to two separate Policy IDs. | **Targeting Efficiency:** Master ID links both policies; marketing can execute a targeted bundle offer. |
| **Claims Fraud** | A claimant has a suspicious history hidden in a legacy system under a different ID. | **Risk Mitigation:** Master ID provides an instant 360° view of all related claims across the enterprise. |
| **Regulatory Compliance** | Inconsistent name/address data for KYC/AML reporting. | **Data Governance:** Master ID ensures a single, validated Golden Record is used for all reporting. |

---

## 2. Technical Architecture & Approach

| Phase | Description | Key Artifact | Python Technique | MDM Style |
| :--- | :--- | :--- | :--- | :--- |
| **I. Data Staging** | Simulated data from three sources (Life Policy, Auto Claims, CRM) with inconsistencies (typos, different addresses, phone formats). | `raw_df` | Pandas DataFrame Creation. | Source Systems |
| **II. Standardization** | Data Cleansing and Transformation (e.g., standardizing phone formats, normalizing names like 'Jon' to 'John'). | `staged_df` | `pandas.str` methods, `regex` cleaning. | Data Quality/Cleansing |
| **III. Matching & Linking** | **Deterministic Matching** logic is applied (Hierarchical Rules). | `Master_ID` generation | Grouping, Looping, and Conditional Assignment. | Registry / Consolidation |
| **IV. Cross-Reference (X-Ref)** | Creation of the final lookup table that links the unique `Master_ID` to all original source system IDs. | `final_result_df` | `pandas.groupby().agg()` | MDM Hub Output |
| **V. Syndication** | Script to simulate a real-time API lookup to retrieve source IDs using the Master ID. | `lookup_source_ids_by_master_id` | Python Function / Dictionary Lookup. | Data Syndication |

### Matching Rules Implemented (Example Deterministic Flow):
1.  **Rule 1 (High Confidence):** **[Standardized Full Name] AND [Exact DOB] AND [Standardized Phone]** $\implies$ Match & Link.
2.  **Rule 2 (Medium Confidence):** **[Standardized Full Name] AND [Exact DOB]** $\implies$ Match & Link (Handles cases where phone/address are different but core identity is the same).
3.  **Rule 3 (Singleton):** Any record not matched is assigned a unique new `Master_ID`.

---

## 3. How to Run the Project (Google Colab)

1.  Open the **`Customer_MDM_Project.ipynb`** file (or the current Python script) in Google Colab.
2.  Run all cells sequentially.
3.  Review the `Final Cross-Reference Table` in Section 5.
4.  Test the lookup function in Section 6 with the generated `Master_ID`s (e.g., `CMD_001`, `CMD_003`).

---
The video provides an overview of how KPMG and Informatica partner to provide Master Data Management solutions, aligning with the strategic consulting context of the role. [KPMG and Informatica for master data management (MDM)](https://www.youtube.com/watch?v=QZY4_1HGFC8)
http://googleusercontent.com/youtube_content/0
