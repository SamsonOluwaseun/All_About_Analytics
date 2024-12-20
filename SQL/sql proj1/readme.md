# Calculating Free-to-Paid Conversion Rate with SQL Project
Calculating the Fraction of Students Who Convert to Paying Ones after Starting a Course

## Case Description
SQL is a powerful tool that can be used for extracting information from databases with its invaluable ability to join tables and aggregate results. Data extraction is the first step towards data analysis, and, therefore, extracting data correctly is crucial to arrive at the correct conclusions during the analysis process.

This Calculating Free-to-Paid Conversion Rate with SQL project aims to put your SQL skills into practice. I worked with an excerpt of a learning platform data—stripped of personally identifiable information—to estimate the fraction of students who purchase a subscription after starting a lecture, i.e., the free-to-paid conversion rate among students who’ve engaged with video content on the 365 platform. I was also be tasked with calculating several other key metrics and analyzing the results.

The data includes three tables storing information about students’ registration dates, engagement dates, and subscription purchase dates.

## Project requirements
For this Calculating Free-to-Paid Conversion Rate with SQL, I work with Microsoft SQL Server.

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

![Alt text](image/Studentdistribution.png)
