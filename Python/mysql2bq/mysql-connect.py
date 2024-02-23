# Modules
import mysql.connector
from mysql.connector import errorcode


conn = mysql.connector.connect(user= 'root',database= 'classicmodels')
conn.close()

#try:
 #   conn = mysql.connector.connect(user= 'root',password= 'Colour34@.',host= '127.0.0.1',database= 'classicmodels',port= '3360')
        #read_default_file= 'C:/Users/oluwa/.my.cnf')
  #  print('connection Successful')
#    conn.close()
#except mysql.connector.Error as err:
 #   if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
  #      print('Check Credentials')
   # else:
    #    print('err')

