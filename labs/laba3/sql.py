import psycopg2

arr = 0

def get_users(id):
    global arr
    arr = id
    conn = psycopg2.connect(dbname='postgres', user="postgres", 
                        password='2210', host='localhost')
    cursor = conn.cursor()

    cursor.execute(f"select * from users where id = {id};")
    return cursor.fetchall()

    cursor.close()
    conn.close()


def change_pasport_id( pasport_id):
    conn = psycopg2.connect(dbname='postgres', user="postgres", 
                        password='2210', host='localhost')
    cursor = conn.cursor()
    print(arr)
    cursor.execute(f"update users set pasport_id = {pasport_id} where id = {arr}")

    conn.commit()
    cursor.execute(f"select * from users where id = {arr}")
    return cursor.fetchall()

    cursor.close()
    conn.close()


def delete():

    conn = psycopg2.connect(dbname='postgres', user="postgres", 
                        password='2210', host='localhost')
    cursor = conn.cursor()

    cursor.execute(f"DELETE FROM users WHERE id = {arr}")
    conn.commit()

    cursor.close()
    conn.close()

def add(id, pasport_id, name):

    conn = psycopg2.connect(dbname='postgres', user="postgres", 
                        password='2210', host='localhost')
    cursor = conn.cursor()

    sql = f"insert into users (id, pasport_id, name) values(%s, %s, %s)"
    val = (str(id),str(pasport_id), str(name))
    cursor.execute(sql, val)
    conn.commit()

    cursor.close()
    conn.close()


#psql \! chcp 1251