
-------------------------------Basic-------------------------------------------
/* Questinon 1: In the job_postings_fact table get the columns 
job_id, job_title_short , job_location , and job_via columns. 
And order it in ascending order by job_location.

*/

select 
    job_id, 
    job_title_short,
    job_location,
    job_via
 from 
    job_postings_fact
 order by 
    job_location asc;


 /* Question 2: In the job_postings_fact table get the columns 
 job_id, job_title_short , job_location , and job_via columns. 
 And order it in descending order by job_title_short.
 */
 select 
    job_id, 
    job_title_short,
    job_location,
    job_via
 from 
    job_postings_fact
 order by 
    job_title_short desc;

/*Question 3: Look at only the first 10 entries for a query in the 
job_postings_fact table that returns job_id, job_title_short, 
job_location, job_via columns. Order by the job_location in ascending order.
🔎 Hint: To only get the first 10 entries use LIMIT.
*/
 select 
    job_id, 
    job_title_short,
    job_location,
    job_via
 from 
    job_postings_fact
 order by 
    job_location asc
limit 10;

/*Question 4: Get the unique job locations in the job_postings_fact table. 
Return the results in alphabetical order.

🔎 Hint:
To get unique job locations use DISTINCT.
To get the results in alphabetical order use ORDER BY.
*/
 select 
    DISTINCT(job_location) unq_Location
 from 
    job_postings_fact
 order by 
    job_location asc;

/*Question 5: In the job_postings_fact table get the columns 
job_id, job_title_short , job_location , job_via , and salary_year_avg columns.
Order by job_id in ascending order. 
And only look at rows where job_title_short is ‘Data Engineer’.
*/
 select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    job_title_short = 'Data Engineer'
 order by 
    job_id desc;

-----------------------------Comparisons-------------------------------------------
/*Question 1:

In the job_postings_fact table get the job_id, job_title_short, 
job_location, job_via, and salary_year_avgcolumns. Order by job_id in ascending order.
Only return rows where the job location is in ‘Tampa, FL’.
*/

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

/*Question 2:
In the job_postings_fact table get the job_id, job_title_short, job_location, 
job_via, salary_year_avg, and job_schedule_type columns. Order by job_id in 
ascending order. Only return ‘Full-time’ jobs.

🔎 Hint:
Look at the job_schedule_type column.
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_schedule_type
 from 
    job_postings_fact
where 
    job_schedule_type ='Full-time'
 order by 
    job_id asc;

/*Question 3:

In the job_postings_fact table get the job_id, job_title_short, job_location,
 job_via,  job_schedule_type, and salary_year_avg columns. Order by job_id in 
 ascending order. Only look at jobs that are not ‘Part-time’ jobs.

🔎 Hint:
Look at the job_schedule_type column. 
There are some other ways of writing this WHERE clause:
job_schedule_type <> 'Part-time'
NOT job_schedule_type = 'Part-time'
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_schedule_type
 from 
    job_postings_fact
where 
    job_schedule_type !='Part-time'
 order by 
    job_id asc;

/*Question 4:

In the job_postings_fact table get the job_id, job_title_short, job_location,
 job_via, and salary_year_avg columns. Order by job_id in ascending order. 
 Only look at jobs that are not posted ‘via LinkedIn’.
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_schedule_type
 from 
    job_postings_fact
where 
    job_via !='via LinkedIn'
 order by 
    job_id asc;

/*Question 5:

In the job_postings_fact table only get jobs that have an average yearly salary of 
$65,000 or greater. Also get the job_id, job_title_short, job_location, job_via, 
and salary_year_avg columns. Order by job_id in ascending order.
*/

Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    salary_year_avg >= 65000
 order by 
    job_id asc;

/*Question 6:
In the job_postings_fact table only get jobs that have an average yearly salary 
greater than $55,000. Also get the job_id, job_title_short, job_location, job_via, 
and salary_year_avg columns. Order by job_id in ascending order.
*/

Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    salary_year_avg > 55000
 order by 
    job_id asc;

/*Question 7:

In the job_postings_fact table only get jobs that have an average yearly salary less 
than $110,000. Also return the job_id, job_title_short, job_location, job_via, and 
salary_year_avg columns. Order by job_id in ascending order.
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    salary_year_avg < 110000
 order by 
    job_id asc;

/*Question 8:

In the job_postings_fact table only get jobs that have an average yearly salary less 
than or equal to $150,000. Also return the job_id, job_title_short, job_location, 
job_via, and salary_year_avg columns. Order by job_id in ascending order.
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    salary_year_avg <= 150000
 order by 
    job_id asc;

/*Question 9:

Return only Data Engineer’ jobs located within the ‘United States’ from the 
job_postings_fact table. Also get the job_id, job_title_short, job_location, 
job_via and salary_year_avg columns. Order by job_id in ascending order.
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    job_title_short = 'Data Engineer' and 
    job_location = 'United States'
 order by 
    job_id asc;

/*Question 10:

In the job_postings_fact table let’s look at jobs that are either ‘Full-Time’ or 
‘Contractor’ jobs. And return the job_id, job_title_short, job_location, job_via, 
salary_year_avg, and job_schedule_type columns. Order by job_id in ascending order.
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_schedule_type
 from 
    job_postings_fact
where 
    job_schedule_type = 'Full-Time' or
    job_schedule_type = 'Contractor' 
 order by 
    job_id asc;

/*Question 11:
Only return jobs with a salary between (inclusive) $50,000 and $70,000 from the 
job_postings_fact table. And get the job_id, job_title_short, job_location, 
job_via and salary_year_avg columns. Order by job_id in ascending order.

Note: Write this without using BETWEEN; the next problem will be solved using this.
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    salary_year_avg >= 50000 and
    salary_year_avg <= 70000 
 order by 
    job_id asc;

/*Question 12:

Rewrite the same query from the last problem but using the BETWEEN operator.
*/
Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    salary_year_avg BETWEEN 50000 and 70000 
 order by 
    job_id asc;

/*Question 13:

Return job_title_short that are ‘Data Scientist’ or ‘Business Analyst’ roles from the
job_postings_facttable. Also, return the job_id, job_title_short, job_location, 
job_via and salary_year_avg columns. Order by job_id in ascending order.*/

Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    job_title_short = 'Data Scientist' or
    job_title_short = 'Business Analyst' 
 order by 
    job_id asc;

