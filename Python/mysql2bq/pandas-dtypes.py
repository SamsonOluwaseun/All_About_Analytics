import mysql.connector
import pandas as pd


conn = mysql.connector.connect(user= 'root',database= 'classicmodels')

query ="Select year"\
        ", title"\
        "from ''mydatabase.'table'"\
        "limit 5"

df= pd.read_sql(query,conn)

print(df.head())
# Data types
print(df.dtypes)


conn.close()
