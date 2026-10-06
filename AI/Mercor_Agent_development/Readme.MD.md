# Agentic AI Capstone Project Guide
## Healthcare Data Maturity Assessment — Using Microsoft Copilot

---

## Project Overview

**Task:** Use Microsoft Copilot (with a prepared context package) to produce a Data Maturity Assessment Report for a fictional NHS Community Health Trust. The agent reads multiple documents, scores the trust against a maturity framework, identifies the top gaps, and produces two reviewable artifacts: an executive brief and a scoring matrix.

**Fictional Organisation:** Midvale Community Health Trust (entirely fictional — safe to share publicly)

**What Copilot produces:**
1. A maturity scoring matrix (in Excel or as a structured table in Word)
2. A two-page executive readiness brief (in Word)

---

## Why This Meets All Five Criteria

| Criterion | How this task satisfies it |
|-----------|---------------------------|
| Multi-step | Agent must read four documents, apply a scoring rubric, synthesise findings, identify gaps, prioritise, and write an executive brief — not a single question |
| Reviewable artifact | A scored maturity matrix and a written brief — both have a clear quality bar |
| Requires real context | Copilot cannot score Midvale Trust without the fictional profile, inventory, policy, and pain-point log you provide |
| You know what good looks like | You have done data governance assessments professionally — you can judge this like a manager |
| Safe to share | All data is fictional and anonymised — designed for GitHub or portfolio use |

---

## Step 1: Assemble Your Context Package

Before writing a single prompt, create these four short documents. Save each as a Word file (.docx) or plain text (.txt) in a folder on your OneDrive or desktop. Name them exactly as shown — your prompts will reference them by name.

---

### Document 1: `Trust_Profile.docx`

Paste this content into a Word document and save it.

---

**Midvale Community Health Trust — Organisational Profile**
*(Fictional — for training purposes only)*

Midvale Community Health Trust serves a mixed urban and rural population of approximately 280,000 people across three borough areas in the East Midlands. The Trust operates seven community health centres, two mental health outreach teams, and a shared district nursing service.

**Staff:** Approximately 1,400 clinical and administrative staff.

**Current digital environment:**
- Primary clinical system: SystmOne (community version), deployed in 2019
- Secondary system: legacy RiO instance for mental health, scheduled for decommission in 2026
- Patient administration: a locally built Access database maintained by one administrator
- Reporting: manual extraction to Excel by the BI analyst team (team of 3)
- Data warehouse: none. All reporting is point-in-time extracts.

**Strategic direction:** The Trust has signed a Memorandum of Understanding to join the Midlands Integrated Care System (ICS) data sharing agreement by April 2027. A condition of joining is achieving Level 3 on the NHS Data Maturity Framework across all six domains by that date.

**Current assessed level:** Self-assessed at Level 1–2 across most domains. No independent assessment has been conducted.

---

### Document 2: `Data_Inventory.docx`

---

**Midvale Community Health Trust — Current State Data Inventory**
*(Fictional — for training purposes only)*

| Dataset | System | Owner | Update Frequency | Format | Data Quality Issues Noted |
|---------|--------|-------|-----------------|--------|--------------------------|
| Patient demographics | SystmOne | Information Governance Lead | Real-time | Structured | Duplicate records estimated at 3–4%. No deduplication process in place. |
| Appointment and activity data | SystmOne | Service Managers | Daily | Structured | Incomplete ethnicity coding. Referral-to-treatment times calculated manually. |
| Mental health care plans | RiO (legacy) | Mental Health Team Lead | Weekly upload | Semi-structured | Free-text fields dominate. No standardised coding. SNOMED not applied. |
| District nursing visit logs | Paper forms, scanned monthly | District Nursing Manager | Monthly | Unstructured (scanned PDF) | No digital capture. Scanned documents not searchable. 6–8 week lag. |
| Staff HR records | External HR system (ESR) | HR Director | Monthly extract | Structured | Not linked to clinical activity data. |
| Incident and complaint records | Datix | Risk and Safety Lead | Real-time | Structured | Incomplete root cause fields. Closure dates missing in 18% of records. |
| Finance and budget data | Oracle Financials | Finance Director | Monthly | Structured | Not integrated with any clinical dataset. |
| Patient survey results | Paper, manually entered to Excel | Patient Experience Team | Quarterly | Unstructured | No linkage to demographic or clinical data. |

