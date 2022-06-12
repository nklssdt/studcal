# -*- coding: utf-8 -*-
"""
Created on Fri May 13 12:16:31 2022

@author: grave
"""

import sqlite3

db_path = "datenbank.db"
db_verbindung = sqlite3.connect(db_path)
db_cursor = db_verbindung.cursor()
db_cursor.execute("SELECT lectures FROM timetable WHERE id=6")
found_data = db_cursor.fetchall()


print(found_data)
db_verbindung.close()