/*Question 14:

Return job_title_short that are ‘Data Analyst’, ‘Data Scientist’ or ‘Business Analyst’
roles from the job_postings_fact table using the IN operator. Also, return the job_id,
job_title_short, job_location, job_via and salary_year_avg columns. Order by job_id 
in ascending order.
*/

Select 
    job_id, 
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
 from 
    job_postings_fact
where 
    job_title_short in ('Data Analyst','Data Scientist','Business Analyst') 
 order by 
    job_id asc;

/*Question 15:

In the job_postings_fact table look at Data Analyst jobs whose average yearly salary 
range is between $50,000 and $75,000. Return the job_id, job_title_short, job_location
and salary_year_avg. Order by job_id in ascending order.
*/

Select 
    job_id, 
    job_title_short,
    job_location,
    salary_year_avg
 from 
    job_postings_fact
where 
    job_title_short = 'Data Analyst' and
    salary_year_avg between 50000 and 75000 
 order by 
    job_id asc;

/*Question 16:
In the job_postings_fact table look at Data Analyst and Business Analyst jobs whose 
average yearly salary range is greater than $75,000. Return the job_id, 
job_title_short, job_location, salary_year_avg, and job_schedule_type. 
Order by job_id in ascending order.
*/

Select 
    job_id, 
    job_title_short,
    job_location,
    salary_year_avg
 from 
    job_postings_fact
where 
    job_title_short in ('Data Analyst','Business Analyst') and
    salary_year_avg > 75000 
 order by 
    job_id asc;


------------------------Wildcards----------------------------------------------------------
/*Question 1:
In the company_dim table find all company names that include ‘Tech’ immediately followed 
by any single character. Return the name column and return in ascending order by the company
name. */
Select 
    name
from
    company_dim
where 
    name like '%Tech_' 
order by 
    name asc;

/*Question 2:
Find all job postings in the job_postings_fact where the job_title includes "Engineer" in it
with ONLY one character followed after the term. Get the job_id , job_title, and 
job_posted_date. Order by job_id in ascending order.
*/

Select 
    job_id, 
    job_title,
    job_posted_date
 from 
    job_postings_fact
where 
    job_title like '%Engineer_'
 order by 
    job_id asc;

/*Question 3:

Identify job postings in the job_postings_fact table where the job_title contains the 
pattern "a_a" anywhere in the title. Return the job_id and job_title columns. Order by 
job_id in ascending order.

Note “a_a” is just a random pattern and can be modified to any patter you wish.*/

Select 
    job_id, 
    job_title,
 from 
    job_postings_fact
where 
    job_title like '%a_a%'
 order by 
    job_id asc;

------------------------Alias----------------------------------------------------

/*Question:
From the job_postings_fact return the following columns: job_id, job_title_short , 
job_location, job_via, job_posted_date, and salary_year_avg. Also, rename the following:
 job_via to job_posted_site and salary_year_avg to avg_yearly_salary. Order by job_id in ascending order.
*/
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

-------------------------------Operation----------------------------------------------
/*Question 1:
In the invoices_fact table add the hours_spent to the hours_rate and rename this new column
to added_value. Order by activity_id in ascending order.*/

Select 
    activity_id,
    hours_spent,
    hours_rate,
    hours_spent + hours_rate  as added_value
from
    invoices_fact
order by 
    activity_id;

/*Question 2:
In the invoices_fact table divide the hours_spent by the hours_rate and rename this column 
to efficiency_ratio. Return the activity_id as well. Order by activity_id in ascending order.*/
Select 
    activity_id,
    hours_spent / hours_rate as efficiency_ratio
from
    invoices_fact
order by 
    activity_id;

/*Question 3:
In the invoices_fact tables subtract the hours_rate from the hours_spent and rename this new
column to estimate_budget. Return the activity_id column as well. Order by activity_id in
ascending order. */
 Select 
    activity_id,
    hours_spent - hours_rate as estimate_budget
from
    invoices_fact
order by 
    activity_id;

/*Question 4:
In the invoices_fact table multiply the hours_spent by hours_rate and then add a fixed fee 
of $10. Rename this new column to adjusted_cost. Also return the activity_id. Order by 
activity_id in ascending order.*/

Select 
    activity_id,
    (hours_spent * hours_rate) + 10 as adjusted_cost
from
    invoices_fact
order by 
    activity_id;

-------------------------------------Aggregation----------------------------------------
/*Question 1:
In the job_postings_fact table count the total number of job postings that 
offer health insurance.

🔎 Hint:
Use the job_health_insurance column to determine if a job posting offers health 
insurance (TRUE means it does offer health insurance).
*/
SELECT 
	COUNT(*) AS jobs_with_health_insurance
FROM 
	job_postings_fact
WHERE 
	job_health_insurance = TRUE;

/*Question 2:
In the job_postings_fact table count the number of job postings available for each country. 
Return job_country and the job count. Order by job_country in ascending order.

🔎 Hint:
Use the job_country column to group the job postings, and count the number of 
job postings (job_id) within each country group.
*/
SELECT 
    job_country,
	COUNT(job_id) AS jobs_count
FROM 
	job_postings_fact
group by
    job_country
order by 
    job_country;

/*Question 3:
In the job_postings_fact table calculate the total sum of the average yearly salary 
(salary_year_avg) for all job postings that are marked as fully remote and divide it 
by the total count of salary_year_avg. To get the total average yearly salary for fully 
remote jobs. Ensure to only include job postings where a yearly salary is specified 
(salary_year_avg IS NOT NULL).

🔎 Hint:
To find jobs that are fully remote look at the values in job_work_from_home column.
Only include job postings where a yearly salary is specified 
(WHERE salary_year_avg IS NOT NULL).
*/
SELECT 
	SUM(salary_year_avg) / COUNT(salary_year_avg) AS total_yearly_salary_remote
FROM 
	job_postings_fact
WHERE 
	job_work_from_home = TRUE
	AND salary_year_avg IS NOT NULL;

/*Question 4:

In the job_postings_fact table find the minimum and maximum yearly salaries 
(salary_year_avg) offered for job postings in locations that include ‘San Francisco’ 
in the location title. The query should return two columns: one for the minimum yearly 
salary and one for the maximum yearly salary, considering only job postings that specify 
a yearly salary (salary_year_avg IS NOT NULL).

🔎 Hint:
To be more accurate use LIKE when searching for the location. In case locations aren’t 
in a specific format like `San Francisco, CA'.
*/

SELECT 
	MIN(salary_year_avg) AS min_yearly_salary, 
  MAX(salary_year_avg) AS max_yearly_salary
