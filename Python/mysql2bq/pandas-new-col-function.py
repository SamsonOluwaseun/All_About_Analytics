# exporting to csv
import mysql.connector
import pandas as pd
import os # To predefine the file and path name

conn = mysql.connector.connect(user= 'root',database= 'classicmodels')

cur_path=os.getcwd()

file='movie_length.csv'
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
        ", duration"\
        "from ''mydatabase.'table'"\
        "where year between 2005 and 2010"

# Create a duration label function 
def movie_duration(d):
    if d <60:
        return 'short movie'
    elif d<90:
        return 'avg length movie'
    elif d < 5000:
        return 'really long movie'
    else:
        return 'no data'
    
df= pd.read_sql(query,conn)

# Add a new column with the function
df['watchability']= df['duration'].apply(movie_duration)

df.to_csv(file_path, index=False)

conn.close()
