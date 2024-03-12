#modules
from google.cloud import bigquery
client = bigquery.client(project='pythonetl-learn')

query = "select * from sampledataset.sample limit 10"
query_job= client.query(query)
results= query_job.result()

for r in results:
    print (r.year, r.title, r.genre, r.avg_vote)