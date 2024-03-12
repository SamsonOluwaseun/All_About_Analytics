#modules
from google.cloud import bigquery
import os
client = bigquery.client(project='pythonetl-learn')
target_table= 'pythonetl-learn.sampledataset.city_housing'

job_config = bigquery.loadjobconfig(
    skip_leading_rows =1,
    source_format= bigquery.SourceFormat.csv,
    autodetect = True
    write_disposition="WRITE_APPEND" #DEFAULT is WRITE_APPEND, WRITE_TRUNCATE: clean the table and write new file
)

# file vars
cur_path =os.getcwd()
file ='city_housing.csv'
file_path=os.path.join(cur_path,'data_files',file)

with open(file_path, 'rb') as source_file:#rb= read binary
    load_job=client.load_table_from_file(
        source_file,
        target_table,
        job_config= job_config
    )

load_job.result()

destination_table= client.get_table(target_table)
print(f"you have {destination_table.num_rows} rows in your table")