# CreditLens: Credit Risk Analytics

CreditLens is an end-to-end data analytics and risk evaluation project designed to analyze borrower risk profiles, evaluate default patterns, and extract actionable financial insights using Python and SQL.

---

## Repository Structure

```text
creditlens-credit-risk-analytics/
│
└── data/
    ├── credit_risk_dataset.csv
    ├── CreditLens_01_Data_Exploration.ipynb
    ├── credit lens 1 analyiss.sql
    ├── creditlens 2 analysis.sql
    ├── credit lens 3.sql
    └── Screenshots/ (Visual exploration outputs)

```

* **[credit_risk_dataset.csv](https://github.com/Pakaganeshguru24/creditlens-credit-risk-analytics/blob/main/data/credit_risk_dataset.csv):** Raw dataset containing borrower attributes, loan amounts, interest rates, employment history, and historical default indicators.
* **[CreditLens_01_Data_Exploration.ipynb](https://github.com/Pakaganeshguru24/creditlens-credit-risk-analytics/blob/main/data/CreditLens_01_Data_Exploration.ipynb):** Jupyter Notebook containing initial exploratory data analysis, data cleaning, handling missing values, and statistical distributions.
* **[credit lens 1 analyiss.sql](https://github.com/Pakaganeshguru24/creditlens-credit-risk-analytics/blob/main/data/credit%20lens%201%20analyiss.sql):** Baseline SQL queries establishing initial borrower metrics and portfolio risk segmentation.
* **[creditlens 2 analysis.sql](https://github.com/Pakaganeshguru24/creditlens-credit-risk-analytics/blob/main/data/creditlens%202%20analysis.sql):** Intermediate SQL queries examining credit history lengths, loan grade impacts, and default trends.
* **[credit lens 3.sql](https://github.com/Pakaganeshguru24/creditlens-credit-risk-analytics/blob/main/data/credit%20lens%203.sql):** Advanced SQL aggregations and risk scoring metrics.

---

## Key Features & Analyses

* **Data Wrangling & EDA:** Inspected data distributions, checked for missing values and anomalies, and uncovered primary correlations influencing loan defaults using Python.
* **Risk Segmentation:** Categorized borrowers into distinct risk tiers based on income, loan-to-income ratios, and credit history indicators.
* **Structured SQL Queries:** Leveraged multi-stage SQL scripts to aggregate portfolio-level metrics, analyze default rates across different loan grades, and evaluate financial exposure.

---

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/Pakaganeshguru24/creditlens-credit-risk-analytics.git

```


2. Place or verify the dataset inside the `data/` folder.
3. Open `CreditLens_01_Data_Exploration.ipynb` to review the data pipeline and exploratory steps.
4. Execute the SQL scripts (`credit lens 1 analyiss.sql`, `creditlens 2 analysis.sql`, and `credit lens 3.sql`) sequentially in your database environment to replicate the analytical findings.