**Known integrations:** None. All systems operate in isolation. Data sharing between teams occurs via manual email of spreadsheet extracts.

---

### Document 3: `Governance_Policy_Excerpts.docx`

---

**Midvale Community Health Trust — Data Governance Policy (Excerpts)**
*(Fictional — for training purposes only)*

**Version:** 2.1 | **Approved:** March 2024 | **Review due:** March 2026

**Section 3 — Data Ownership**
Each dataset must have a named data owner at senior management level. Data owners are responsible for approving access requests and ensuring data quality. At the time of writing, data owners have been formally assigned for SystmOne and Datix only. Assignments for RiO, the nursing visit log process, and finance data are outstanding.

**Section 5 — Data Quality**
The Trust commits to maintaining data quality standards in line with NHS Data Quality Maturity Index (DQMI) requirements. A data quality dashboard will be implemented by Q3 2024. As of the policy review date, no such dashboard exists. Data quality assessments are conducted on an ad hoc basis in response to specific reporting requests.

**Section 7 — Data Access and Sharing**
All requests for data sharing outside the Trust must be approved by the Caldicott Guardian. An information sharing agreement (ISA) must be in place before any data is shared. Three ISAs are currently active (with Midlands Ambulance Service, Midvale Borough Council, and the primary care network). No process exists for reviewing or renewing ISAs at expiry.

**Section 9 — Training and Awareness**
All staff with access to patient data are required to complete annual data protection training. Completion rate as of January 2025: 61%. Target: 95%.

**Section 11 — Incident Management**
Data incidents must be reported to the Information Governance Lead within 24 hours. All incidents are logged in Datix. Root cause analysis is required for all incidents graded Serious. In the last 12 months, four Serious data incidents were recorded; root cause analysis was completed for two.

---

### Document 4: `Pain_Points_Log.docx`

---

**Midvale Community Health Trust — Reported Data Pain Points**
*(Fictional — for training purposes only. Collected via staff interviews, October 2024.)*

1. "We can never get a single view of a patient across community nursing, mental health, and the health centres. Each team has their own records and they don't talk to each other." — Community Services Manager

2. "My team spends two days every month manually pulling the activity data for the board report. Half of it is wrong by the time we've finished because the source data is still being updated." — Business Intelligence Lead

3. "We were asked to report on ethnicity data for the ICS quarterly return and couldn't — the field is blank for over 40% of records. Nobody knows whose job it is to fix it." — Information Governance Lead

4. "The nursing visit logs are still on paper. By the time they're scanned and someone types the numbers into Excel, the data is six weeks old. We're making decisions with stale information." — District Nursing Manager

5. "We have a data policy but nobody reads it. I don't even know who the data owner is for half these systems." — Service Manager, Mental Health

6. "Our DSPT submission last year was done in a rush. We marked ourselves as 'Standards Met' on things we probably haven't fully implemented. Nobody challenged it." — Risk and Safety Lead

7. "There's no training on how to code things correctly in SystmOne. New starters just copy what the person before them did. The coding drift is getting worse every year." — Community Health Centre Administrator

---

### Document 5: `Maturity_Framework.docx`

---

**NHS Data Maturity Framework — Assessment Reference**
*(Simplified for training purposes. Based on publicly available NHS frameworks.)*

The framework assesses maturity across six domains on a five-level scale.

**Level definitions:**
- **Level 1 — Initial:** Processes are ad hoc, undocumented, and reliant on individuals. Outcomes are unpredictable.
- **Level 2 — Developing:** Some processes documented and partially followed. Outcomes are inconsistent.
- **Level 3 — Defined:** Processes are documented, standardised, and followed. Outcomes are consistent.
- **Level 4 — Managed:** Processes are measured. Quantitative targets are set and tracked. Data-driven decisions are routine.
- **Level 5 — Optimised:** Continuous improvement is embedded. The organisation proactively improves processes using data.

