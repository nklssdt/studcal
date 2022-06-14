import sqlite3 as sql, user_helper, json
from bottle import request

def get_timetables():
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    cur.execute("SELECT * FROM timetable WHERE userid = ?", (userid,))
    result = cur.fetchall()

    return result

def get_timetables_name(timetableid):
    con = sql.connect("tmp/database.db")
    cur = con.cursor()

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    cur.execute("SELECT title FROM timetable WHERE userid = ? AND id= ?", (userid, timetableid,))
    result = cur.fetchone()
    return result[0]

def get_timetable_day(id):
    if not id:
        day = "Nicht Festgelegt"
        return day
    if id == "a":
        day = "Montag"
        return day
    elif id == "b":
        day = "Dienstag"
        return day
    elif id == "c":
        day = "Mittwoch"
        return day
    elif id == "d":
        day = "Donnerstag"
        return day
    elif id == "e":
        day = "Freitag"
        return day
    elif id == "f":
        day = "Samstag"
        return day
    elif id == "g":
        day = "Sonntag"
        return day

def get_timetable_time(id):
    if not id:
        time = "Nicht Festgelegt"
        return time
    elif id == "0":
        time = "06:00 - 08:00"
        return time
    elif id == "1":
        time = "08:00 - 10:00"
        return time
    elif id == "2":
        time = "10:00 - 12:00"
        return time
    elif id == "3":
        time = "12:00 - 14:00"
        return time
    elif id == "4":
        time = "14:00 - 16:00"
        return time
    elif id == "5":
        time = "16:00 - 18:00"
        return time
    elif id == "6":
        time = "18:00 - 20:00"
        return time

def get_courses():
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM courses")
    result = cur.fetchall()

    return result

def get_user_main_course():
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT id FROM timetable WHERE active = 1 AND userid = ?", (userid,))
    timetableid = cur.fetchone()
    
    cur.execute("SELECT * FROM user_courses WHERE timetableid = ? AND userid = ?", (timetableid, userid,))
    result = cur.fetchall()

    return result

def get_user_courses(timetableid):
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM user_courses WHERE timetableid = ? AND userid = ?", (timetableid, userid,))
    result = cur.fetchall()

    return result

def create_timetable():
    name = request.forms.get('name')
    course = request.forms.get('course')
    semester = request.forms.get('semester')

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()

    if course and semester:
        cur.execute("INSERT INTO timetable(userid, title) VALUES (?, ?)", (userid, name,))
        con.commit()

        timetableid = cur.lastrowid
        cur.execute("SELECT * FROM lectures WHERE course = ? AND semester = ?", (course, semester))
        result = cur.fetchall()

        for row in result:
            cur.execute("INSERT INTO user_courses(userid, timetableid, lecture, type, color, day, timeslot) VALUES (?,?,?,?,?,?,?,?,?)", (userid, timetableid, row[3], row[4], row[5], row[6], row[7]))
            con.commit()
        con.close()

        return

    else:
        cur.execute("INSERT INTO timetable(userid, title) VALUES (?, ?)", (userid, name,))
        con.commit()
        con.close()

    return

def create_course(tid):
    lecture = request.forms.get('lecture')
    type = request.forms.get('type')
    color = request.forms.get('color')
    day = request.forms.get('day')
    timeslot = request.forms.get('timeslot')

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    return
