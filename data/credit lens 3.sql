select 
case when loan_percent_income<=0.10 then'0-10%'
     when loan_percent_income<=0.20 then'10-20%'
     when loan_percent_income<=0.30 then'20-30%'
     else 'Above 30%'
    end as loan_income_group,
    count(*) total_loans,
    sum(case 
    when loan_status=1 then 1 else 0
    end)
    as defaulted_loans,
  cast(
  100*sum(case when loan_status=1 then 1 else 0 end)/count(*) as decimal(5,2))
  as default_rate_percent
  from LoanData
  group by 
  case when loan_percent_income<=0.10 then'0-10%'
     when loan_percent_income<=0.20 then'10-20%'
     when loan_percent_income<=0.30 then'20-30%'
     else 'Above 30%'
     end
     order by min(loan_percent_income);


select * from creditlens_cleaned
select * from LoanData


select
 cb_person_default_on_file as previous_default,
 count(*) as total_loans,
 sum(case when loan_status=1 then 1 else 0 end)
 as defaulted_loans,
 cast(100*sum(case when loan_status=1 then 1 else 0 end) /count(*) as decimal (5,2))
 as default_rate_percent
 from LoanData
 group by cb_person_default_on_file
 order by default_rate_percent desc;

 SELECT
    cb_person_default_on_file AS previous_default,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        AS defaulted_loans,
    CAST(
        100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5, 2)
    ) AS default_rate_percent
FROM dbo.LoanData
GROUP BY cb_person_default_on_file
ORDER BY default_rate_percent DESC;

SELECT
    CASE
        WHEN loan_int_rate < 8 THEN 'Below 8%'
        WHEN loan_int_rate < 12 THEN '8-12%'
        WHEN loan_int_rate < 16 THEN '12-16%'
        ELSE '16% and above'
    END AS interest_rate_group,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        AS defaulted_loans,
    CAST(
        100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5, 2)
    ) AS default_rate_percent
FROM dbo.LoanData
WHERE loan_int_rate IS NOT NULL
GROUP BY
    CASE
        WHEN loan_int_rate < 8 THEN 'Below 8%'
        WHEN loan_int_rate < 12 THEN '8-12%'
        WHEN loan_int_rate < 16 THEN '12-16%'
        ELSE '16% and above'
    END
ORDER BY MIN(loan_int_rate);


CREATE VIEW LoanGradeRisk AS
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
GROUP BY loan_grade;
GO

SELECT *
FROM LoanGradeRisk
ORDER BY default_rate_percent DESC;


select loan_status,
cast(100*sum(case when loan_status=1 then 1 else 0 end )/
  count(*) as decimal(5,2)) as default_status
from loandata
group by loan_status
order by loan_status desc



select loan_status,count(loan_status)as total_status,100*count(*)/(select count(*)from LoanData
where loan_status in (1,0)) as default_percentage
from LoanData
where loan_status in(1,0)
group by Loan_status
order by loan_status desc


select loan_status,count(*) as total_status,
cast(100.0*count(*)/sum(count(*)) over() as decimal(5,2))as percentage
from LoanData
group by loan_status
order by loan_status desc

WITH GradeStats AS (
    SELECT
        loan_grade,
        COUNT(*) AS total_loans,
        SUM(CASE
            WHEN loan_status = 1 THEN 1
            ELSE 0
        END) AS defaulted_loans,
        100.0 * SUM(CASE
            WHEN loan_status = 1 THEN 1
            ELSE 0
        END) / COUNT(*) AS default_rate
    FROM dbo.LoanData
    GROUP BY loan_grade
)
SELECT
    loan_grade,
    total_loans,
    defaulted_loans,
    CAST(default_rate AS DECIMAL(5,2))
        AS default_rate_percent,
    CAST(AVG(default_rate) OVER () AS DECIMAL(5,2))
        AS average_grade_default_rate
FROM GradeStats
ORDER BY default_rate DESC;