**Domains:**

**Domain 1 — Data Governance**
Evidence required: Formal data ownership assignments for all key datasets; active data governance board or equivalent; documented and enforced data policies; incident management with root cause analysis; ISA management process.

**Domain 2 — Data Quality**
Evidence required: Defined data quality dimensions (completeness, accuracy, timeliness, consistency); automated quality monitoring; regular quality reporting to board level; documented remediation process; linkage between quality findings and operational action.

**Domain 3 — Data Architecture and Integration**
Evidence required: Documented data architecture; standardised data models; integration between clinical systems; elimination of manual data transfers; use of NHS-recognised standards (SNOMED, FHIR, NHS number as primary key).

**Domain 4 — Analytics and Reporting**
Evidence required: Automated reporting pipelines; self-service analytics capability for operational teams; forward-looking analytics (trends, forecasting); defined KPIs with accountability.

**Domain 5 — Workforce and Culture**
Evidence required: Defined data literacy training; completion rates above 90%; named data roles (data owners, stewards, analysts); data considered in operational planning and decisions.

**Domain 6 — Information Governance and Security**
Evidence required: DSPT compliance with accurate self-assessment; current ISAs with renewal tracking; Caldicott principles embedded; annual audit of access controls; staff completion of mandatory IG training above 90%.

---

## Step 2: Set Up Your Workspace in Copilot

1. Save all five documents to a single folder in your OneDrive: `Capstone/Midvale_Trust/`
2. Open Microsoft Copilot (copilot.microsoft.com or via the M365 app)
3. If Copilot supports file attachment in your version, upload all five documents at the start of the session
4. Alternatively, paste the content of each document into the chat when the prompt instructs you to provide it

> **Exclusion decision to document:** You are deliberately excluding any general knowledge about NHS governance that Copilot already has. The agent must assess Midvale Trust specifically — not a generic NHS trust. Note this exclusion in your project write-up.

---

## Step 3: The Prompt Sequence

Work through these phases in order. Copy each prompt exactly, then paste it into Copilot. After each response, note what the agent did well, what it missed, and what you would change.

---

### Phase 1 — Baseline Orientation (No Context Provided)

**Purpose:** Establish what the agent knows without any context. This is intentional. You will compare this output to Phase 3 to demonstrate why context matters.

**Prompt 1A:**
```
What are the six key domains typically assessed in an NHS data maturity review, and what does Level 3 maturity look like in each domain? Respond in a structured table format with one row per domain.
```

**What to note:** The agent will give a reasonable generic answer. Save this response. You will compare it to the context-informed output in Phase 3 to show the difference context makes. This is your Run 1 baseline.

---

### Phase 2 — Context Loading

**Purpose:** Load the agent with the full context package before any assessment work begins.

**Prompt 2A:**
```
I am conducting a data maturity assessment for a fictional NHS Community Health Trust called Midvale Community Health Trust. This is a training exercise — all data is fictional.

I am going to provide you with five documents. Please read all five carefully before doing any analysis. After reading them, confirm: (1) which systems are in use, (2) which datasets exist, (3) what governance gaps are visible on the surface, and (4) what the trust's deadline and target maturity level are.

Do not begin scoring yet. Just confirm your understanding of the organisation.

[Attach or paste: Trust_Profile.docx, Data_Inventory.docx, Governance_Policy_Excerpts.docx, Pain_Points_Log.docx, Maturity_Framework.docx]
```

**What to note:** Does the agent correctly identify the ICS deadline (April 2027), the target level (Level 3), and the most obvious gaps (paper nursing logs, missing data owners, DSPT self-assessment concerns)? If it misses any, note it as a context failure — the information was there.

---

### Phase 3 — Domain-by-Domain Gap Analysis

**Purpose:** Ask the agent to reason across the documents and score each domain.