FROM 
	job_postings_fact
WHERE 
	salary_year_avg IS NOT NULL
	AND job_location LIKE '%San Francisco%';

/*Question 5:

In the job_postings_fact table determine the average yearly salaries (salary_year_avg) 
for ‘Data Scientist’ job postings. Your query should return one columns for the average 
yearly salary. Only include jobs that have a yearly salary (salary_year_avg IS NOT NULL).

🔎 Hint:

Only include job postings where a yearly salary is specified 
(WHERE salary_year_avg IS NOT NULL).*/

SELECT 
	AVG(salary_year_avg) AS avg_yearly_salary
FROM 
	job_postings_fact
WHERE 
	salary_year_avg IS NOT NULL
	AND job_title ='Data Scientist'; 

/*Question 6:

Using the job_postings_fact table find the average, minimum, and maximum salary range 
for each job_title_short. Only include job titles with more than 5 postings and group 
data by job_title_short . Order by job_title_short in ascending order.

🔎 Hint:
To get jobs with more than 5 postings this requires filtering on an aggregate function 
since you need to count job postings, use HAVING.
*/

SELECT 
  job_title_short,
  AVG(salary_year_avg) AS avg_salary,
  MIN(salary_year_avg) AS lowest_avg_salary_offered, 
  MAX(salary_year_avg) AS highest_avg_salary_offered 
FROM 
  job_postings_fact
GROUP BY 
  job_title_short
HAVING 
  COUNT(job_id) > 5
ORDER BY
	job_title_short;

/*Question 7:

In the job_postings_fact table list countries along with their average yearly salary 
(salary_year_avg) for job postings, where the average yearly salary exceeds $100,000. 
Group the results by job_country. Only get job postings where there is an average yearly
salary included (salary_year_avg IS NOT NULL).

🔎 Hint:
To get jobs that have a greater average yearly salary of $100,000, this requires 
filtering on an aggregate function since you need to count job postings, use HAVING.
*/

SELECT 
	job_country, 
	AVG(salary_year_avg) AS average_salary
FROM 
	job_postings_fact
WHERE 
	salary_year_avg IS NOT NULL
GROUP BY 
	job_country
HAVING 
	AVG(salary_year_avg) > 100000;

/*Question 8:
In the job_postings_fact table count the number of job postings for each location 
(job_location) that do NOT offer remote work. Display the location and the count of 
non-remote job postings, and order the results by the count in descending order. 
Show locations where the average salary for non-remote jobs is above $70,000.

🔎 Hint:

To get jobs that have a greater average yearly salary of $70,000, this requires 
filtering on an aggregate function since you need to count job postings, use HAVING.

To look at the remote jobs look at the job_work_from_home column.

NOTE: If you try to filter out remote work jobs using job_location, you’ll 
find that Anywhere appears twice, this is due to this column needing to be cleaned up.
 (I.e., one value has an extra trailing space). So it won’t return the correct results.
*/
SELECT 
  job_location,
  COUNT(job_id) AS not_remote_job_count
FROM 
  job_postings_fact
WHERE 
  job_work_from_home = false
GROUP BY 
  job_location
HAVING 
  AVG(salary_year_avg) > 70000 
ORDER BY 
  not_remote_job_count DESC;

-----------------------------------Null Value--------------------------------------
/*Question 1:
We’re going to check that all skills that do not have a category assigned to it. Get all 
skills from the skills_dim table that don’t have a type (aka this type column is null). 
Return the skill_id and skills.
*/
SELECT 
	skill_id, 
	skills
FROM 
	skills_dim
WHERE 
	type IS NULL;

/*Question 2:
Identify all job postings that have neither an annual average salary (salary_year_avg) 
nor an hourly average salary (salary_hour_avg) in the job_postings_fact table. 
Return the job_id, job_title, salary_year_avg, salary_hour_avg This can be useful to 
look at postings where there’s no compensation. Order by job_id in ascending order.*/

SELECT 
	job_id, 
	job_title, 
	salary_year_avg, 
	salary_hour_avg
FROM 
	job_postings_fact
WHERE 
	salary_year_avg IS NULL 
	AND salary_hour_avg IS NULL
ORDER BY
	job_id;

/*Join Intro
Goes over: 

LEFT JOIN
INNER JOIN
⚠️Notes:

LEFT JOIN AND INNER JOIN will be the primary focus for these problems 
(over RIGHT JOIN and OUTER JOIN) as they are most commonly used in real-world scenarios.
If you prefer you can alias the table names (e.g. rename job_postings_fact to j), 
typically it’s good to alias names that are too long or complicated to read. In the rest 
of the queries tables are not aliased to keep it clear which tables are used.
*/
/*Question 1:
Retrieve a list of job titles (job_title from the job_posting_fact table) with their 
corresponding company names (name from the company_dim table). Also, get the job_id, 
job_location, and job_posted_date. Only return job postings that have the
‘Data Scientist' as the job title (job_title_short). Order by the job posted date in 
descending order.

🔎 Hint:

Use INNER JOIN to link job_postings_fact with company_dim on company_id to combine job
and company data.
Look at job_title_short to use in the WHERE clause.
Use job_posted_date for ORDER BY. Think through how you want it ordered.
*/
/*The SELECT statement returns: job_id, job_title, name (from the company_dim table), 
job_location, and job_posted_date from the job_postings_fact table.
Uses an INNER JOIN to link the job_postings_fact table with the company_dim table.
The WHERE clause filters the job postings to only include those where the 
job_title_short equals 'Data Scientist'.
ORDER BY sorts the results by job_posted_date in descending order.
*/

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
    job_postings_fact.job_posted_date DESC;

/*Question:

Fetch all job postings, including their job_id, job_title and the names of the 
skills required (skills); even if no skills are listed for a job. Ensure that the job is 
located in ‘New York’ and offers health insurance. Use the job_postings_fact, 
skills_job_dim, and skills_dim tables. Order by job_id in descending order.

🔎 Hint:
Think about what JOIN you want to use for “even if no skills are listed for a job”.
You’ll need to JOIN 2 tables to the job_postings_fact table. skills_job_dim to match 
the skills with the job and then skills_dim to get the skill name.
In the WHERE clause look at job_location to filter specific job locations and 
job_health_insurance to see if the company offers health insurance.
*/
/*Solution:

The SELECT statement returns: job_id and job_title from job_postings_fact. And skills 
from the skills_dim table.
Get data FROM the job_postings_fact table.
LEFT JOIN is used to include all jobs, connecting job_postings_fact with 
skills_job_dim and skills_dim even if there are no skills associated 
(this ensures jobs without skills are not excluded).
The skills_dim table is joined to get the readable skill names rather than just IDs.
The WHERE clause filters results for jobs only in 'New York' and where 
job_health_insurance is TRUE.
Results are ordered by job_id in descending order, showing the highest job ID first.*/

