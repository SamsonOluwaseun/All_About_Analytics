/****** Script for SelectTopNRows command from SSMS  ******/
/** In this script we explore period intelligence and daily data aggregation in SQL using the Lag and Lead Functions. DataSet used is the AdventureWorksDW2019
which is available on Microft portal for backup (bak) file downloads. Two senerios (Recent date first and Old date first) accross four time based values
(Monthly, Month on month, Month on same month previous year, Month on begining of the year) were considered***/



SELECT top 10 *
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
---########################################################################################
--------------------------------------Monthly Sales
SELECT count(productKey)prod_cnt,sum(orderQuantity) total_quantity,SUM(SalesAmount) total_sales, MONTH(orderDate) Mnth,YEAR(OrderDate) Sales_Yr
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
  group by MONTH(orderDate),YEAR(OrderDate)
  order by YEAR(OrderDate) desc,MONTH(orderDate)desc
  
----#######################################################################################
----------------------------------------Month on Month Sales
---- Recent date First
SELECT YEAR(OrderDate) Sales_Yr, MONTH(orderDate) Mnth,cast(max(orderDate) as date) EndofMonth,
count(productKey)prod_cnt,sum(orderQuantity) total_quantity,SUM(SalesAmount) total_sales, 
lead (SUM(SalesAmount)) over( order by YEAR(OrderDate)desc, MONTH(orderDate)desc) Previous_month
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
  group by MONTH(orderDate),YEAR(OrderDate)
   
---- Old date First
SELECT YEAR(OrderDate) Sales_Yr, MONTH(orderDate) Mnth,cast(max(orderDate) as date) EndofMonth,
count(productKey)prod_cnt,sum(orderQuantity) total_quantity,SUM(SalesAmount) total_sales, 
lag (SUM(SalesAmount)) over( order by YEAR(OrderDate), MONTH(orderDate)) Previous_month
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
  group by MONTH(orderDate),YEAR(OrderDate)


--##############################################################################################
----------------------------------Month on same Period Last year Sales
---- Recent date first
SELECT YEAR(OrderDate) Sales_Yr, MONTH(orderDate) Mnth,cast(max(orderDate) as date) EndofMonth,
count(productKey)prod_cnt,sum(orderQuantity) total_quantity,SUM(SalesAmount) total_sales, 
lead (SUM(SalesAmount), 12) over( order by YEAR(OrderDate)desc, MONTH(orderDate)desc) Previous_year
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
  group by MONTH(orderDate),YEAR(OrderDate) 
---- Old date first
SELECT YEAR(OrderDate) Sales_Yr, MONTH(orderDate) Mnth,cast(max(orderDate) as date) EndofMonth,
count(productKey)prod_cnt,sum(orderQuantity) total_quantity,SUM(SalesAmount) total_sales, 
lag(SUM(SalesAmount), 12) over( order by YEAR(OrderDate)asc, MONTH(orderDate)asc) Previous_year
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
  group by MONTH(orderDate),YEAR(OrderDate) 

-----###############################################################################################################
-----------------------------------------Month on begining of the year sales
--- Recent Date first
SELECT YEAR(OrderDate) Sales_Yr, MONTH(orderDate) Mnth,cast(max(orderDate) as date) EndofMonth,
count(productKey)prod_cnt,sum(orderQuantity) total_quantity,SUM(SalesAmount) total_sales, 
lead (SUM(SalesAmount), MONTH(orderdate)-1) over( order by YEAR(OrderDate)desc, MONTH(orderDate)desc) year_begin
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
  group by MONTH(orderDate),YEAR(OrderDate)

--- Old Date first
SELECT YEAR(OrderDate) Sales_Yr, MONTH(orderDate) Mnth,cast(max(orderDate) as date) EndofMonth,
count(productKey)prod_cnt,sum(orderQuantity) total_quantity,SUM(SalesAmount) total_sales, 
round(COALESCE(lag(SUM(SalesAmount), MONTH(orderdate)-1) over(order by YEAR(OrderDate), MONTH(orderDate)),0),2) year_begin
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
  group by MONTH(orderDate),YEAR(OrderDate)

##################################################################################################################################
------------Percentage increase Accross the three Metrics
with temp as (SELECT cast(max(orderDate) as Date) EndofMonth,
count(productKey)prod_cnt,sum(orderQuantity) total_quantity,SUM(SalesAmount) total_sales, 
lead (SUM(SalesAmount)) over( order by YEAR(OrderDate)desc, MONTH(orderDate)desc) Previous_month,
lead (SUM(SalesAmount), MONTH(orderdate)-1) over( order by YEAR(OrderDate)desc, MONTH(orderDate)desc) year_begin,
lead (SUM(SalesAmount), 12) over( order by YEAR(OrderDate)desc, MONTH(orderDate)desc) Previous_year
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]
  group by MONTH(orderDate),YEAR(OrderDate))
Select *,round(coalesce(((total_sales-Previous_month)/Previous_month)*100,0),2) MOM_perct_inc,
round(coalesce(((total_sales-year_begin)/year_begin)*100,0),2) YTD_perct_inc,
round(coalesce(((total_sales-Previous_year)/Previous_year)*100,0),2) YOY_perct_inc


  from temp
