import sqlite3 as sql
import user_helper
from bottle import request, redirect


def get_timetables():  # Gibt alle Stundenpläne wieder
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    cur.execute("SELECT * FROM timetable WHERE userid = ? ORDER BY active DESC, title ASC", (userid,))
    result = cur.fetchall()

    con.close()

    return result


def get_timetables_name(timetableid):  # Gibt den Namen des Stundenplans aus
    con = sql.connect("tmp/database.db")
    cur = con.cursor()

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    cur.execute("SELECT title FROM timetable WHERE userid = ? AND id= ?", (userid, timetableid,))
    result = cur.fetchone()

    con.close()

    return result[0]


def get_timetables_active():  # Prüft ob ein Stundenplan aktiv ist und wenn gibt er die Daten aus
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM timetable WHERE userid = ? AND active = 1", (userid,))
    result = cur.fetchone()
    con.close()

    if not result:
        result = ""

    return result


def set_active_timetable(tid):  # Aktiviert einen Stundenplan mit der id = tid
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("UPDATE timetable SET active = 0 WHERE userid = ? AND active = 1", (userid,))
    con.commit()

    cur.execute("UPDATE timetable SET active = 1 WHERE userid = ? AND id = ?", (userid, tid,))
    con.commit()
    con.close()

    return


def get_timetable_value(value, tid):
    if value == "day":
        day = ""
        if not tid:
            day = "Nicht Festgelegt"
        if tid == "a":
            day = "Montag"
        elif tid == "b":
            day = "Dienstag"
        elif tid == "c":
            day = "Mittwoch"
        elif tid == "d":
            day = "Donnerstag"
        elif tid == "e":
            day = "Freitag"
        elif tid == "f":
            day = "Samstag"
        elif tid == "g":
            day = "Sonntag"
        return day
    elif value == "time":
        time = ""
        if not tid:
            time = "Nicht Festgelegt"
        elif tid == "0":
            time = "06:00 - 08:00"
        elif tid == "1":
            time = "08:00 - 10:00"
        elif tid == "2":
            time = "10:00 - 12:00"
        elif tid == "3":
            time = "12:00 - 14:00"
        elif tid == "4":
            time = "14:00 - 16:00"
        elif tid == "5":
            time = "16:00 - 18:00"
        elif tid == "6":
            time = "18:00 - 20:00"
        return time
    else:
        return


def get_courses():  # Gibt die eingespeicherten Module für die jeweiligen Studiengänge und Semester aus
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM courses ORDER BY name ASC")
    result = cur.fetchall()

    con.close()

    return result


def get_timetables_active_courses(timeslot):  # Gibt die Module aus dem jeweiligen Stundenplan wieder und gibt sie je nach Zeitslot wieder
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())
    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT id FROM timetable WHERE active = 1 AND userid = ? AND removed = 0", (userid,))
    timetableid = cur.fetchone()[0]

    cur.execute("SELECT * FROM user_courses WHERE timetableid = ? AND userid = ? AND timeslot = ?", (timetableid, userid, timeslot))
    result = cur.fetchall()

    newlist = []

    if not result:
        newlist = [('', '', '', '', ''), ('', '', '', '', ''), ('', '', '', '', ''), ('', '', '', '', ''), ('', '', '', '', ''), ('', '', '', '', ''), ('', '', '', '', '')]

    else:
        varA, varB, varC, varD, varE, varF, varG = (("", "", "", "", ""), )*7

        for row in result:
            if row[6] == "a":
                varA = ((row[3], row[5], row[0], row[2], row[4]))
            if row[6] == "b":
                varB = ((row[3], row[5], row[0], row[2], row[4]))
            if row[6] == "c":
                varC = ((row[3], row[5], row[0], row[2], row[4]))
            if row[6] == "d":
                varD = ((row[3], row[5], row[0], row[2], row[4]))
            if row[6] == "e":
                varE = ((row[3], row[5], row[0], row[2], row[4]))
            if row[6] == "f":
                varF = ((row[3], row[5], row[0], row[2], row[4]))
            if row[6] == "g":
                varG = ((row[3], row[5], row[0], row[2], row[4]))

        newlist.append(varA)
        newlist.append(varB)
        newlist.append(varC)
        newlist.append(varD)
        newlist.append(varE)
        newlist.append(varF)
        newlist.append(varG)

    con.close()
    return newlist


