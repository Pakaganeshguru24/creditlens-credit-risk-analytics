# CreditLens — Credit Risk Analytics

**Python · SQL Server · Power BI**

CreditLens is an end-to-end analytics project that turns loan and borrower data into an interactive Power BI report. Python is used to clean and prepare the data, SQL Server is used to explore and analyze it, and Power BI presents the results across three report pages.

## Report preview

The screenshots below show the completed three-page report. The files are included in this package under `screenshots/`.

### 1. Portfolio Performance · Credit Risk · Default Analysis

![Credit Lens portfolio performance, credit risk, and default analysis dashboard](screenshots/01-portfolio-performance-credit-risk-default.png)

### 2. Customer & Credit Analysis

![Credit Lens customer and credit analysis dashboard](screenshots/02-customer-credit-analysis.png)

### 3. Loan Performance

![Credit Lens loan performance dashboard](screenshots/03-loan-performance.png)

## Project goals

- Prepare loan and borrower data for analysis using Python.
- Use SQL Server to examine portfolio composition and credit-risk patterns.
- Present the analysis in a three-page Power BI report.
- Make analytical limitations visible so that patterns are not presented as causal or more certain than the data allows.

## Tools and workflow

1. **Python — data cleaning:** Python is used to clean and prepare the loan dataset before analysis. The exact cleaning operations should be documented alongside the project notebook or script.
2. **SQL Server — analysis:** SQL Server is used to query the prepared data and examine loan, borrower, and default patterns. Include the actual SQL scripts in the repository so the analysis can be reviewed.
3. **Power BI — reporting:** an interactive report presents portfolio performance, customer and credit characteristics, and loan performance across three pages.

## Findings and interpretation

The following figures are descriptive values visible in the report screenshots. Card and chart labels use rounding (for example, K and M); use the underlying data or Power BI measures for precise values.

- **Portfolio:** the overview reports 32K total loans, 7K defaulted loans, and a 21.59% default rate. Its status chart labels 6.81K defaulted and 24.72K non-defaulted loans, with 31.522K shown in the chart center. These rounded/displayed totals differ; validate the underlying measure definitions and filters before presenting them as an exact reconciliation.
- **Risk grades:** the overview displays default rates rising from 9.56% for Grade A to 98.44% for Grade G. The loan-performance page shows about 10.3K Grade A loans and 0.1K Grade G loans, so the Grade G rate is based on a much smaller group and should be treated cautiously.
- **Loan intent:** displayed default rates are highest for debt consolidation (28.45%) and medical loans (26.60%), and lowest for venture loans (14.70%). These are descriptive associations and do not show that loan intent causes default.
- **Customer analysis:** the screenshot shows default rates of 6.94% for homeowners, 12.50% for mortgage holders, 31.12% for renters, and 31.13% for the “other” home-ownership group. The chart does not show group counts, so avoid comparing the reliability of these rates without checking sample sizes.
- **Loan performance:** the report displays a total loan amount of 305M, average loan amount of 9.66K, and average interest rate of 11.05. Currency and the interest-rate unit are not specified in the available project notes; do not add a currency symbol or percent sign without verifying the source and measure formatting.

### Interpretation caveats

- **Currency is unspecified.** Report monetary amounts without naming a currency until the source data or project documentation confirms it.
- **Grade G has a small sample.** Treat estimates for Grade G as less stable; show the sample count and avoid broad conclusions from that group.
- **Association is not causation.** Relationships in these descriptive analyses do not establish that one factor caused another.
- **Previous-default numeric mapping is unverified.** Confirm what the numeric values mean before interpreting or labeling them. Until verified, do not assign semantics such as “yes/no” or “number of defaults.”
- **Interest rate has 3,027 missing values.** State how those records were handled in each analysis. Do not imply that missing rates were zero or that results using interest rate cover the full dataset unless that is confirmed.

