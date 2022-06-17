#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sqlite3 as sql, user_helper, ast
from bottle import request

def get_timetables():
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    cur.execute("SELECT * FROM timetable WHERE userid = ? ORDER BY active DESC", (userid,))
    result = cur.fetchall()

    con.close()

    return result

def get_timetables_name(timetableid):
    con = sql.connect("tmp/database.db")
    cur = con.cursor()

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    cur.execute("SELECT title FROM timetable WHERE userid = ? AND id= ?", (userid, timetableid,))
    result = cur.fetchone()

    con.close()

    return result[0]

def get_timetables_active():
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM timetable WHERE userid = ? AND active = 1", (userid,))
    result = cur.fetchone()
    con.close()

    if not result:
        result = ""

    return result

def set_active_timetable(id):
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("UPDATE timetable SET active = 0 WHERE userid = ? AND active = 1", (userid,))
    con.commit()

    cur.execute("UPDATE timetable SET active = 1 WHERE userid = ? AND id = ?", (userid, id,))
    con.commit()
    con.close()

    return

def get_timetable_value(value, id):
    if value == "day":
        day = ""
        if not id:
            day = "Nicht Festgelegt"
        if id == "a":
            day = "Montag"
        elif id == "b":
            day = "Dienstag"
        elif id == "c":
            day = "Mittwoch"
        elif id == "d":
            day = "Donnerstag"
        elif id == "e":
            day = "Freitag"
        elif id == "f":
            day = "Samstag"
        elif id == "g":
            day = "Sonntag"
        return day
    elif value == "time":
        time = ""
        if not id:
            time = "Nicht Festgelegt"
        elif id == "0":
            time = "06:00 - 08:00"
        elif id == "1":
            time = "08:00 - 10:00"
        elif id == "2":
            time = "10:00 - 12:00"
        elif id == "3":
            time = "12:00 - 14:00"
        elif id == "4":
            time = "14:00 - 16:00"
        elif id == "5":
            time = "16:00 - 18:00"
        elif id == "6":
            time = "18:00 - 20:00"
        return time
    else:
        return

def get_courses():
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM courses")
    result = cur.fetchall()

    con.close()

    return result

def get_timetables_active_courses(timeslot):
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT id FROM timetable WHERE active = 1 AND userid = ? AND removed = 0", (userid,))
    timetableid = cur.fetchone()[0]

    cur.execute("SELECT * FROM user_courses WHERE timetableid = ? AND userid = ? AND timeslot = ?", (timetableid, userid, timeslot))
    result = cur.fetchall()

    # 6 Dates 7 Time
    newlist =  []

    if not result:
        newlist = [('', '', ''),('','', ''),('','', ''),('','', ''),('','', ''),('','', ''),('','', '')]

    else:
        varA, varB, varC, varD, varE, varF, varG = (("","",""), )*7

        for row in result:
            if row[6] == "a":
                varA = ((row[3], row[5], row[0]))
            if row[6] == "b":
                varB = ((row[3], row[5], row[0]))
            if row[6] == "c":
                varC = ((row[3], row[5], row[0]))
            if row[6] == "d":
                varD = ((row[3], row[5], row[0]))
            if row[6] == "e":
                varE = ((row[3], row[5], row[0]))
            if row[6] == "f":
                varF = ((row[3], row[5], row[0]))
            if row[6] == "g":
                varG = ((row[3], row[5], row[0]))
                
        newlist.append(varA)
        newlist.append(varB)
        newlist.append(varC)
        newlist.append(varD)
        newlist.append(varE)
        newlist.append(varF)
        newlist.append(varG)

    con.close()
    return newlist

def get_user_courses(timetableid):
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM user_courses WHERE timetableid = ? AND userid = ? ORDER BY lecture", (timetableid, userid,))
    result = cur.fetchall()

    con.close()

    return result

def get_lecture(lid):
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM user_courses WHERE id = ? AND userid = ? ORDER BY lecture", (lid, userid,))
    result = cur.fetchall()

    con.close()

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
            cur.execute("INSERT INTO user_courses(userid, timetableid, lecture, type, color, day, timeslot) VALUES (?,?,?,?,?,?,?)", (userid, timetableid, row[3], row[4], row[5], row[6], row[7]))
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
    teacher = request.forms.get('teacher')
    location = request.forms.get('location')

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute('PRAGMA encoding="UTF-8";')
    cur.execute("INSERT INTO user_courses(userid, timetableid, lecture, type, color, day, timeslot, teacher, location) VALUES (?,?,?,?,?,?,?,?,?)", (userid, tid, lecture, type, color, day, timeslot, teacher, location))
    con.commit()
    con.close()

    return

def edit_course(cid):
    lecture = request.forms.get('lecture')
    type = request.forms.get('type')
    color = request.forms.get('color')
    day = request.forms.get('day')
    timeslot = request.forms.get('timeslot')
    teacher = request.forms.get('teacher')
    location = request.forms.get('location')

    if not timeslot:
        timeslot = ""
    if not day:
        day = ""
    if not teacher:
        teacher = ""
    if not location:
        location = ""

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("UPDATE user_courses SET lecture = ?, type = ?, color = ?, day = ?, timeslot = ?, teacher = ?, location = ?  WHERE userid = ? AND id = ?", (lecture, type, color, day, timeslot, teacher, location, userid, cid,))
    con.commit()
    con.close()

    return

def remove_course(cid):
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("DELETE FROM user_courses WHERE userid = ? AND id = ?", (userid, cid,))
    con.commit()

    return