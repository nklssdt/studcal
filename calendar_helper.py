import sqlite3 as sql, user_helper
import json, collections
from datetime import datetime
from bottle import request, redirect

def create_entry():
    title = dict(request.POST.decode())['title']
    date = request.forms.get('date')
    time = request.forms.get('time')
    text = dict(request.POST.decode())['details']

    from_date = datetime.now()
    till_date = date + " " + time + ":00"

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("INSERT INTO calendar(userid, title, text, create_date, till_date) VALUES (?, ?, ?, ?, ?)", (userid, title, text, from_date, till_date,))
    con.commit()
    con.close()

    return

def get_dates():
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM calendar WHERE userid = ?", (userid,))
    rows = cur.fetchall()

    objects_list = {}
    for row in rows:
        date = str(datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%Y-%m-%d'))
        time = str(datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%H:%M:%S'))
        objects_list[date] = {}
        objects_list[date]['title'] = row[2]
        objects_list[date]['details'] = row[3]
        objects_list[date]['time'] = time

    w = json.dumps(objects_list)
    return w