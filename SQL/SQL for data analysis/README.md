# Introduction
This is the summary of my learning in the SQL course with [Luke Barousse](https://www.youtube.com/watch?v=7mz73uXD9DA) It was great to have a curated learning for sql.
# Background
The Five data sets used and sql table preparation files were stored in my google drive [link](https://drive.google.com/drive/folders/1i6VaqmMK7b4QVoWbPV8ViaZXbHDZFjh7?usp=sharing)
# Tools Used
I used PostgresSQL on VSCode and load the csv files into my database tables. 
# The Analysis
## Sessions involved
-- Basic Query
'''SQL
select 
    job_id, 
    job_title_short,
    job_location,
    job_via
 from 
    job_postings_fact
 order by 
    job_location asc;
'''
-- Comparisons Queries
'''SQL
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    job_location ='Tampa, FL'
 order by 
    job_id asc;
'''
-- Wildcards
'''Sql
Select 
    name
from
    company_dim
where 
    name like '%Tech_' 
order by 
    name asc;
'''
-- Alias
'''Sql
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via as job_posted_site,
    job_posted_date,
    salary_year_avg as avg_yearly_salary
 from 
    job_postings_fact
 order by 
    job_id asc;
'''
-- Operations
''' Sql
Select 
    activity_id,
    hours_spent,
    hours_rate,
    hours_spent + hours_rate  as added_value
from
    invoices_fact
order by 
    activity_id;'''
-- Aggregations
'''sql
SELECT 
	COUNT(*) AS jobs_with_health_insurance
FROM 
	job_postings_fact
WHERE 
	job_health_insurance = TRUE;'''
-- Null Values
''' Sql
SELECT 
	skill_id, 
	skills
FROM 
	skills_dim
WHERE 
	type IS NULL;'''
-- Joins
'''sql
SELECT 
    job_postings_fact.job_id,
    job_postings_fact.job_title, 
    company_dim.name,
    job_postings_fact.job_location,
    job_postings_fact.job_posted_date
FROM 
    job_postings_fact 
INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_postings_fact.job_title_short = 'Data Scientist'
ORDER BY    
    job_postings_fact.job_posted_date DESC;'''
-- Date Functions
'''sql
SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS avg_yearly_salary,
    AVG(salary_hour_avg) AS avg_hourly_salary
FROM
    job_postings_fact
WHERE
    job_posted_date::date > '2023-06-01'
GROUP BY
    job_schedule_type
ORDER BY
	job_schedule_type;
'''
--Manipulating tables
''' Sql
CREATE TABLE data_science_jobs (
    job_id INT PRIMARY KEY,
    job_title TEXT,
    company_name TEXT,
    post_date DATE
);'''
-- Case Statements
'''Sql
SELECT
  job_id,
  job_title,
  salary_year_avg,
  CASE 
    WHEN salary_year_avg > 100000 THEN 'High salary'
	WHEN salary_year_avg BETWEEN 60000 and 99000 THEN 'Standard salary'
    WHEN salary_year_avg < 60000 THEN 'Low salary'
  END AS salary_category
FROM 
	job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
    and job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;'''
-- Subqueries
'''SQL
SELECT skills_dim.skills
FROM skills_dim
INNER JOIN (
    SELECT skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY COUNT(job_id) DESC
    LIMIT 5
) AS top_skills ON skills_dim.skill_id = top_skills.skill_id;
'''
-- Common Tabular Expressions(CTEs)
'''sql
WITH title_diversity AS (
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS unique_titles  
    FROM job_postings_fact
    GROUP BY company_id  
)
-- Get company name and count of how many unique titles each company has
SELECT
    company_dim.name,  
    title_diversity.unique_titles  
FROM title_diversity
	INNER JOIN company_dim ON title_diversity.company_id = company_dim.company_id  
ORDER BY 
	unique_titles DESC  
LIMIT 10;  '''
-- Union Operators
'''sql
(
    SELECT 
        job_id, 
        job_title, 
        'With Salary Info' AS salary_info  -- Custom field indicating salary info presence
    FROM 
        job_postings_fact
    WHERE 
        salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL  
)
UNION ALL
 -- Select job postings without salary information
(
    SELECT 
        job_id, 
        job_title, 
        'Without Salary Info' AS salary_info  -- Custom field indicating absence of salary info
    FROM 
        job_postings_fact
    WHERE 
        salary_year_avg IS NULL AND salary_hour_avg IS NULL 
)
ORDER BY 
	salary_info DESC, 
	job_id; '''

# What I Learned
This is a good sql refreshing course and I revalidated my knowledge of writing sql scripts
# Conclusion
Data roles involved continious learning and courses like this gives you all you need to know at a glance and thank you for learning through this codes shared here.
Thank you