SELECT 
	job_postings_fact.job_id,
	job_postings_fact.job_title, 
	skills_dim.skills
FROM 
	job_postings_fact
	LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
	LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
	job_postings_fact.job_location = 'New York' 
	AND job_postings_fact.job_health_insurance = TRUE
ORDER BY job_postings_fact.job_id DESC;

/*Question 3:
Identify the top skills required for jobs that offer remote work and have an average 
yearly salary above $100,000. Return the skill name (skills) and the number of job 
postings that mention each skill, ordered by the number of job postings in descending 
order.

🔎 Hint:
Use INNER JOIN to connect job_postings_fact with skills_job_dim and skills_dim to relate
 job postings to skills.
In the WHERE clause use the job_work_from_home and salary_year_avg columns to filter for 
these two conditions (”offer remote work and have an average yearly salary above $100,000”).
Group results by skill name using GROUP BY.
Sort the results by the count of job postings in descending order with ORDER BY.
*/

/*Solution:

In the SELECT statement:
it gets skill names skills from the skills_dim table.
counts the number of job postings associated with each skill from the job_postings_fact 
table.
An INNER JOIN is used twice: first, to connect job postings with their skills, and 
second, to get the skill names.
The WHERE clause filters jobs that are remote (job_work_from_home = TRUE) and have a 
yearly salary over $100,000 (salary_year_avg > 100000).
GROUP BY skill name to aggregate the counts properly.
Use ORDER BY to order the results by the number of job postings in descending order.
*/

SELECT 
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS num_job_postings
FROM 
    job_postings_fact
	INNER JOIN 
	    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
	INNER JOIN 
	    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_work_from_home = TRUE -- Remote work 
    AND job_postings_fact.salary_year_avg > 100000
GROUP BY 
    skills_dim.skills
ORDER BY 
    num_job_postings DESC;

------------------------------------Advanced Session----------------------------
/*The remaining practice problems are intended to be run using the PostgreSQL database
 you installed locally.*/

 -------------------Date Function---------------------------------------------------
 /*Question 1:

Find the average salary both yearly (salary_year_avg) and hourly (salary_hour_avg) 
for job postings using the job_postings_fact table that were posted after June 1, 2023. 
Group the results by job schedule type. Order by the job_schedule_type in descending order.

🔎 Hint:
Calculate average salaries by using the AVG function on both salary_year_avg and 
salary_hour_avg.
Filter postings with WHERE for dates after June 1, 2023,
Group the results with job_schedule_type.
Use job_schedule_type for ORDER BY.
 */
 /*Solution:

In the SELECT statement it gets job_schedule_type, average salary year 
AVG(salary_year_avg), and average hour year AVG(salary_hour_avg).
The WHERE clause filters jobs that were posted after June 1, 2023 
(job_posted_date::date > ‘2023-06-01’.
GROUP BY the job_schedule_type to aggregate properly.
Use ORDER BY to order the results by job_schedule_type.
 */
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

/*Question 2:

Count the number of job postings for each month in 2023, adjusting the job_posted_date 
to be in 'America/New_York' time zone before extracting the month. Assume the 
job_posted_date is stored in UTC. Group by and order by the month.

🔎 Hint:

Use the EXTRACT(MONTH FROM ...) function to get the month from job_posted_date and 
wihtin this EXTRACT convert it to the 'America/New_York' time zone using AT TIME ZONE 
(don’t forget to assume default is in ‘UTC’).
COUNT the number of job postings
GROUP BY the extracted month
ORDER BY the month.
*/

/*Solution:

In the SELECT statement:
For month:
Adjusts job_posted_date from UTC to 'America/New_York' time zone using the AT TIME ZONE clause (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York').
It then extracts the month from job_posted_date using the EXTRACT(MONTH FROM ...) function.
Uses COUNT(*) to count the total number of job postings for each month.
GROUP BY the month (GROUP BY month).
ORDER BY month in ascending order (ORDER BY month).
*/
SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT(*) AS postings_count
FROM
    job_postings_fact
GROUP BY
    month
ORDER BY
    month;

/*Question 3:

Find companies (include company name) that have posted jobs offering health insurance, 
where these postings were made in the second quarter of 2023. Use date extraction to 
filter by quarter. And order by the job postings count from highest to lowest.

🔎 Hint:

Join job_postings_fact and company_dim on company_id to match jobs to companies.
Use the WHERE clause to filter for jobs with job_health_insurance column.
Use EXTRACT(QUARTER FROM job_posted_date) to filter for postings in the second quarter.
Group results by company_name.
Count the number of job postings per company with COUNT(job_id).
Use HAVING to include only companies with at least one job posting.
ORDER BY the job postings count in descending order to get highest → lowest.
*/

/*Solution:

Select the company name (name) and count of job postings (COUNT(job_postings_fact.job_id)
 from the joined tables.
WHERE clause:
Includes health insurance: job_health_insurance is set to TRUE.
Extract the quarter from the job_posted_date and filter for the second quarter (value 2).
GROUP BY the company name (name) to get the count per company.
ORDER BY job postings count in descending order.
*/

SELECT
    company_dim.name AS company_name,
    COUNT(job_postings_fact.job_id) AS job_postings_count
FROM
    job_postings_fact
	INNER JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.job_health_insurance = TRUE
    AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2 
GROUP BY
    company_dim.name 
HAVING
    COUNT(job_postings_fact.job_id) > 0
ORDER BY
	job_postings_count DESC; 

--------------- Manipulate Tables------------------------------------------------
/*Question 1:

Create a table named data_science_jobs that will hold information about job postings. 
Include the following columns: job_id (integer and primary key), job_title (text), 
company_name (text), and post_date (date).
*/
CREATE TABLE data_science_jobs (
    job_id INT PRIMARY KEY,
    job_title TEXT,
    company_name TEXT,
    post_date DATE
);

