import os
import psycopg2

DATABASE_URL = os.environ['DATABASE_URL']

connection = psycopg2.connect(DATABASE_URL, sslmode='require')
cursor = connection.cursor()
postgreSQL_select_Query = "Select imageURL, type from colors NATURAL JOIN clothing"

cursor.execute(postgreSQL_select_Query)
mobile_records = cursor.fetchall()

# for row in mobile_records:
#    print(type(row[0]), type(row[1]))
print(len(mobile_records))
