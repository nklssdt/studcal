from bottle import request, redirect, response
from bcrypt import checkpw, hashpw, gensalt

import sqlite3 as sql
import random
import string


def apply_secret():  # Secret Key für die Cookies
    secretKey = "7v1glNn3SVGMrs7w2cb0"
    return secretKey


def login_verify():  # Prüft das eingebene Passwort
    email = request.forms.get('email')
    password = request.forms.get('password')
    if request.forms.get("staylogged"):
        staylogged = 1
    else:
        staylogged = 0

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT id, password FROM users WHERE email = ?", (email,))
    results = cur.fetchall()
    con.close()
    for row in results:
        if results is None or not checkpw(password.encode('utf-8'), row[1]):
            return redirect('./gate?error=login-error')
        return login_user(row[0], email, staylogged)
    return


def login_user(userid, email, staylogged=0):  # Loggt den Nutzer durch das Setzen von Cookies ein
    if staylogged:
        response.set_cookie("email", email, path='/', secret=apply_secret(), max_age=60*60*24*30)
        response.set_cookie("uid", userid, path='/', secret=apply_secret(), max_age=60*60*24*30)
    else:
        response.set_cookie("email", email, path='/', secret=apply_secret())
        response.set_cookie("uid", userid, path='/', secret=apply_secret())
    return redirect('./')


def redirect_user():  # Leitet den Nutzer bei erfolgter Anmeldung von der Gate Seite weg
    if request.get_cookie("email", secret=apply_secret()):
        return redirect("./")


def logout_user():  # Loggt den Nutzer aus, durch Nullsetzen der Cookies
    response.set_cookie("email", "", path='/')
    response.set_cookie("uid", "", path='/')
    return redirect('./gate')


def require_uid(fn):  # Funktion die prüft ob die Cookies gesetzt sind und wenn nicht löscht er alle Cookies und leitet er den Nutzer zum Gate weiter.
    def check_uid(**kwargs):
        if request.get_cookie("email", secret=apply_secret()):
            return fn(**kwargs)
        else:
            response.set_cookie("email", "", path='/')
            response.set_cookie("uid", "", path='/')
            redirect("./gate")
    return check_uid


def register_user():  # Funktion zum Anlegen eines Nutzers
    email = request.forms.get('email')
    password = request.forms.get('password')
    firstname = dict(request.POST.decode())['firstname']

    con = sql.connect("tmp/database.db")
    cur = con.cursor()
    cur.execute("SELECT id FROM users WHERE email = ?", (email,))
    if cur.fetchone():
        return False
    else:
        salt = ''.join(random.choice(string.ascii_letters) for i in range(30))
        password_hashed = hashpw(password.encode('utf-8'), gensalt())

        con = sql.connect("tmp/database.db")
        cur = con.cursor()
        cur.execute("INSERT INTO users(email, password, firstname, salt) VALUES (?, ?, ?, ?)", (email, password_hashed, firstname, salt))
        con.commit()
        con.close()

        return True
