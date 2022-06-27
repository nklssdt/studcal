#!/usr/bin/env python
# -*- coding: utf-8 -*-
from bottle import route, run, template, static_file, redirect, request, response

import mensa_helper
import user_helper
import tasks_helper
import timetable_helper
import calendar_helper


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
    if user_helper.register_user():  # Function to register user
        redirect('./gate?success=account_created')
    else:  # If registration not successfull, return to register page
        data = {}
        data['error_account_exists'] = True
        return template('register', **data)

# ================================ Main Area ================================


@route('/')
@user_helper.require_uid
def mainpage():
    # Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/")

    # Loads the data of Dishes and Tasks
    dishes = mensa_helper.view_dishes()
    tasks = tasks_helper.get_tasks()
    calendar = calendar_helper.get_dates()

    return template('main', **dishes, active_page="index", rows=tasks, calentry=calendar)


# ================================ Mensa Area ================================


@route('/mensa')
@user_helper.require_uid
def mensapage():
    # Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/mensa")

    # Loads the data of Dishes, Tasks and Calendar
    dishes = mensa_helper.view_dishes()
    dish_dates = mensa_helper.load_dish_dates()
    tasks = tasks_helper.get_tasks()
    calendar = calendar_helper.get_dates()

    return template('mensa', **dish_dates, **dishes, active_page="mensa", rows=tasks, calentry=calendar)

# ================================ Timetable Area ================================


@route('/timetables')
@user_helper.require_uid
def timetables():
    # Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/timetables")

    # Loads the data of Dishes, Tasks, Courses and Timetables
    dishes = mensa_helper.view_dishes()
    tasks = tasks_helper.get_tasks()
    courses = timetable_helper.get_courses()
    timetables = timetable_helper.get_timetables()
    calendar = calendar_helper.get_dates()
    return template('timetables', **dishes, active_page="timetables", rows=tasks, course=courses, tables=timetables, calentry=calendar)


@route('/timetables/create', method='POST')
@user_helper.require_uid
def timetables_new():
    tid = timetable_helper.create_timetable()
    return redirect('/timetables/view/' + str(tid))


@route('/timetables/create_course/<tid>', method='POST')
@user_helper.require_uid
def timetable_create_course(tid):
    timetable_helper.create_course(tid)
    return redirect('/timetables/view/' + tid)


@route('/timetables/view/<tid>/edit_course/<cid>', method='POST')
@user_helper.require_uid
def timetable_edit_course(cid, tid):
    timetable_helper.edit_course(cid)
    return redirect('/timetables/view/' + tid)


@route('/timetables/view/<tid>/remove_course/<cid>')
@user_helper.require_uid
def timetable_remove_course(cid, tid):
    timetable_helper.remove_course(cid)
    return redirect('/timetables/view/' + tid)


@route('/timetables/<action>/<tid>')
@user_helper.require_uid
def timetable_action(action, tid):
    if action == "view":
        response.set_cookie("pp", "/timetables/view/" + tid)
        courses = timetable_helper.get_user_courses(tid)

        # Loads the data of Dishes, Tasks, Courses and Timetables
        dishes = mensa_helper.view_dishes()
        tasks = tasks_helper.get_tasks()
        calendar = calendar_helper.get_dates()
        return template('timetables_view', **dishes, active_page="timetables", timetableid=tid, rows=tasks, course=courses, calentry=calendar)
    elif action == "active":
        timetable_helper.set_active_timetable(tid)
        return redirect('/timetables')
    elif action == "edit":
        timetable_helper.update_timetable(tid)
        return
    elif action == "remove":
        timetable_helper.remove_timetable(tid)
        return redirect('/timetables')


@route('/timetables/edit/<tid>', method="POST")
@user_helper.require_uid
def timetable_edit(tid):
    timetable_helper.update_timetable(tid)
    return redirect('/timetables/view/' + tid)


# ================================ Calendar Area ================================

@route('/calendar')
@user_helper.require_uid
def calendar():
    # Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/calendar")

    # Loads the data of Dishes and Tasks
    tasks = tasks_helper.get_tasks()
    dishes = mensa_helper.view_dishes()
    calendar = calendar_helper.get_dates()
    calendardata = calendar_helper.get_all_privious_dates()

    return template('calendar', **dishes, active_page="calendar", rows=tasks, calendardata=calendardata, calentry=calendar)


@route('/calendar/create', method='POST')
@user_helper.require_uid
def calendar_create():
    calendar_helper.create_entry()
    returnpage = request.get_cookie("pp")
    return redirect(returnpage)


@route('/api/calendar/get_info')
@user_helper.require_uid
def calendar_create():
    caldates = calendar_helper.get_json_dates()
    return caldates


@route('/calendar/<action>/<cid>')
@user_helper.require_uid
def calendar_action(action, cid):
    # Loads the data of Dishes and Tasks
    tasks = tasks_helper.get_tasks()
    dishes = mensa_helper.view_dishes()
    calendar = calendar_helper.get_dates()
    
    if action == "complete":
        calendar_helper.remove_entry(cid)
    elif action == "view":
        response.set_cookie("pp", "/calendar/view/" + cid)
        cal_data = calendar_helper.get_date(cid)
        return template('calendar_view', **dishes, active_page="tasks", rows=tasks, caldata=cal_data, calentry=calendar)


@route('/calendar/<action>/<cid>', method='POST')
@user_helper.require_uid
def calendar_post_action(action, cid):
    if action == "edit":
        calendar_helper.edit_calendar(cid)
        redirect('/calendar/view/' + cid)
    return


# ================================ Tasks Area ================================


@route('/tasks')
@user_helper.require_uid
def tasks():
    # Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/tasks")

    # Loads the data of Dishes and Tasks
    tasks = tasks_helper.get_tasks()
    dishes = mensa_helper.view_dishes()
    calendar = calendar_helper.get_dates()
    return template('tasks', **dishes, active_page="tasks", rows=tasks, calentry=calendar)


@route('/tasks/<action>', method='POST')
@user_helper.require_uid
def tasks__create_action(action):
    if action == "create":
        tasks_helper.create_task()
        redirect('/tasks')
    return


@route('/tasks/<action>/<tid>', method='POST')
@user_helper.require_uid
def tasks__create_action(action, tid):
    if action == "create":
        tasks_helper.create_task()
        redirect('/tasks')
    elif action == "edit":
        tasks_helper.edit_task(tid)
        redirect('/tasks/view/' + tid)
    return


@route('/tasks/<action>/<tid>')
@user_helper.require_uid
def tasks_action(action, tid):
    # Loads the data of Dishes and Tasks
    tasks = tasks_helper.get_tasks()
    dishes = mensa_helper.view_dishes()
    calendar = calendar_helper.get_dates()
    if action == "complete":
        tasks_helper.complete_task(tid)
    elif action == "view":
        response.set_cookie("pp", "/tasks/view/" + tid)
        task_data = tasks_helper.view_task(tid)
        return template('tasks_view', **dishes, active_page="tasks", rows=tasks, taskdata=task_data, calentry=calendar)


run(host='127.0.0.1', port=8080, debug=True, reloader=True)
