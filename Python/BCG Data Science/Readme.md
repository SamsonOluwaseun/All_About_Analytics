# This is an Hands on Virtual Experience with BCG Through Forage 
This is an end-to-end data science project working with a consulting data scientist. These are the steps taken in real life project and it captured what is expected on any data science project that will impact business positively. 
### Business Understanding and Hypothesis Framing through data
In order to test the hypothesis of whether churn is driven by the customers’ price sensitivity, we would need to model churn probabilities of customers, and derive the effect of prices on churn rates. 
Based on my research, below are the main reasons why customers decides to stay or switch energy providers:

- Price in comparison to other providers.
- Discounts and promotions that lead to customers feeling recognized.
- Customer service complains handling and responses to email.
- Timely fault resolution either due to customers problem of the company.
- Availability of physical offices improves customer accessibility.
- Upgrade of systems and utility plan (moving from pre-paid to post-paid) and payment flexibility.

Quality data around the following will be required to have a whole understanding of why customers choose a power company:

- Customer demographics
- Customer subscription data
- Product pricing data (5 years)
- Customer account details
- Promotion data and marketing data
- Active and inactive customer accounts and aggregation

Getting this data help us achieve the following:

- Perform customer churn analysis across the business data set.
- Carry out comparative analytics of the Power company business pricing effect.
- I was also able to understand the variability in customer data.
### Exploratory Data Analysis
Here, I investigated whether price sensitivity is the most influential factor for a customer churning and used frameworks to conduct exploratory data analysis. Using python to analyze client data, I
created data visualizations to help you interpret key trends.

The following EDA commands were used
- Loaded data with pandas
```
client_df = pd.read_csv('./client_data.csv')
price_df = pd.read_csv('./price_data.csv')
```
-  Confirmed the structure of the dataset with the .head() function
```
client_df.head(3)
price_df.head(3)
```
-  Obtained the data descriptive statistics, understanding the data that we're dealing with along with the data types of each column. The data types will dictate how I transform and engineer features.
```
client_df.info()
price_df.info()
```
- I looked at some statistics about my dataset using
```
client_df.describe()
price_df.describe()
```
-  Performed data vitualization and created some charts
  * Churn distribution showing about 10% of the total customers have churned
      ![ChurnStatus](https://github.com/SamsonOluwaseun/All_About_Analytics/blob/main/Python/BCG%20Data%20Science/Image/churn.png)
  -  
-  
Data used contains 14606 Rows, and 63 columns, with an ID and Churn column representing the customer Identity and current status.
### Feature Engineering and Modelling
### Findings and Recommendation

## Program Summary
- Completed a customer churn analysis simulation for PowerCo - a majour gas and electricity utility, demonstrating advanced data analytics skills, identifying essential client data and outlining a strategic investigation approach.
- Conducted efficient data analysis using Python, including Pandas and NumPy. Employed data visualization techniques for insightful trend interpretation.
- Completed the engineering and optimization of a random forest model, achieving an 85% accuracy rate in predicting customer churn.
- Completed a concise executive summary for the Associate Director, delivering actionable insights for informed decision-making based on the analysis.
