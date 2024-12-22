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
    DATEDIFF(MIN(date_watched), date_registered) AS days_diff_reg_watch,
    DATEDIFF(MIN(date_purchased), MIN(date_watched)) AS days_diff_watch_purch
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
``` SQL
with tab1 as (Select student_id, min(date_watched) first_date_watched from Student_engagement
group by student_id), 
tab2 as (Select student_id, min(date_purchased) first_date_purchased from Student_purchases
group by student_id),
tab3 as (Select * from Student_info)

select a.student_id, date_registered, first_date_watched, first_date_purchased,  
DATEDIFF(first_date_watched,date_registered) AS days_diff_reg_watch,
    DATEDIFF(first_date_purchased, first_date_watched) AS days_diff_watch_purch
 from tab1 a
left join
tab2 b
on a.student_id=b.student_id
left join
tab3 c
on a.student_id=c.student_id
HAVING days_diff_watch_purch>0;
```

## Create Main Query
Excellent work! I’ve created a temporary result set adhering to the following Venn diagram and columns: 

![Alt text](image/Studentdistribution2.png)

* student_id – (int) the unique identification of a student
* date_registered – (date) the date on which the student registered on the 365 platform
* first_date_purchased – (date) the date of first-time purchase (NULL if they have no purchases)
* date_diff_reg_watch – (int) the difference in days between the registration date and the date of first-time engagement
* date_diff_watch_purch – (int) the difference in days between the date of first-time engagement and the date of first-time purchase (NULL if they have no purchases)

In this task, I used the subquery I’ve created and retrieve the following three metrics.

* **Free-to-Paid Conversion Rate:**
This metric measures the proportion of engaged students who choose to benefit from full course access on the 365 platform by purchasing a subscription after watching a lecture. It is calculated as the ratio between:

	* The number of students who watched a lecture and purchased a subscription on the same day or later.
	* The total number of students who have watched a lecture.
```Sql
 ROUND(count(first_date_purchased)/ count(student_id),
            2)*100 AS conversion_rate
```
Convert the result to percentages and call the field conversion_rate.

* **Average Duration Between Registration and First-Time Engagement:**
This metric measures the average duration between the date of registration and the date of first-time engagement. This will tell us how long it takes, on average, for a student to watch a lecture after registration. The metric is calculated by finding the ratio between:

	- The sum of all such durations.
	- The count of these durations, or alternatively, the number of students who have watched a lecture.
``` SQL
ROUND(SUM(days_diff_reg_watch) / COUNT(days_diff_reg_watch),
            2) AS av_reg_watch,
```
OR
``` SQL
avg(days_diff_reg_watch) av_reg_watch2
```
Call the field av_reg_watch.

* **Average Duration Between First-Time Engagement and First-Time Purchase:**
This metric measures the average time it takes individuals to subscribe to the platform after viewing a lecture. It is calculated by dividing:

	- The sum of all such durations.
	- The count of these durations, or alternatively, the number of students who have made a purchase.
``` SQL
 ROUND(SUM(days_diff_watch_purch) / COUNT(days_diff_watch_purch),
            2) AS av_watch_purch
```
Or
``` SQL
avg(days_diff_watch_purch) av_watch_purch2,
```

Call the field av_watch_purch.

I used the following instructions to carry out the task.

1. I surrounded the subquery I created in the previous part (Create the Subquery) in parentheses and give it an alias, say a.
2. Considering the framework below. I fill in the appropriate columns to retrieve the three metrics described in this task. The results are rounded to two decimal places for clarity. Don’t forget to convert the conversion_rate metric to percentages.
``` SQL
SELECT 
 ROUND(count(first_date_purchased)/ count(student_id),
            2)*100 AS conversion_rate,
ROUND(SUM(days_diff_reg_watch) / COUNT(days_diff_reg_watch),
            2) AS av_reg_watch,
ROUND(SUM(days_diff_watch_purch) / COUNT(days_diff_watch_purch),
            2) AS av_watch_purch
FROM
    (SELECT 
    e.student_id,
    date_registered,
    MIN(date_watched) AS first_date_watched,
    MIN(date_purchased) AS first_date_purchased,
    DATEDIFF(MIN(date_watched), date_registered) AS days_diff_reg_watch,
    DATEDIFF(MIN(date_purchased), MIN(date_watched)) AS days_diff_watch_purch
FROM
    student_engagement e
	left join
    student_info i ON  e.student_id=i.student_id
	left join
    student_purchases p ON e.student_id=p.student_id
    GROUP BY student_id
) a;
 ```
OR using CTE

``` SQL
SELECT 
 ROUND(count(first_date_purchased)/ count(student_id),
            2)*100 AS conversion_rate,
avg(days_diff_reg_watch) av_reg_watch,
avg(days_diff_watch_purch) av_reg_purch
FROM
    (
with tab1 as (Select student_id, min(date_watched) first_date_watched from Student_engagement
group by student_id), 
tab2 as (Select student_id, min(date_purchased) first_date_purchased from Student_purchases
group by student_id),
tab3 as (Select * from Student_info)

select a.student_id, date_registered, first_date_watched, first_date_purchased,  
DATEDIFF(first_date_watched,date_registered) AS days_diff_reg_watch,
    DATEDIFF(first_date_purchased, first_date_watched) AS days_diff_watch_purch
 from tab1 a
left join
tab2 b
on a.student_id=b.student_id
left join
tab3 c
on a.student_id=c.student_id
) a;
```