/*Question 2:
Insert three job postings into the data_science_jobs table. Make sure each job posting 
has a unique job_id, a job_title, a company_name, and a post_date.*/
INSERT INTO data_science_jobs (job_id, job_title, company_name, post_date)
VALUES
(1, 'Data Scientist', 'Tech Innovations', '2023-01-01'),
(2, 'Machine Learning Engineer', 'Data Driven Co', '2023-01-15'),
(3, 'AI Specialist', 'Future Tech', '2023-02-01');

/*Question 3:

Alter the data_science_jobs table to add a new Boolean column (uses True or False values)
named remote.
*/
ALTER TABLE data_science_jobs 
ADD COLUMN remote BOOLEAN;

/*Question 4:
Rename the post_date column to posted_on from the data_science_job table.*/
ALTER TABLE data_science_jobs 
RENAME COLUMN post_date TO posted_on;

/*Question 5:

Modify the remote column so that it defaults to FALSE in the data_science_job table .

🔎 Hint:
Use SET DEFAULT command.
*/

ALTER TABLE data_science_jobs 
ALTER COLUMN remote SET DEFAULT FALSE;

/*Question 6:

Drop the company_name column from the data_science_jobs table.
*/
ALTER TABLE data_science_jobs 
DROP COLUMN company_name;

/*Question 7:
Update the job posting with the job_id = 2 . Update the remote column for this job 
posting to TRUE in data_science_jobs.

🔎 Hint:
Use SET to specify the column that needs to be updated and the new value for 
that column.
*/
UPDATE data_science_jobs 
SET remote = TRUE WHERE job_id = 2;

/*Question 8:
Drop the data_science_jobs table.*/
DROP TABLE data_science_jobs;

---------------------------------Case Statements--------------------------------
/*Question 1:

From the job_postings_fact table, categorize the salaries from job postings that are data analyst jobs and who have a yearly salary information. Put salary into 3 different categories:

If the salary_year_avg is greater than $100,000 then return ‘high salary’.
If the salary_year_avg is between $60,000 and $99,000 return ‘Standard salary’.
If the salary_year_avg is below $60,000 return ‘Low salary’.
Also order from the highest to lowest salaries.

🔎 Hint:

In SELECT retrieve these columns: job_id, job_title, salary_year_avg, and a new column 
for the salary category.
CASE Statement: use to categorize salary_year_avg into 'High salary', 'Standard salary',
 or 'Low salary'.
If the salary is over $100,000, it's a High salary.
For salaries between $60,000 and $99,000, assign Standard salary.
Any salary below $60,000 should be marked as Low salary.
FROM the job_postings_fact table.
WHERE statement
Exclude records without a specified salary_year_avg.
Focus on job_title_short that exactly matches 'Data Analyst'.
use ORDER BY to sort by salary_year_avg in descending order to start with the highest
 salaries first.*/
 /*Solution:

In SELECT return: job_id, job_title, salary_year_avg, and
Categorize the salary (salary_year_avg) on whether it’s high, standard or low using CASE statement:
WHEN - High is when it’s > $$100,000
WHEN - Standard when it’s between $60,000 and $99,000
WHEN - Low when it’s < $60,000
ORDER BY the salary_year_avg in descending order (highest salary to lowest).
In WHERE clause filter by jobs that include a salary (salary_year_avg IS NOT NULL) 
and data analyst roles (and job_title_short = 'Data Analyst')and job_title_short = 'Data Analyst'*/

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
    salary_year_avg DESC;

/*Question 2:
Count the number of unique companies that offer work from home (WFH) versus those 
requiring work to be on-site. Use the job_postings_fact table to count and compare 
the distinct companies based on their WFH policy (job_work_from_home).

🔎 Hint:
Use COUNT with DISTINCT to find unique values.
CASE WHEN statements to separate companies based on their WFH policy.
The data will be from the job_postings_fact table.*/
/*Solution:
In SELECT use COUNT(DISTINCT ...) to calculate the unique companies.
CASE WHEN to check the job_work_from_home flag.
Count as WFH if job_work_from_home is TRUE.
Count as non-WFH if job_work_from_home is FALSE.
The data is coming FROM the job_postings_fact table.
*/

SELECT 
    COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS wfh_companies,
    COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS non_wfh_companies
FROM job_postings_fact;

/*Question 3:
Write a query that lists all job postings with their job_id, salary_year_avg, and two 
additional columns using CASE WHEN statements called: experience_level and remote_option.
Use the job_postings_fact table.

For experience_level, categorize jobs based on keywords found in their titles (job_title)
as 'Senior', 'Lead/Manager', 'Junior/Entry', or 'Not Specified'. Assume that certain 
keywords in job titles (like "Senior", "Manager", "Lead", "Junior", or "Entry") 
can indicate the level of experience required. ILIKE should be used in place of 
LIKE for this.
NOTE: Use ILIKE in place of how you would normally use LIKE ; ILIKE is a command in SQL,
specifically used in PostgreSQL. It performs a case-insensitive search, similar to the 
LIKE command but without sensitivity to case.
For remote_option, specify whether a job offers a remote option as either 'Yes' or 'No',
based on job_work_from_home column.

🔎 Hint:
Use CASE WHEN to categorize data based on conditions.
Look for specific words that indicate job levels, like "Senior", "Manager", "Lead", 
"Junior", or "Entry". Use ILIKE to ensure the search for keywords is not case-sensitive.
For the remote work option based on job_work_from_home column and look at the boolean 
value in this column.
*/

/*Solution:

In the SELECT return:
job_id
salary_year_avg
CASE statement to categorize the job based on experience level from job_title:
CASE - Assign 'Senior' if job_title contains "Senior" 
(job_title ILIKE '%Senior%' THEN 'Senior')
CASE - Assign 'Lead/Manager' if job_title contains "Manager" or "Lead" 
(job_title ILIKE '%Manager%' OR job_title ILIKE '%Lead%' THEN 'Lead/Manager')
CASE - Assign 'Junior/Entry' if job_title contains "Junior" or "Entry" 
(job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry')
ELSE - Assign 'Not Specified' if none of the above keywords are found.
CASE statement to flag whether the job offers a remote work option:
Assign 'Yes' if job_work_from_home is TRUE.
Assign 'No' if job_work_from_home is FALSE.
Get the data FROM the job_postings_fact
In the WHERE clause make sure salary_year_avg is not null.
ORDER BY the job_id
*/

