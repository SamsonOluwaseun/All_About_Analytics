# exporting to csv
import mysql.connector
import pandas as pd
import os # To predefine the file and path name

# Pivot in pandas

conn = mysql.connector.connect(user= 'root',database= 'classicmodels')

cur_path=os.getcwd()

file='city_housing.csv'
file_path=os.path.join(cur_path,'data_files',file)

#Extract transformation
query ="""select * 
from 'test_sql_course'.'city_house_prices'
"""
    
df= pd.read_sql(query,conn)

# data transformation steps
df.set_index('Date',inplace=True)
df = df.stack().reset_index() #Stack for Pivot in python

df.columns= ['date', 'city', 'price']


df.to_csv(file_path, index=False)
