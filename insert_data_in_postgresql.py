import psycopg2

data = open("output.csv", "r")

conn = psycopg2.connect(
    database="practice",
    user='postgres',
    password='123456',
    host='192.168.20.6',
    port='5432'
)

cursor = conn.cursor()



for x in data:
    passw, email, user = x.split(',')
    user = user.strip()

    passw = "'" + passw + "'"
    email = "'" + email + "'"
    user = "'" + user + "'"
    print(passw, email, user)
    cursor.execute(f"INCERT into fieldvpnusers(password, email, username) VALUES ({passw}, {email}, {user})")
conn.commit()
conn.close()
