# Calculating Free-to-Paid Conversion Rate with SQL Project
Calculating the Fraction of Students Who Convert to Paying Ones after Starting a Course

## Case Description
SQL is a powerful tool that can be used for extracting information from databases with its invaluable ability to join tables and aggregate results. Data extraction is the first step towards data analysis, and, therefore, extracting data correctly is crucial to arrive at the correct conclusions during the analysis process.

This Calculating Free-to-Paid Conversion Rate with SQL project aims to put my SQL skills into practice. I worked with an excerpt of a learning platform data—stripped of personally identifiable information—to estimate the fraction of students who purchase a subscription after starting a lecture, i.e., the free-to-paid conversion rate among students who’ve engaged with video content on the 365 platform. I was also tasked with calculating several other key metrics and analyze the results.

The data includes three tables storing information about students’ registration dates, engagement dates, and subscription purchase dates.

## Project requirements
For this Calculating Free-to-Paid Conversion Rate with SQL, I work with MySQL.

## Project files
db_course_conversions.sql – the file contains the database for the project.

## Guided
This option provides detailed instructions and steps on how to complete each task. Please note this is not the only solution to the project but rather a helpful guide.

## Create the Subquery
This practice project allows me to apply your SQL knowledge to a real-world dataset. Once completed I was able to find the answer to the following questions:

* What is the free-to-paid conversion rate of students who have watched a lecture on the platform?
* What is the average duration between the registration date and when a student has watched a lecture for the first time (date of first-time engagement)?
* What is the average duration between the date of first-time engagement and when a student purchases a subscription for the first time (date of first-time purchase)?
* How can we interpret these results, and what are their implications?
  
Import the db_course_conversions database—stored in the db_course_conversions.sql file—into your schemas and study its content. Then, by appropriately joining and aggregating the tables, create a new result dataset comprising the following columns:

* student_id – (int) the unique identification of a student
* date_registered – (date) the date on which the student registered on the 365 platform
* first_date_watched – (date) the date of the first engagement
* first_date_purchased – (date) the date of first-time purchase (NULL if they have no purchases)
* date_diff_reg_watch – (int) the difference in days between the registration date and the date of first-time engagement
* date_diff_watch_purch – (int) the difference in days between the date of first-time engagement and the date of first-time purchase (NULL if they have no purchases)

Hint: Research the DATEDIFF function in MySQL.

Note the Venn diagram below.

![Alt text](image/Studentdistribution.png)

The resulting set retrieve includes the student IDs of students entering the diagram’s shaded region. Additionally, my objective is to determine the conversion rate of students who have already watched a lecture. Therefore, I filter my result dataset so that the date of first-time engagement comes before (or is equal to) the date of first-time purchase.

**Sanity check:** The number of records in the resulting set should be 20,255.

To complete the task, I followed the **instructions** below.

1. First, I imported the db_course_conversions database and refresh the Schemas pane to see it appear. Apply the USE keyword to use the named database as the default (current) one.
2. Perform basic statistics on the tables provided
``` SQL
-- Top 5 records in Student_engagement table -- columns student_id, date_watched
select * from student_engagement limit 5;
-- Total records in Student_engagement table  -- 73,246
Select count(*) from Student_engagement;
-- Total distinct students in Student_engagement table  -- 20,778
Select count(distinct(student_id)) from Student_engagement; 

-- Top 5 records in Student_info table -- columns student_id, date_registered
select * from Student_info limit 5;
-- Total records in Student_info table  -- 40,979
Select count(*) from Student_info;
-- Total distinct students in Student_info table  -- 40,979
Select count(distinct(student_id)) from Student_info; 

-- Top 5 records in Student_purchases table -- columns purchase_id, student_id, date_purchased
select * from Student_purchases limit 5;
-- Total records in Student_purchases table  -- 5,922
Select count(*) from Student_purchases;
-- Total distinct students in Student_purchases table  -- 3,138
Select count(distinct(student_id)) from Student_purchases;  

```
3. Retrieve the columns one by one as listed in the task. Use the MIN aggregate function to find the first-time engagement and purchase dates. Apply the DATEDIFF function to see the difference in the respective days.
``` SQL
SELECT 
    e.student_id,
    date_registered,
    MIN(date_watched) AS first_date_watched,
    MIN(date_purchased) AS first_date_purchased,
    DATEDIFF(date_registered,MIN(date_watched)) AS days_diff_reg_watch,
    DATEDIFF(MIN(date_watched),MIN(date_purchased)) AS days_diff_watch_purch
```
4. Next, consider how to join the three tables to retrieve the highlighted records in the Venn diagram.
``` SQL
FROM
    student_engagement e
	left join
    student_info i ON  e.student_id=i.student_id
	left join
    student_purchases p ON e.student_id=p.student_id
```
5. Applying the MIN aggregate function in the previous step requires grouping the results appropriately.
``` SQL
SELECT 
    e.student_id,
    date_registered,
    MIN(date_watched) AS first_date_watched,
    MIN(date_purchased) AS first_date_purchased,
    DATEDIFF(date_registered,MIN(date_watched)) AS days_diff_reg_watch,
    DATEDIFF(MIN(date_watched),MIN(date_purchased)) AS days_diff_watch_purch
FROM
    student_engagement e
	left join
    student_info i ON  e.student_id=i.student_id
	left join
    student_purchases p ON e.student_id=p.student_id
    GROUP BY student_id
```
6. Filter the data to exclude the records where the date of first-time engagement comes later than the date of first-time purchase. Remember to keep the students who have never made a purchase.
``` SQL
SELECT 
    e.student_id,
    date_registered,
    MIN(date_watched) AS first_date_watched,
    MIN(date_purchased) AS first_date_purchased,
    DATEDIFF(date_registered,MIN(date_watched)) AS days_diff_reg_watch,
    DATEDIFF(MIN(date_watched),MIN(date_purchased)) AS days_diff_watch_purch
FROM
    student_engagement e
	left join
    student_info i ON  e.student_id=i.student_id
	left join
    student_purchases p ON e.student_id=p.student_id
    GROUP BY student_id
    HAVING days_diff_watch_purch>0;
```

7. Using CTE Method
``` SQLwith tab1 as (Select student_id, min(date_purchased) first_date_purchased from Student_purchases
group by student_id), 
tab2 as (Select student_id, min(date_watched) first_date_watched from Student_engagement
group by student_id),
tab3 as (Select * from Student_info)

select a.student_id, first_date_purchased, first_date_watched, date_registered,
DATEDIFF(first_date_watched,date_registered) AS days_diff_reg_watch,
    DATEDIFF(first_date_watched,first_date_purchased) AS days_diff_watch_purch
 from tab1 a
left join
tab2 b
on a.student_id=b.student_id
left join
tab3 c
on a.student_id=c.student_id
HAVING days_diff_watch_purch>0;
```
