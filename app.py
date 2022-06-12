from bottle import route, run, template, static_file, redirect, response

import functions_helper, mensa_helper, user_helper, tasks_helper, timetable_helper

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
    if user_helper.register_user():
        redirect('./gate?success=account_created')
    else:
        data = {}
        data['error_account_exists'] = True
        return template('register', **data)

@route('/')
@user_helper.require_uid
def mainpage():
    #Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/")

    #Loads the data of Courses, Dishes and Tasks
    courses = timetable_helper.get_user_main_course()
    dishes = mensa_helper.view_dishes()
    tasks = tasks_helper.get_tasks()
    return template('main', **dishes, course=courses, rows=tasks)

@route('/mensa')
@user_helper.require_uid
def mensapage():
    #Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/mensa")
    
    #Loads the data of Dishes and Tasks
    dishes = mensa_helper.view_dishes()
    dish_dates = mensa_helper.load_dish_dates()
    tasks = tasks_helper.get_tasks()
    return template('mensa', **dish_dates, **dishes, rows=tasks)

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
    return template('timetables', **dishes, rows=tasks, course=courses, tables=timetables)

@route('/timetables/create', method='POST')
@user_helper.require_uid
def timetables_new():
    timetable_helper.create_timetable()
    return redirect('/timetables')

@route('/timetables/<action>/<id>')
@user_helper.require_uid
def timetable_action(action, id):
    if action == "view":
        courses = timetable_helper.get_user_courses(id)

        #Loads the data of Dishes, Tasks, Courses and Timetables
        dishes = mensa_helper.view_dishes()
        tasks = tasks_helper.get_tasks()
        return template('timetables_view',**dishes, timetableid=id, rows=tasks, course=courses)
#================================ Tasks Area ================================

@route('/tasks')
@user_helper.require_uid
def tasks():
    #Sets the Cookie to keep track of the user
    response.set_cookie("pp", "/tasks")

    #Loads the data of Dishes and Tasks
    tasks = tasks_helper.get_tasks()
    dishes = mensa_helper.view_dishes()
    return template('tasks', **dishes, rows=tasks)

@route('/tasks/<action>', method='POST')
@user_helper.require_uid
def tasks_action(action):
    if action == "create":
        tasks_helper.create_task()
        redirect('/tasks')
    return

@route('/tasks/<action>/<id>')
@user_helper.require_uid
def tasks_action(action, id):
    if action == "complete":
        tasks_helper.complete_task(id)
    return

run(host='127.0.0.1', port=8080, debug=True, reloader=True)