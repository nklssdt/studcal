const months = [
    {
        'id': 1,
        'name': 'Januar'
    },
    {
        'id': 2,
        'name': 'Februar'
    },
    {
        'id': 3,
        'name': 'März'
    },
    {
        'id': 4,
        'name': 'April'
    },
    {
        'id': 5,
        'name': 'Mai'
    },
    {
        'id': 6,
        'name': 'Juni'
    },
    {
        'id': 7,
        'name': 'Juli'
    },
    {
        'id': 8,
        'name': 'August'
    },
    {
        'id': 9,
        'name': 'September'
    },
    {
        'id': 10,
        'name': 'Oktober'
    },
    {
        'id': 11,
        'name': 'November'
    },
    {
        'id': 12,
        'name': 'Dezember'
    },
];
var currentYear = new Date().getFullYear();
var currentMonth = new Date().getMonth() + 1;

function letsCheck(year, month) {
    var daysInMonth = new Date(year, month, 0).getDate();
    var firstDay = new Date(year, month, -1).getUTCDay();
    var array = {
        daysInMonth: daysInMonth,
        firstDay: firstDay
    };
    return array;
}

function makeCalendar(year, month) {
    var getChek = letsCheck(year, month);
    getChek.firstDay === 0 ? getChek.firstDay = 7 : getChek.firstDay;
    $('#calendarList').empty();

    let yourDate = new Date();
    const offset = yourDate.getTimezoneOffset();
    yourDate = new Date(yourDate.getTime() - (offset * 60 * 1000));

    if (month < 10) {
        var fmonth = '0' + month;
    } else {
        var fmonth = month;
    }

    for (let i = 1; i <= getChek.daysInMonth; i++) {
        if (i === 1) {
            if (month === 6) {
                getChek.firstDay += 1;
            }
            var div = '<li class="calendarEditField" data-caldate="' + year + '-' + fmonth + '-0' + i + '" style="grid-column-start: ' + getChek.firstDay + ';">1</li>';
        } else {
            if (i < 10) {
                var fi = '0' + i;
            } else {
                var fi = i;
            }
            var fulldate = year + '-' + fmonth + '-' + fi;
            if (yourDate.toISOString().split('T')[0] === fulldate) {
                setactive = "active"
            } else {
                setactive = ""
            }
            var div = '<li class="calendarEditField ' + setactive + '" data-caldate="' + year + '-' + fmonth + '-' + fi + '">' + i + '</li>'
            showInfo(fulldate);
        }
        $('#calendarList').append(div);
    }
    monthName = months.find(x => x.id === month).name;
    $('#yearMonth').text(year + ' ' + monthName);
}

makeCalendar(currentYear, currentMonth);

function nextMonth() {
    currentMonth = currentMonth + 1;
    if (currentMonth > 12) {
        currentYear = currentYear + 1;
        currentMonth = 1;
    }
    $('#calendarList').empty();
    $('#yearMonth').text(currentYear + ' ' + currentMonth);
    makeCalendar(currentYear, currentMonth);
}


function prevMonth() {
    currentMonth = currentMonth - 1;
    if (currentMonth < 1) {
        currentYear = currentYear - 1;
        currentMonth = 12;
    }
    $('#calendarList').empty();
    $('#yearMonth').text(currentYear + ' ' + currentMonth);
    makeCalendar(currentYear, currentMonth);
}

function showInfo(event) {
    // link 
    var url = '/api/calendar/get_info';
    // get json
    getjson(url, function (obj) {
        for (key in obj) {
            if (event === key) {
                $('[data-caldate="' + key + '"]').addClass('calendarHasDates');  
            }
        }
    });
}

function getjson(url, callback) {
    var self = this,
        ajax = new XMLHttpRequest();
    ajax.open('GET', url, true);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var data = JSON.parse(ajax.responseText);
                return callback(data);
            } else {
                console.log(ajax.status);
            }
        }
    };
    ajax.send();
}
