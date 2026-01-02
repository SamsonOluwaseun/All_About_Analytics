Project is an **interactive Power BI healthcare dashboard** designed to analyze the **health risks associated with smoking**. It helps users explore how smoking behavior relates to **organ damage**, **smoking duration**, **daily cigarette intake**, and key health indicators such as **BMI, cholesterol level, and blood pressure risk**.

The dashboard is built with a clean healthcare-style UI and uses **dynamic organ images** to visually represent **Healthy vs Damaged** conditions across major organs (Heart, Lungs, Liver, Kidney, and Body).

## Objectives
- Visualize smoking patterns across different groups
- Understand health risk indicators linked with smoking
- Provide an intuitive organ-based view of healthy vs damaged conditions
- Demonstrate end-to-end Power BI skills: data prep → modeling → DAX → storytelling

## Datasets Used
This project uses four datasets (CSV files):

- **health_dataset.csv** – patient demographics + smoking habits + health metrics  
- **condition.csv** – condition labels (Healthy / Damaged)  
- **Organs.csv** – list of organs used in the dashboard  
- **Image Dataset.csv** – image URLs for organ visuals (healthy/damaged)

## Dataset Overview
- **Total Records:** 2,500 patients  
- **Average Age:** 54.0 years  
- **Average BMI:** 29.6 (borderline obese)

The population represents a **high-risk demographic**, where smoking acts as a strong compounding factor for long-term health outcomes.

## Data Modeling & Logic
### Measures (DAX)
- Average Age
- Average BMI
- Total Patients (count of Patient ID)

## Tools & Technologies
- **Power BI Desktop**
- **Power Query** (data cleaning & transformation)
- **DAX** (measures & calculated columns)
- **Chiclet Slicer (Custom Visual)** for image-based filtering

## Key Insights
### Population Health Baseline
The dataset reflects an aging population with elevated BMI levels, placing many individuals at **increased baseline health risk**. This makes smoking behavior especially critical when assessing long-term damage.

### Smoking Status Distribution
| Smoking Status | Percentage |
|----------------|------------|
| Never Smoked   | 45.4% |
| Current Smokers | 29.3% |
| Former Smokers | 25.2% |

**Insight:**  
Over **54% of patients** have a history of smoking, indicating that smoking-related health risks affect the **majority** of the population rather than a small subgroup.

### Smoking Intensity: Duration vs Daily Intake
- **Correlation between Years of Smoking and Cigarettes per Day:** **0.73**

**Insight:**  
Smoking behavior intensifies over time. Individuals who smoke longer also tend to smoke **more cigarettes per day**, compounding health risks instead of stabilizing them.
### Smoking by Gender
Smoking behavior is **balanced across genders**:

| Smoking Status | Female | Male |
|----------------|--------|------|
| Current Smokers | 359 | 374 |
| Former Smokers | 312 | 319 |
| Never Smoked   | 567 | 569 |

 **Insight:**  
Smoking is not gender-skewed, suggesting prevention and intervention strategies should be **population-wide**, not gender-specific.

### Organ Health Impact (Core Insight)
| Condition | Count | Percentage |
|---------|-------|------------|
| Healthy | 1,603 | 64.1% |
| Damaged | 897 | 35.9% |

**Insight:**  
More than **1 in 3 patients** show evidence of **organ damage**, highlighting the tangible health impact of smoking exposure.

#### Organ-wise Damage Breakdown
| Organ | % Damaged |
|-----  |-----------|
| Liver | 37.7% |
| Kidney | 37.0% |
| Heart | 36.5% |
| Lungs | 35.1% |
| Human Body (Overall) | 32.7% |

**Insight:**  
While lung damage is expected, the **liver, kidney, and heart** show equal or higher damage rates, reinforcing that smoking causes **systemic, whole-body harm**, not just respiratory issues.

### Cholesterol & Blood Pressure Risk
| BP Risk | Avg Cholesterol |
|------- |-----------------|
| Low    | 207.3 |
| Normal | 208.6 |
| High   | 206.5 |

**Insight:**  
Even patients with **normal blood pressure** show elevated cholesterol levels, revealing **hidden cardiovascular risk** not always visible through BP alone.

### Age Group Trends
- Smoking exposure increases with age
- Older age groups show:
  - Higher smoking duration
  - Higher daily intake
  - Greater cardiovascular and metabolic risk

 **Insight:**  
Smoking damage is **progressive**, compounding across decades rather than appearing immediately.

## Dashboard Features
- Interactive **organ image slicers** (Healthy vs Damaged)
- KPI cards: Total Patients, Average Age, Average BMI
- Donut chart for smoking status distribution
- Line chart: Smoking duration vs daily intake by age group
- Stacked/ribbon charts for gender and risk analysis
- Clean healthcare-themed UI with custom background

## 🛠 Tools & Technologies
- **Power BI Desktop**
- **Power Query**
- **DAX (Measures & Calculated Columns)**
- **Chiclet Slicer (Custom Visual)**

  
## 🔗 Connect & Learn More

Let’s stay in touch and keep learning together!

[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/samlytics-data-service-487a7728a/)
[![Instagram](https://img.shields.io/badge/Instagram-%23E4405F.svg?&logo=instagram&logoColor=white)](https://www.instagram.com/samlytics_data/saved/)
[![YouTube](https://img.shields.io/badge/YouTube-%23FF0000.svg?&logo=youtube&logoColor=white)](https://www.youtube.com/@samlytics)

⭐ **Found this helpful?** Star the repo and share with developers interested in data & AI!

**Tags**: `first-Analytics-project` `data-Visualisation` `PowerBI` `DAX` `Image_URL` `tutorial` `beginner-friendly`
