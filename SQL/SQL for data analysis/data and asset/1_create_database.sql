/* Create a connection to your database server, I used VScode
connected to Postgres SQL environment for this session.
At the end of successful connection I saw the message below

{
  "previewLimit": 50,
  "server": "localhost",
  "port": 5432,
  "driver": "PostgreSQL",
  "name": "sqlcourse",
  "database": "sqlcourse",
  "username": "postgres"
}
*/

DROP DATABASE IF EXISTS sql_course;
CREATE DATABASE sql_course;

