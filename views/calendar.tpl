%from datetime import datetime
%import timetable_helper

<!DOCTYPE html>
<html lang="de" class="h-100">

<head>
    <meta charset="utf-8">
    <title>Kalender - StudCal</title>
    <meta name="author" content="Niklas Schmidt - Universität Bremen">
    <meta name="description" content="StudCal ist ein von Studenten entwickelter Kalender zur Erleichterung des Studentenalltags sowie der Zusammenarbeit zwischen Kommilitonen*innen.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="icon" type="image/x-icon" href="/static/images/logo-icon.png" />
</head>

<body class="d-flex sc-bg-main flex-column h-100">
    %include('navbar.tpl')
    <div class="container-fluid h-100 sc-container">
        <div class="row justify-content-center h-100">
            %include('lsidebar.tpl')
            <div class="col">
                <div class="container p-3 mt-3">
                    <div class="row ps-2">
                        <div class="col">
                            <h1><span class="ms-2">Kalender</span></h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="container">
                            %for row in calendardata:
                            <div class="card mb-2">
                                <div class="card-body p-3">
                                    <div class="row">
                                        <div class="col-6 col-lg-3 my-auto">
                                            <h5>{{datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%d.%m.%Y, %H:%M')}} Uhr</h5>
                                        </div>
                                        <div class="col-7 my-auto ps-4">
                                            <h5>{{row[2]}}</h5>
                                            <span>{{row[3]}}</span>
                                        </div>
                                        <div class="col-6 col-lg-2 my-auto text-end pe-4">
                                            <div class="d-inline me-2">
                                                <a href="/calendar/view/{{row[0]}}?action=edit">
                                                    <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                        <path d="M12 20h9"></path>
                                                        <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="d-inline">
                                                <a href="/calendar/complete/{{row[0]}}">
                                                    <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                                        <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                                    </svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            %end
                            %if not calendardata:
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-text">Keine Einträge gefunden. Um einen neuen Eintrag hinzuzufügen, drücke einfach auf ein gewünschtes Datum auf der rechten Seite.</p>
                                    </div>
                                </div>
                            </div>
                            %end
                        </div>
                    </div>
                </div>
            </div>
            %include('rsidebar.tpl')
        </div>
    </div>

    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/static/js/app.js"></script>
    <script type="text/javascript" src="/static/js/calendar.js"></script>
</body>

</html>
