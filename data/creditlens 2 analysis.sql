SELECT TOP 10 *
FROM dbo.LoanData;

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN loan_int_rate IS NULL THEN 1 ELSE 0 END)
        AS missing_interest_rates,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        AS defaulted_loans,
    SUM(CASE WHEN loan_status = 0 THEN 1 ELSE 0 END)
        AS non_defaulted_loans
FROM dbo.LoanData;


SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        AS defaulted_loans,
    CAST(
        100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5, 2)
    ) AS default_rate_percent
FROM dbo.LoanData
GROUP BY loan_grade
ORDER BY default_rate_percent DESC;

SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        AS defaulted_loans,
    CAST(
        100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5, 2)
    ) AS default_rate_percent
FROM dbo.LoanData
GROUP BY loan_intent
ORDER BY default_rate_percent DESC;

SELECT
    CASE
        WHEN person_income < 25000 THEN 'Below 25K'
        WHEN person_income < 50000 THEN '25K-50K'
        WHEN person_income < 75000 THEN '50K-75K'
        WHEN person_income < 100000 THEN '75K-100K'
        ELSE '100K+'
    END AS income_group,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        AS defaulted_loans,
    CAST(
        100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5, 2)
    ) AS default_rate_percent
FROM dbo.LoanData
GROUP BY
    CASE
        WHEN person_income < 25000 THEN 'Below 25K'
        WHEN person_income < 50000 THEN '25K-50K'
        WHEN person_income < 75000 THEN '50K-75K'
        WHEN person_income < 100000 THEN '75K-100K'
        ELSE '100K+'
    END
ORDER BY MIN(person_income);