def get_user_courses(timetableid):  # Zeigt die Module eines Stundenplans mit der id = tid an
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM user_courses WHERE timetableid = ? AND userid = ? ORDER BY lecture", (timetableid, userid,))
    result = cur.fetchall()

    con.close()

    return result


def get_lecture(lid):  # Zeigt ein bestimmtes Modul aus einem Stundenplan an
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM user_courses WHERE id = ? AND userid = ? ORDER BY lecture", (lid, userid,))
    result = cur.fetchall()

    con.close()

    return result


def create_timetable():  # Erstellt einen neuen Stundenplan
    name = dict(request.POST.decode())['name']
    course = request.forms.get('course')
    semester = request.forms.get('semester')

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()

    if course and semester:  # Wenn Studiengang und Semester gegeben, sucht er die Daten aus der Datenbank und fügt die vordefinierten Kurse ein
        cur.execute("INSERT INTO timetable(userid, title) VALUES (?, ?)", (userid, name,))
        con.commit()
        tid = cur.lastrowid

        timetableid = cur.lastrowid
        cur.execute("SELECT * FROM lectures WHERE course = ? AND semester = ?", (course, semester))
        result = cur.fetchall()

        for row in result:
            cur.execute("INSERT INTO user_courses(userid, timetableid, lecture, type, color, day, timeslot) VALUES (?,?,?,?,?,?,?)", (userid, timetableid, row[3], row[4], row[5], row[6], row[7]))
            con.commit()
        con.close()

        return tid

    else:
        cur.execute("INSERT INTO timetable(userid, title) VALUES (?, ?)", (userid, name,))
        tid = cur.lastrowid
        con.commit()
        con.close()

    return tid


def update_timetable(tid):  # Editiert den Studenplannamen
    name = dict(request.POST.decode())['name']
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("UPDATE timetable SET title = ? WHERE userid = ? AND id = ?", (name, userid, tid,))
    con.commit()

    return


def remove_timetable(tid):  # Löscht den Stundenplan
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("DELETE FROM timetable WHERE userid = ? AND id = ?", (userid, tid,))
    con.commit()

    cur.execute("DELETE FROM user_courses WHERE userid = ? AND timetableid = ?", (userid, tid,))
    con.commit()

    return


def create_course(tid):  # Erstellt ein neues Modul über die manuelle Hinzufügenoption
    lecture = dict(request.POST.decode())['lecture']
    type = request.forms.get('type')
    color = request.forms.get('color')
    day = request.forms.get('day')
    timeslot = request.forms.get('timeslot')
    teacher = dict(request.POST.decode())['teacher']
    location = dict(request.POST.decode())['location']

    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute('PRAGMA encoding="UTF-8";')
    cur.execute("INSERT INTO user_courses(userid, timetableid, lecture, type, color, day, timeslot, teacher, location) VALUES (?,?,?,?,?,?,?,?,?)", (userid, tid, lecture, type, color, day, timeslot, teacher, location))
    con.commit()
    con.close()

    return


def edit_course(cid):  # Funktion zum editieren der Module
    lecture = dict(request.POST.decode())['lecture']
    type = request.forms.get('type')
    color = request.forms.get('color')
    day = request.forms.get('day')
    timeslot = request.forms.get('timeslot')
    teacher = dict(request.POST.decode())['teacher']
    location = dict(request.POST.decode())['location']

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


def remove_course(cid):  # Funktion zum Löschen der Module
    userid = request.get_cookie("uid", secret=user_helper.apply_secret())

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("DELETE FROM user_courses WHERE userid = ? AND id = ?", (userid, cid,))
    con.commit()

    return
