import sqlite3 as sql
import json
import user_helper
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


def edit_calendar(cid):
    title = dict(request.POST.decode())['title']
    date = request.forms.get('date')
    time = request.forms.get('time')
    text = dict(request.POST.decode())['details']

    till_date = date + " " + time + ":00"

    till_date = datetime.strptime(till_date, '%Y-%m-%d %H:%M:%S')

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("UPDATE calendar SET title = ?, text = ?, till_date = ? WHERE userid = ? AND id = ?", (title, text, till_date, userid, cid,))
    con.commit()
    con.close()

    return


def remove_entry(cid):
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    prev_page = request.get_cookie("pp")

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("UPDATE calendar SET finished = 1 WHERE id = ? AND userid = ?", (cid, userid))
    con.commit()

    return redirect(prev_page)


def get_date(cid):
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM calendar WHERE userid = ? AND id = ?", (userid, cid))
    rows = cur.fetchall()
    con.close()

    return rows


def get_dates():
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM calendar WHERE userid = ? AND till_date >= date('now') AND finished = '0' ORDER BY till_date ASC LIMIT 1", (userid,))
    rows = cur.fetchall()
    con.close()

    return rows


def get_all_dates():
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM calendar WHERE userid = ? AND till_date >= date('now') AND finished = '0' ORDER BY till_date ASC", (userid,))
    rows = cur.fetchall()
    con.close()

    return rows


def get_all_privious_dates():
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM calendar WHERE userid = ? ORDER BY till_date ASC", (userid,))
    rows = cur.fetchall()
    con.close()

    return rows


def get_json_dates():
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM calendar WHERE userid = ? AND finished = '0'", (userid,))
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
