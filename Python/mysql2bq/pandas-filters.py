import mysql.connector
import pandas as pd


conn = mysql.connector.connect(user= 'root',database= 'classicmodels')

query ="Select year"\
        ", title"\
        "from ''mydatabase.'table'"\
        "where year between 2005 and 2006"

df= pd.read_sql(query,conn)

print(df['year'].unique())

#Selecting only year 2005
yr_2005= df["year"] == 2005
print(df[yr_2005].head())

#Not 2005
print(df[~yr_2005].head())
print(df.head())


conn.close()
