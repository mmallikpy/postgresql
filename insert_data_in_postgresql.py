import psycopg2

data = open("output.csv", "r", encoding="UTF-8")

conn = psycopg2.connect(
    database="practice",
    user='practice',
    password='1...3',
    host='192.168.x.6',
    port='5432'
)

cursor = conn.cursor()

for x in data:
    passw, email, user = x.split(',')

    passw = "'" + passw + "'"
    email = "'" + email + "'"
    user = "'" + user + "'"
    cursor.execute(f"INSERT into fieldvpnusers(password, email, username) VALUES ({passw}, {email}, {user})")
conn.commit()
conn.close()