SELECT 
  job_id,
  salary_year_avg,
  CASE
      WHEN job_title ILIKE '%Senior%' THEN 'Senior'
      WHEN job_title ILIKE '%Manager%' OR job_title ILIKE '%Lead%' THEN 'Lead/Manager'
      WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
      ELSE 'Not Specified'
  END AS experience_level,
  CASE
      WHEN job_work_from_home THEN 'Yes'
      ELSE 'No' 
  END AS remote_option
FROM 
  job_postings_fact
WHERE 
  salary_year_avg IS NOT NULL 
ORDER BY 
  job_id;


-----------------------------------------------Subqueries-------------------------------
  /*Question 1:

Identify the top 5 skills that are most frequently mentioned in job postings. 
Use a subquery to find the skill IDs with the highest counts in the skills_job_dim 
table and then join this result with the skills_dim table to get the skill names.

🔎 Hints:

Focus on creating a subquery that identifies and ranks (ORDER BY in descending order) 
the top 5 skill IDs by their frequency (COUNT) of mention in job postings.
Then join this subquery with the skills table (skills_dim) to match IDs to skill names.
*/

/*Solution:
Select theskills_dim.skills to get the actual skill names from the skills dimension table.
In an INNER JOIN use a subquery that ranks the top 5 skills by frequency of mention in job postings.
SELECT the skill_id -
FROM the skills_job_dim which is where the skill-job relationships are stored.
GROUP BY skill_id to aggregate counts by each skill ID.
ORDER BY the COUNT(job_id) DESC to sort the skills by the most frequent at the top.
LIMIT 5 to restrict the results to the top 5 most frequent skills.
Rename the subquery as top_skills and join onskills_dim.skill_id = top_skills.skill_id 
matching the skill ID from the subquery to the skill ID in the skills dimension table.
*/

SELECT skills_dim.skills
FROM skills_dim
INNER JOIN (
    SELECT skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY COUNT(job_id) DESC
    LIMIT 5
) AS top_skills ON skills_dim.skill_id = top_skills.skill_id;

/*Question 2:

Determine the size category ('Small', 'Medium', or 'Large') for each company by first 
identifying the number of job postings they have. Use a subquery to calculate the total 
job postings per company. A company is considered 'Small' if it has less than 10 job 
postings, 'Medium' if the number of job postings is between 10 and 50, and 'Large' 
if it has more than 50 job postings. Implement a subquery to aggregate job counts per 
company before classifying them based on size.

🔎 Hints:

Aggregate job counts per company in the subquery. This involves grouping by company and
 counting job postings.
Use this subquery in the FROM clause of your main query.
In the main query, categorize companies based on the aggregated job counts from the 
subquery with a CASE statement.
The subquery prepares data (counts jobs per company), and the outer query classifies 
companies based on these counts.
*/

/*Solution:

Select the company_id and name from the subquery alias company_info to retrieve the 
unique identifier and name of the company.
Use a CASE statement to categorize each company based on the number of job postings 
they have:
Label as 'Small' when the count of job postings (job_count) is less than 10.
Label as 'Medium' when the count is between 10 and 50.
Label as 'Large' when the count is more than 50.
Use a subquery to calculate the number of job postings per company:
Inside the subquery, SELECT the company_id and company_name, and calculate the count 
of job postings as job_count.
Use FROM to specify the company_dim table to pull company information.
Apply an INNER JOIN with the job_postings_fact table to match each job posting to 
its respective company.
GROUP BY company_id and name to ensure the count is accurate for each company.
Alias the subquery as company_info which will be used in the main SELECT statement 
for joining with the company details.
*/

SELECT 
	company_id,
  name,
	-- Categorize companies
  CASE
	  WHEN job_count < 10 THEN 'Small'
    WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
    ELSE 'Large'
  END AS company_size

FROM 
-- Subquery to calculate number of job postings per company 
(
  SELECT 
		company_dim.company_id, 
		company_dim.name, 
		COUNT(job_postings_fact.job_id) as job_count
  FROM 
		company_dim
  INNER JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
  GROUP BY 
		company_dim.company_id, 
		company_dim.name
) AS company_job_count;

/*Question 3:

Find companies that offer an average salary above the overall average yearly salary 
of all job postings. Use subqueries to select companies with an average salary higher 
than the overall average salary (which is another subquery).

🔎 Hints:

Start by separating the task into two main steps:
calculating the overall average salary
identifying companies with higher averages.
Use a subquery (subquery 1) to find the average yearly salary across all job postings. 
Then join this subquery onto the company_dim table.
Use another a subquery (subquery 2) to establish the overall average salary, which will 
help in filtering in the WHERE clause companies with higher average salaries.
Determine each company's average salary (what you got from the subquery 1) and compare
it to the overall average you calculated (subquery 2). Focus on companies that greater
than this average.
*/

/*Solution:
Select the company names (name) from the company_dim table to identify the companies.
INNER JOIN the company_dim table with a subquery:
selects the company_id and the average of salary_year_avg
from the job_postings_fact table,
grouping the results by company_id.
Name this subquery as company_salaries, which now holds the average salary information 
per company
JOIN on company_id
In the WHERE clause of your main query, include another subquery that:
In the SELECT calculates the overall average salary across all job postings 
(AVG(salary_year_avg)) from the job_postings_fact table.
Compare each company's average salary (company_salaries subquery) to the overall
average salary determined by the second subquery; average salary is greater than 
this overall average.*/

SELECT 
    company_dim.name
FROM 
    company_dim
INNER JOIN (
    -- Subquery to calculate average salary per company
    SELECT 
			company_id, 
			AVG(salary_year_avg) AS avg_salary
    FROM job_postings_fact
    GROUP BY company_id
    ) AS company_salaries ON company_dim.company_id = company_salaries.company_id
-- Filter for companies with an average salary greater than the overall average
WHERE company_salaries.avg_salary > (
    -- Subquery to calculate the overall average salary
    SELECT AVG(salary_year_avg)
    FROM job_postings_fact
);

---------------------------------------CTEs ----------------------------------
/*Question 1:

Identify companies with the most diverse (unique) job titles. Use a CTE to count the 
number of unique job titles per company, then select companies with the highest diversity in job titles.

🔎 Hints:

Use a CTE to count the distinct number of job titles for each company.
After identifying the number of unique job titles per company, join this result with 
the company_dim table to get the company names.
Order your final results by the number of unique job titles in descending order to 
highlight the companies with the highest diversity.
Limit your results to the top 10 companies. This limit helps focus on the companies
with the most significant diversity in job roles. Think about how SQL determines 
which companies make it into the top 10 when there are ties in the number of unique job titles.*/

