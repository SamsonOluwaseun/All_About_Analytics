import mysql.connector
from mysql.connector import errorcode


conn = mysql.connector.connect(user= 'root',database= 'classicmodels')
cursor = conn.cursor()

query ="Select year"\
        ", title"\
        "from ''mydatabase.'table'"\
        "limit 5"

cursor.execute(query)

for (year,title) in cursor:
    print(year,title)


conn.close()