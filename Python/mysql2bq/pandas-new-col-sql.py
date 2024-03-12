# exporting to csv
import mysql.connector
import pandas as pd
import os # To predefine the file and path name

conn = mysql.connector.connect(user= 'root',database= 'classicmodels')

cur_path=os.getcwd()

file='movie_rating.csv'
file_path=os.path.join(cur_path,'data_files',file)

#Extract transformation
query ="Select year"\
        ", title"\
        ", genre"\
        ", avg_vote"\
        ", case "\
        "   when avg_vote < 3 then 'bad' " \
        "   when avg_vote < 6 then 'Okay' "\
        "   when avg_vote >= 6 then 'good' "\
        "   end as movie_rating"\
        "from ''mydatabase.'table'"\
        "where year between 2005 and 2010"

df= pd.read_sql(query,conn)

df.to_csv(file_path, index=False)

conn.close()