/*Solution:

Create a CTE called title_diversityto:
Count unique job titles per company (COUNT(DISTINCT job_title)
From job_postings_fact
Grouping the results by company_id
In the main query:
In SELECT statement get the company names (name) and their corresponding counts of unique job titles
 from the CTE.
Get data from the CTE title_diversity.
INNER JOIN the CTE with company_dim on company_id to match each company's unique titles count with 
its name.
ORDER BY companies by descending uniqueness of job titles
LIMIT by the top 10.
*/

-- Define a CTE named title_diversity to calculate unique job titles per company
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
LIMIT 10;  
/*Question:
Explore job postings by listing job id, job titles, company names, and their average salary rates, 
while categorizing these salaries relative to the average in their respective countries. Include 
the month of the job posted date. Use CTEs, conditional logic, and date functions, to compare 
individual salaries with national averages.

🔎 Hints:
Define a CTE to calculate the average salary for each country. This will serve as a foundational
 dataset for comparison.
Within the main query, use a CASE WHEN statement to categorize each salary as 
'Above Average' or 'Below Average' based on its comparison (>) to the country's average salary calculated
in the CTE.
To include the month of the job posting, use the EXTRACT function on the job posting date within
 your SELECT statement.
Join the job postings data (job_postings_fact) with the CTE to compare individual salaries to the average. Additionally, join with the company dimension (company_dim) table to get company names linked to each job posting.
*/

/*Solution:
Create Common Table Expression (CTE) named avg_salaries
Calculate the average yearly salary (AVG(salary_year_avg)) for each country (job_country)
From the job_postings_fact table,
Grouping the results by job_country.
In the main query:
Select:
the job_id, job_title, and company name (companies.name) to get the basic job posting information.
Retrieve the salary (salary_year_avg) for each job posting and label it as salary_rate.
Categorize each salary as 'Above Average' or 'Below Average' by comparing the individual salary rate 
to the average salary of the corresponding country obtained from the avg_salaries 
CTE (job_postings.salary_year_avg > avg_salaries.avg_salary)
Extract the month from the job posting date (job_posted_date) to include in your results as 
posting_month.
INNER JOIN the job_postings_fact table with the company_dim table to link each job posting with 
the respective company name.
INNER JOIN the avg_salaries CTE to bring in the average salary data for comparison.
Order the results by the posting_month in descending order to sort the job postings starting 
with the most recent.
*/

-- gets average job salary for each country
WITH avg_salaries AS (
  SELECT 
    job_country, 
    AVG(salary_year_avg) AS avg_salary
  FROM job_postings_fact
  GROUP BY job_country
)

SELECT
  -- Gets basic job info
	job_postings.job_id,
  job_postings.job_title,
  companies.name AS company_name,
  job_postings.salary_year_avg AS salary_rate,
-- categorizes the salary as above or below average the average salary for the country
  CASE
    WHEN job_postings.salary_year_avg > avg_salaries.avg_salary
    THEN 'Above Average'
    ELSE 'Below Average'
  END AS salary_category,
  -- gets the month and year of the job posting date
  EXTRACT(MONTH FROM job_postings.job_posted_date) AS posting_month
FROM
  job_postings_fact as job_postings
INNER JOIN
  company_dim as companies ON job_postings.company_id = companies.company_id
INNER JOIN
  avg_salaries ON job_postings.job_country = avg_salaries.job_country
ORDER BY
    -- Sorts it by the most recent job postings
    posting_month desc;

/*Question 3:

Calculate the number of unique skills required by each company. Aim to quantify the unique skills 
required per company and identify which of these companies offer the highest average salary for
positions necessitating at least one skill. For entities without skill-related job postings, 
list it as a zero skill requirement and a null salary. Use CTEs to separately assess the unique
skill count and the maximum average salary offered by these companies.

🔎 Hints:

Use two CTEs.
The first should focus on counting the unique skills required by each company.
The second CTE should aim to find the highest average salary offered by these companies.
Ensure the final output includes companies without skill-related job postings. This involves use 
of LEFT JOINs to maintain companies in the result set even if they don't match criteria in the 
subsequent CTEs.
After creating the CTEs, the main query joins the company dimension table with the results of both CTEs.
*/

/*Solution:

Start with a CTE named required_skills
Count the distinct skills (COUNT(DISTINCT skills_to_job.skill_id)) required by each company (company_id).
Then LEFT JOIN the company_dim with job_postings_fact and skills_job_dim tables, ensuring even 
companies with no skills-related job postings are included.
GROUP BY the company_id
Create a second CTE called max_salary
Get the highest average yearly salary (MAX(job_postings.salary_year_avg)) offered by companies 
(company_id)
Only get jobs that require at least one skill by filtering out job postings that have an associated 
skill in the skills_job_dim table (job_postings.job_id IN (SELECT job_id FROM skills_job_dim))
GROUP BY the company_id
In the main query
SELECT the company names (name) from the company_dim table, unique_skills_required from required_skills 
CTE, and highest_average_salary from the max_salary CTE
Get information FROM the company_dim table.
LEFT JOIN the company_dim table with the required_skills CTE to bring in the count of unique skills 
required by each company.
LEFT JOIN the company_dim table with the max_salary CTE to include the highest average salary offered 
by these companies.
ORDER BY the company names in ascending order.
*/
-- Counts the distinct skills required for each company's job posting
WITH required_skills AS (
  SELECT
    companies.company_id,
    COUNT(DISTINCT skills_to_job.skill_id) AS unique_skills_required
  FROM
    company_dim AS companies 
  LEFT JOIN job_postings_fact as job_postings ON companies.company_id = job_postings.company_id
  LEFT JOIN skills_job_dim as skills_to_job ON job_postings.job_id = skills_to_job.job_id
  GROUP BY
    companies.company_id
),
-- Gets the highest average yearly salary from the jobs that require at least one skills 
max_salary AS (
  SELECT
    job_postings.company_id,
    MAX(job_postings.salary_year_avg) AS highest_average_salary
  FROM
    job_postings_fact AS job_postings
  WHERE
    job_postings.job_id IN (SELECT job_id FROM skills_job_dim)
  GROUP BY
    job_postings.company_id
)
-- Joins 2 CTEs with table to get the query
SELECT
  companies.name,
  required_skills.unique_skills_required as unique_skills_required, --handle companies w/o any skills required
  max_salary.highest_average_salary
FROM
  company_dim AS companies