## Interpretation
SQL is a tool typically used for managing data, combined with other software when more involved data analysis tasks are required. With that in mind, below, we try to make sense of the three metrics we’ve retrieved. 

** Conversion Rate **

Let’s first discuss the result we obtained for the free-to-paid conversion rate metric. The fraction of students who purchase monthly, quarterly, or annual subscriptions from those who watch a lecture is about 11%—i.e., for every 100 students who come to the 365 platform, roughly 11 of them purchase a subscription. At first glance, this number seems relatively low, but let’s dig a bit deeper.

A significant number of students register on the platform out of curiosity. Nevertheless, we can outline why most students aren’t prompted to benefit from the program entirely. One factor contributing to this could be that we’re targeting a broader audience rather than focusing specifically on data science enthusiasts eager to begin their journey in the field.

Second, since our platform targets a beginner audience, students may need clarification about what to start with. Should they first invest weeks in mastering an object-oriented programming language such as Python, a query language such as SQL, or maybe a data visualization software like Tableau? What prerequisites are necessary for each of these tools? In August 2023, the team at 365 put effort into making its audience’s journey much easier by introducing an onboarding sequence that creates a customized learning path for each of its students. This way, users will know exactly where to start and how to continue.

Still, some users might need more time to embark on a data science journey. They might be college students whose exam periods have just started or working people who can’t dedicate the desired time.

Finally, we must consider that some users might not fancy the platform and would instead take the first steps toward data science elsewhere. Still, whatever the reason, reaching out to customers is essential, pinpointing any flaws and striving towards a better product.

** 2. Average Duration Between Registration and First-Time Engagement **

The results from the second metric indicate that, on average, it takes students between three and four days to start watching a lecture after registering on the platform. Ideally, it would be great if a new student started watching a lecture on their first day. Every other element the platform offers (exams, projects, career tracks) requires more attention, while the lessons are easy to check out. It’s worth diving a bit deeper into this analysis.

The dataset’s average is a metric that shouldn’t be studied in a vacuum because outliers heavily affect it. It’s, therefore, essential to study the other two metrics that typically come hand-in-hand with the average: median and mode. The median tells us which number sits in the middle of a dataset—assuming it’s ordered—while the mode is the number that occurs most often in a dataset. Calculating these is not as straightforward in SQL—so you can use another tool. I’ve chosen Python. The results are as follows:

*Mode: 0
*Median: 0
*Mean: 3.42

The number that repeats the most in the data is 0. Additionally, the number that sits in the middle of the dataset is also 0. Such metric values indicate the right-skewness of the data—i.e., we can find outliers to the right, towards higher values, of the data distribution. This implies that some students in the dataset have registered on the 365 platform but started watching a lecture much later. To convince ourselves, let’s also study visually the distribution of the numbers.

![Alt text](image/Analysis1.png)

Almost all students watch a lecture immediately after registering. Very few return to the platform to start a course several days or even a year after registration. One reason for returning could be because of a marketing campaign, a free-day campaign, etc.

** 3. Average Duration Between First-Time Engagement and First-Time Purchase **

Let’s study analogously the average duration between the first-time engagement and purchase. The results we retrieved from our SQL analysis show that, on average, it takes students roughly 24 days to purchase a subscription after getting acquainted with the product. Once again, we should take this result with a grain of salt and study the other relevant metrics: median and mode. Using, for example, Python, we can calculate the three metrics, which turn out to be as follows:

* Mode: 0
* Median: 1
* Mean: 26
  
We see that the mean is significantly higher than the other two metrics. This points towards the presence of even more extreme outliers in this dataset. Let’s discuss the metrics one by one. The most occurring value is again 0. Therefore, students who purchase a subscription are prone to do it on the same day. The value in the middle of the dataset—assuming it’s ordered—is 1, which means that the people who buy on the same day are less than half of all users making a purchase. To be more specific, about 49% of the people purchase on the day they’ve watched a lecture for the first time. The mean value, however, assumes that the transition from free-plan to paying students happens for almost a month. Let’s again estimate this discrepancy visually.

![Alt text](image/Analysis2.png)

We can again see that the data is skewed to the right, which we could’ve inferred from the fact that the mode is smaller than the median, which, in turn, is smaller than the mean. As we can see, most users purchase within a day or two after they’ve watched a lecture. Some people, however, purchase several months later. One reason could be that they liked the content on the platform but have been waiting for the product to be offered at an exclusive price.

Now that you’re familiar with the problem, can you think of any other analysis that could be performed? Feel free to play around with the dataset, explore other key metrics, and, most importantly, solidify your SQL knowledge.
