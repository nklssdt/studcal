import datetime, locale

locale.setlocale(locale.LC_ALL, '')

date_format = '%Y/%m/%d'
mensa_format = '%A, %d.%m.%Y'
month_format = '%B, %Y'

def month2str(date) -> str:
    datestr = datetime.datetime.strftime(date, month_format)
    return datestr

def mensa_date_conv(add_days) -> str:
    checktime = datetime.datetime.today().weekday()

    if checktime == 5:
        add_days += 2
    elif checktime == 6:
        add_days += 1
    
    datevar = datetime.datetime.today() + datetime.timedelta(days=add_days)

    checktime2 = datevar.weekday()

    if checktime2 == 5:
        add_days += 2
    elif checktime2 == 6:
        add_days += 2
    
    datevar = datetime.datetime.today() + datetime.timedelta(days=add_days)

    if datevar == datetime.datetime.today():
        datevar = "Heute"
    else:
        datevar = datetime.datetime.strftime(datevar, mensa_format)
    return datevar

now = datetime.datetime.now()
current_month = month2str(datetime.datetime.now())