import sqlite3 as sql, user_helper, datetime
from bottle import request, redirect

def get_tasks():
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    cur.execute("SELECT * FROM tasks WHERE userid = ? AND finished = 0 ORDER BY till_date ASC", (userid,))
    result = cur.fetchall()

    return result

def get_tasks_byid(id):
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    cur.execute("SELECT * FROM tasks WHERE userid = ? AND id = ?", (userid, id))
    result = cur.fetchall()

    return result

def create_task():
    title = request.forms.get('title')
    date = request.forms.get('date')
    time = request.forms.get('time')
    text = request.forms.get('details')

    from_date = datetime.datetime.now()
    till_date = date + " " + time + ":00"

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("INSERT INTO tasks(userid, title, text, from_date, till_date) VALUES (?, ?, ?, ?, ?)", (userid, title, text, from_date, till_date,))
    con.commit()
    con.close()

    return

def view_task(id):
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    cur.execute("SELECT * FROM tasks WHERE userid = ? AND id = ?", (userid, id,))
    result = cur.fetchall()

    return result

def edit_task(id):
    title = request.forms.get('title')
    date = request.forms.get('date')
    time = request.forms.get('time')
    text = request.forms.get('details')

    till_date = date + " " + time

    till_date = datetime.datetime.strptime(till_date, '%Y-%m-%d %H:%M:%S')

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("UPDATE tasks SET title = ?, text = ?, till_date = ? WHERE userid = ? AND id = ?", (title, text, till_date, userid, id,))
    con.commit()
    con.close()

    return

def complete_task(taskid):
    prev_page = request.get_cookie("pp")

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("UPDATE tasks SET finished = 1 WHERE id = ?", (taskid,))
    con.commit()

    return redirect(prev_page)