import mysql.connector as mysql
import time
import datetime

HOST = "localhost"
DATABASE = "rest_info"
USER = "rest_manager"
PASSWORD = "iF2ONNbmcCTcdjrd"
db_connection = mysql.connect(host=HOST, database=DATABASE, user=USER, password=PASSWORD
print("Connected to:", db_connection.get_server_info())

cursor = db_connection.cursor()

for i in range(5):
    now = datetime.datetime.now()
    now.strftime('%Y-%m-%d %H:%M:%S')
    sql_insert = """INSERT INTO people_count (num_people_inside, date_time) VALUES (%s,%s)"""
    val = [i, now]
    print(val)
    cursor.execute(sql_insert, val)
    db_connection.commit()
    time.sleep(1)