**Prompt 3A:**
```
Using only the five documents I provided — not general knowledge about NHS organisations — assess Midvale Community Health Trust against each of the six domains in the NHS Data Maturity Framework.

For each domain:
1. State the current maturity level (1–5) and explain your reasoning with specific evidence from the documents
2. List the specific gaps preventing the trust from reaching Level 3
3. Rate the effort to close each gap: Low / Medium / High

Format your response as a table with these columns:
Domain | Current Level | Evidence from Documents | Gaps to Level 3 | Effort to Close

At the end, flag any domain where the documents did not give you enough information to assess confidently — and say what specific information you would need.
```

**What to note:** This is the core analytical step. Check whether the agent:
- Uses specific quotes or references from the documents (good)
- Makes up information not in the documents (bad — this is hallucination)
- Correctly identifies the paper nursing logs as a major architecture gap
- Flags the DSPT self-assessment honesty issue from the Pain Points Log
- Notes the missing data owners from the Governance Policy

---

### Phase 4 — Prioritisation

**Purpose:** Ask the agent to make a prioritised recommendation, not just a list.

**Prompt 4A:**
```
Based on your assessment, identify the five most critical gaps that Midvale Community Health Trust must address to reach Level 3 across all domains by April 2027.

For each gap:
1. Name the gap clearly (one sentence)
2. Which domain it blocks
3. Why it is critical (consequence of not addressing it)
4. A recommended first action the Trust should take in the next 90 days
5. Who should own it (by role, not name)

Present this as a numbered priority list, most critical first. Justify why you ranked them in this order.
```

**What to note:** Does the agent produce a logical priority order? Does it justify the ranking with reference to the April 2027 deadline and the ICS joining condition? Does it recommend realistic first actions (not vague aspirations)?

---

### Phase 5 — Artifact 1: Scoring Matrix

**Purpose:** Produce the first reviewable artifact — a structured scoring matrix suitable for a board report.

**Prompt 5A:**
```
Produce a Data Maturity Scoring Matrix for Midvale Community Health Trust, formatted as a table suitable for inclusion in a board-level report.

The table must include:
- All six domains
- Current maturity level (1–5)
- Target level (3)
- Gap size (difference between current and target)
- Top two evidence points from the documents for each domain
- RAG status: Red = two or more levels below target, Amber = one level below, Green = at or above target

Below the table, add a two-sentence summary for each domain — plain English, suitable for a non-technical trustee audience.

Label this clearly: "Midvale Community Health Trust — Data Maturity Assessment Matrix | Fictional Organisation | [Today's date]"
```

---

### Phase 6 — Artifact 2: Executive Brief

**Purpose:** Produce the second reviewable artifact — a written brief suitable for the CEO or board.

**Prompt 6A:**
```
Write a two-page executive brief for the Midvale Community Health Trust Chief Executive summarising the findings of this data maturity assessment.

Structure:
1. Purpose of the assessment (two sentences)
2. Overall maturity position (one paragraph — plain English, no jargon)
3. Top three risks to meeting the April 2027 ICS deadline (bullet points with one-sentence explanation each)
4. Recommended immediate priorities (the top five from your earlier prioritisation, presented as a numbered action list)
5. Recommended next steps for the board (three concrete decisions the board should make at its next meeting)
6. Closing statement (one paragraph — what success looks like in April 2027)

Tone: professional, direct, and clear. The CEO is not a data specialist. Avoid acronyms unless defined. Do not exceed 650 words.

Label this: "Midvale Community Health Trust — Executive Data Maturity Brief | Fictional Organisation | [Today's date]"
```

---

### Phase 7 — Work Documentation (Trail)

**Purpose:** Make the agent's reasoning visible. You need this for Step 4 of the course requirement.

**Prompt 7A:**
```
Before we finish, I need you to document the work you have done in this session. Write a brief assessment log covering:

1. Documents reviewed — list each document and what key facts you extracted from it
2. Judgements made — for each domain score, note why you chose that level rather than a higher or lower one
3. Uncertainties — list every point where you were uncertain and explain what information you lacked
4. Assumptions — list anything you assumed that was not explicitly stated in the documents

This log is for my own review — it does not need to be polished. Bullet points are fine.
```