LEFT JOIN required_skills ON companies.company_id = required_skills.company_id
LEFT JOIN max_salary ON companies.company_id = max_salary.company_id
ORDER BY
	companies.name;

--------------------------------------------------Union Operators----------------------------------------
/*Question 1:

Create a unified query that categorizes job postings into two groups: those with salary information 
(salary_year_avg or salary_hour_avg is not null) and those without it. Each job posting should be 
listed with its job_id, job_title, and an indicator of whether salary information is provided.

🔎 Hints:

Use UNION ALL to merge results from two separate queries.
For the first query, filter job postings where either salary field is not null to identify postings 
with salary information.
For the second query, filter for postings where both salary fields are null to identify postings 
without salary information.
Include a custom field to indicate the presence or absence of salary information in the output.
When categorizing data, you can create a custom label directly in your query using string literals, 
such as 'With Salary Info' or 'Without Salary Info'. These literals are manually inserted values that 
indicate specific characteristics of each record. An example of this is as a new column in the query 
that doesn’t have salary information put: 'Without Salary Info' AS salary_info. As the last column in 
the SELECT statement.
*/

/*Solution:

First Query:
SELECT postings with job_id, and job_title and mark it with ‘With Salary Info’
FROM the job_postings_fact table
In the WHERE clause only get job postings that have either yearly or hourly salary information 
(salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL).
Second Query:
SELECT postings with job_id, and job_title and mark it with ‘Without Salary Info’
FROM the job_postings_fact table
In the WHERE clause only get job postings that don’t have yearly or hourly salary information 
(salary_year_avg IS NULL AND salary_hour_avg IS NULL).
Combine these two sets of postings using UNION ALL to create a comprehensive list.
*/
-- Select job postings with salary information
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
	job_id; 

/*Question 2:

Retrieve the job id, job title short, job location, job via, skill and skill type for each job posting
 from the first quarter (January to March). Using a subquery to combine job postings from the first 
 quarter (these tables were created in the Advanced Section - Practice Problem 6 [include timestamp 
 of Youtube video]) Only include postings with an average yearly salary greater than $70,000.

🔎 Hints:
Use UNION ALL to combine job postings from January, February, and March into a single dataset.
Apply a LEFT JOIN to include skills information, allowing for job postings without associated 
skills to be included.
Filter the results to only include job postings with an average yearly salary above $70,000.
*/

/*Solution:

Selects job_id, job_title_short, job_location, job_via, salary_year_avg from job_postings_q1 and 
skills and type from skills_dim.
Combines January, February, and March job postings in 2023 in a subquery (in FROM statement 
which uses a UNION ALL) and rename it as job_postings_q1.
The job_postings_q1 subquery is LEFT JOINed to the skills_to_jobs on the job_id.
skills_to_job table is LEFT JOINed to the skills table on skill_id.
In the WHERE clause we’re only getting salary_year_avg that are greater than $70,000.
ORDER BY the job_id
*/

SELECT
    job_postings_q1.job_id,
    job_postings_q1.job_title_short,
    job_postings_q1.job_location,
    job_postings_q1.job_via,
    job_postings_q1.salary_year_avg,
    skills_dim.skills,
    skills_dim.type
FROM
-- Get job postings from the first quarter of 2023
    (
        SELECT *
        FROM january_jobs
        UNION ALL
        SELECT *
        FROM february_jobs
				UNION ALL
				SELECT *
				FROM march_jobs
    ) as job_postings_q1
LEFT JOIN skills_job_dim ON job_postings_q1.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_q1.salary_year_avg > 70000
ORDER BY
	job_postings_q1.job_id;

/*Question 3:

Analyze the monthly demand for skills by counting the number of job postings for each skill in 
the first quarter (January to March), utilizing data from separate tables for each month. Ensure 
to include skills from all job postings across these months. The tables for the first quarter job 
postings were created in the Advanced Section.

🔎 Hints:

Use UNION ALL to combine job postings from January, February, and March into a consolidated dataset.
Apply the EXTRACT function to obtain the year and month from job posting dates, even though the month
 will be implicitly known from the source table.
Group the combined results by skill to summarize the total postings for each skill across the first 
quarter.
Join with the skills dimension table to match skill IDs with skill names.
*/
/*Solution:

Create a CTE named combined_job_postings to consolidate job postings from the first quarter:
Include job postings from january_jobs, february_jobs, and march_jobs using UNION ALL to ensure 
all data from these months are combined.
Select job_id and job_posted_date from each month's table, making sure that all postings are 
captured, including duplicates.
Create a second CTE called monthly_skill_demand to calculate the demand for skills month by month:
In the SELECT statement:
skills to get the skill
Use EXTRACT to pull out the year (EXTRACT(YEAR FROM combined_job_postings.job_posted_date)) and 
month (EXTRACT(MONTH FROM combined_job_postings.job_posted_date))
COUNT the number of job postings for each skill (COUNT(combined_job_postings.job_id))
Get data FROM the combined_job_postings CTE.
INNER JOIN the combined_job_postings with skills_job_dim on job_id to associate job postings 
with their required skills.
INNER JOIN the skills_dim on skill_id to get the names and types of the skills.
GROUP BY the skills, year, month
In main query:
Get the skills, year, month, and postings_count
FROM the monthly_skill_demand CTE
Use ORDER BY to sort the results first by skill name (skills), then year, and month*/

-- CTE for combining job postings from January, February, and March
WITH combined_job_postings AS (
  SELECT job_id, job_posted_date
  FROM january_jobs
  UNION ALL
  SELECT job_id, job_posted_date
  FROM february_jobs
  UNION ALL
  SELECT job_id, job_posted_date
  FROM march_jobs
),
-- CTE for calculating monthly skill demand based on the combined postings
monthly_skill_demand AS (
  SELECT
    skills_dim.skills,  
    EXTRACT(YEAR FROM combined_job_postings.job_posted_date) AS year,  
    EXTRACT(MONTH FROM combined_job_postings.job_posted_date) AS month,  
    COUNT(combined_job_postings.job_id) AS postings_count 
  FROM
    combined_job_postings
	  INNER JOIN skills_job_dim ON combined_job_postings.job_id = skills_job_dim.job_id  
	  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
  GROUP BY
    skills_dim.skills, year, month
)
-- Main query to display the demand for each skill during the first quarter
SELECT
  skills,  
  year,  
  month,  
  postings_count 
FROM
  monthly_skill_demand
ORDER BY
  skills, year, month;  

  --------------------------------------END--------------------------