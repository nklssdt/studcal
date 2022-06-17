#!/usr/bin/env python
# -*- coding: utf-8 -*-

from bottle import route, run, template, static_file, redirect, response, Bottle

import mensa_helper, user_helper, tasks_helper, timetable_helper

@route('/static/<filepath:path>')
def load_static(filepath):
    return static_file(filepath, root='./static')

@route('/gate')
def gate():
    user_helper.redirect_user()
    return template('gate')

@route('/gate', method='POST')
def login():
    user_helper.login_verify()

@route('/logout')
def gate():
    return user_helper.logout_user()

@route('/register')
def register():
    data = {}
    data['error_account_exists'] = ""
    return template('register', **data)

@route('/register', method='POST')
def register_check():
    if user_helper.register_user(): #Function to register user
        redirect('./gate?success=account_created')
    else: #If registration not successfull, return to register page
        data = {}
        data['error_account_exists'] = True
        return template('register', **data)

@route('/')
@user_helper.require_uid
def mainpage():
    #Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/")

    #Loads the data of Dishes and Tasks
    dishes = mensa_helper.view_dishes()
    tasks = tasks_helper.get_tasks()

    return template('main', **dishes, active_page="index", rows=tasks)

@route('/mensa')
@user_helper.require_uid
def mensapage():
    #Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/mensa")

    #Loads the data of Dishes and Tasks
    dishes = mensa_helper.view_dishes()
    dish_dates = mensa_helper.load_dish_dates()
    tasks = tasks_helper.get_tasks()
    return template('mensa', **dish_dates, **dishes, active_page="mensa", rows=tasks)

#================================ Timetable Area ================================

@route('/timetables')
@user_helper.require_uid
def timetables():
    #Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/timetables")

    #Loads the data of Dishes, Tasks, Courses and Timetables
    dishes = mensa_helper.view_dishes()
    tasks = tasks_helper.get_tasks()
    courses = timetable_helper.get_courses()
    timetables = timetable_helper.get_timetables()
    return template('timetables', **dishes, active_page="timetables", rows=tasks, course=courses, tables=timetables)

@route('/timetables/create', method='POST')
@user_helper.require_uid
def timetables_new():
    timetable_helper.create_timetable()
    return redirect('/timetables')

@route('/timetables/create_course/<id>', method='POST')
@user_helper.require_uid
def timetable_create_course(id):
    timetable_helper.create_course(id)
    return redirect('/timetables/view/' + id)

@route('/timetables/view/<tid>/edit_course/<id>', method='POST')
@user_helper.require_uid
def timetable_edit_course(id, tid):
    timetable_helper.edit_course(id)
    return redirect('/timetables/view/' + tid)

@route('/timetables/view/<tid>/remove_course/<id>')
@user_helper.require_uid
def timetable_remove_course(id, tid):
    timetable_helper.remove_course(id)
    return redirect('/timetables/view/' + tid)

@route('/timetables/<action>/<id>')
@user_helper.require_uid
def timetable_action(action, id):
    if action == "view":
        courses = timetable_helper.get_user_courses(id)

        #Loads the data of Dishes, Tasks, Courses and Timetables
        dishes = mensa_helper.view_dishes()
        tasks = tasks_helper.get_tasks()
        return template('timetables_view',**dishes, active_page="timetables", timetableid=id, rows=tasks, course=courses)
    elif action == "active":
        timetable_helper.set_active_timetable(id)
        return redirect('/timetables')
    elif action == "edit":
        return

#================================ Tasks Area ================================

@route('/tasks')
@user_helper.require_uid
def tasks():
    #Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/tasks")

    #Loads the data of Dishes and Tasks
    tasks = tasks_helper.get_tasks()
    dishes = mensa_helper.view_dishes()
    return template('tasks', **dishes, active_page="tasks", rows=tasks)

@route('/tasks/<action>/<id>', method='POST')
@user_helper.require_uid
def tasks_action(action, id):
    if action == "create":
        tasks_helper.create_task()
        redirect('/tasks')
    elif action == "edit":
        tasks_helper.edit_task(id)
        redirect('/tasks/view/' + id)
    return

@route('/tasks/<action>/<id>')
@user_helper.require_uid
def tasks_action(action, id):
    #Loads the data of Dishes and Tasks
    tasks = tasks_helper.get_tasks()
    dishes = mensa_helper.view_dishes()

    if action == "complete":
        tasks_helper.complete_task(id)
    elif action == "view":
        task_data = tasks_helper.view_task(id)
        return template('tasks_view', **dishes, active_page="tasks", rows=tasks, taskdata=task_data)


run(host='127.0.0.1', port=8080, debug=True, reloader=True)