---

## Step 4: Run 1 Review Checklist

After completing all seven prompts, evaluate the output against these criteria. Be specific — note the exact line or section that is right or wrong.

**Output review:**

| Check | Pass / Fail | Specific observation |
|-------|-------------|---------------------|
| Scoring matrix has all six domains | | |
| RAG ratings are correctly applied | | |
| Evidence comes from documents, not general knowledge | | |
| Executive brief is under 650 words | | |
| Brief uses plain language appropriate for a CEO | | |
| Priority list is ranked and justified, not just listed | | |
| April 2027 deadline is referenced in recommendations | | |
| Agent flagged at least one domain where evidence was insufficient | | |
| No hallucinated facts (things not in any document) | | |

**Trajectory review (from Prompt 7A log):**

- Did the agent correctly identify which documents contained what information?
- Were the uncertainties it flagged genuine gaps in the documents, or things that were actually there?
- Did it over-rely on general NHS knowledge rather than the specific Midvale documents?

**Lever diagnosis (for each problem found):**

| Problem observed | Lever: Context / Workspace / Instructions |
|-----------------|------------------------------------------|
| | |
| | |

---

## Step 5: Iteration Guide

Use these adjustments based on what failed in Run 1.

**If the agent used general NHS knowledge instead of the documents (Context lever):**

Add this line to the start of Prompt 3A in Run 2:
```
Important: Every finding must include a direct quote or specific reference to one of the five documents I provided. Do not use general knowledge about NHS organisations. If the documents do not contain enough information to make a judgement, say so explicitly.
```

**If the executive brief was too technical or too long (Instructions lever):**

Replace Prompt 6A's tone guidance with:
```
Write this as if explaining to a trusted colleague who has no data background. Use short sentences. Avoid all technical terms. If you must use a term like "data governance," explain it in the same sentence. Read each paragraph back and ask: would a non-specialist understand every word? If not, rewrite it.
```

**If the scoring was too generous or too vague (Instructions lever):**

Add to Prompt 3A in Run 2:
```
For each domain, challenge your own score: what would need to be true for this trust to be at Level 3? Is there solid evidence that all those conditions are met? If any condition is missing, the score cannot be Level 3. Be conservative — it is better to under-score and note the uncertainty than to over-score and mislead the board.
```

**If the agent missed the DSPT honesty issue (Context lever):**

Before Prompt 3A in Run 2, add:
```
Before you score Domain 6 (Information Governance and Security), re-read the sixth entry in Pain_Points_Log.docx. The Risk and Safety Lead has made a statement about the accuracy of the DSPT self-assessment. This is a significant finding that must be reflected in the Domain 6 score and in the executive brief's risk section.
```

**Run 2 comparison template:**

After Run 2, document:
- What changed in the prompt or context
- What specifically improved in the output
- What still needs work
- Whether a Run 3 is needed and why

---

## Portfolio and Showcase Notes

This project demonstrates three things clearly:

1. **Prompt engineering skill** — the progression from orientation to context-loading to structured analysis to artifact production shows deliberate, staged prompting, not one-shot trial and error.

2. **Domain expertise applied to AI** — you can judge the output because you know what a real data maturity assessment looks like. This is what makes your evaluation credible.

3. **Understanding of agent limitations** — the work documentation prompt (Phase 7) and your Run 1 review demonstrate that you understand the difference between a right answer and a confidently wrong one.

**For GitHub:** Create a repo called `agentic-ai-capstone` with:
- This guide as `README.md`
- Your five context documents (already fictional — safe to share)
- Screenshots of Run 1 and Run 2 outputs side by side
- A `REFLECTION.md` file covering your lever diagnoses and what changed between runs

**Suggested LinkedIn post angle:** "I designed a multi-step agentic AI task in a healthcare context and ran it twice with deliberate prompt iteration. Here is what I learned about the difference between prompting and instructing." — Link to the GitHub repo.

---

*All organisations, individuals, and data in this project are entirely fictional and created for educational purposes. Any resemblance to real NHS trusts, staff, or clinical data is coincidental.*
