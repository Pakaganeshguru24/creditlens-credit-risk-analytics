create database creditlens

use creditlens

CREATE TABLE LoanData (
    person_age INT,
    person_income BIGINT,
    person_home_ownership VARCHAR(20),
    person_emp_length DECIMAL(5, 2),
    loan_intent VARCHAR(30),
    loan_grade CHAR(1),
    loan_amnt INT,
    loan_int_rate DECIMAL(5, 2) NULL,
    loan_status TINYINT,
    loan_percent_income DECIMAL(10, 6),
    cb_person_default_on_file CHAR(1),
    cb_person_cred_hist_length INT
);
GO

SELECT TOP 10 *
FROM LoanData;

SELECT [dbo].[creditlens_cleaned]
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

select * from 
[dbo].[creditlens_cleaned]

USE CreditLens;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT TOP 10 *
FROM dbo.creditlens_cleaned;

SELECT COUNT(*) AS existing_rows
FROM dbo.LoanData;

select count (*) as rows
from [dbo].[creditlens_cleaned]

INSERT INTO dbo.LoanData (
    person_age,
    person_income,
    person_home_ownership,
    person_emp_length,
    loan_intent,
    loan_grade,
    loan_amnt,
    loan_int_rate,
    loan_status,
    loan_percent_income,
    cb_person_default_on_file,
    cb_person_cred_hist_length
)
SELECT
    person_age,
    person_income,
    person_home_ownership,
    person_emp_length,
    loan_intent,
    loan_grade,
    loan_amnt,
    loan_int_rate,
    loan_status,
    loan_percent_income,
    cb_person_default_on_file,
    cb_person_cred_hist_length
FROM dbo.creditlens_cleaned;


SELECT COUNT(*) AS final_rows
FROM dbo.LoanData;