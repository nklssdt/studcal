%from datetime import datetime
%import timetable_helper

<!DOCTYPE html>
<html lang="de" class="h-100">

<head>
    <meta charset="utf-8">
    <title>StudCal</title>
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
                            <h1><span class="ms-2">Stundenplan</span></h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="container">
                            <div class="card w-100">
                                <div class="card-body sc-card-body">
                                    %if timetable_helper.get_timetables_active():
                                    <div class="table-responsive">
                                        <table class="table table-bordered text-center sc-table">
                                            <thead>
                                                <tr class="bg-light-gray">
                                                    <th style="width: 10%;">
                                                        <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                            <circle cx="12" cy="12" r="10"></circle>
                                                            <polyline points="12 6 12 12 16 14"></polyline>
                                                        </svg>
                                                    </th>
                                                    <th class="text-uppercase" style="width: 12.85%;">Mo</th>
                                                    <th class="text-uppercase" style="width: 12.85%;">Di</th>
                                                    <th class="text-uppercase" style="width: 12.85%;">Mi</th>
                                                    <th class="text-uppercase" style="width: 12.85%;">Do</th>
                                                    <th class="text-uppercase" style="width: 12.85%;">Fr</th>
                                                    <th class="text-uppercase" style="width: 12.85%;">Sa</th>
                                                    <th class="text-uppercase" style="width: 12.85%;">So</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-center sc-table-time">06:00 - 08:00</td>
                                                    %course = timetable_helper.get_timetables_active_courses("0")
                                                    %for index, cval in enumerate(course):
                                                    %if cval[0]:
                                                    %if cval[4] == "V":
                                                    %module_type = "Vorlesung"
                                                    %elif cval[4] == "Ü":
                                                    %module_type = "Übung"
                                                    %elif cval[4] == "T":
                                                    %module_type = "Tutorium"
                                                    %else:
                                                    %module_type = "Sonstige"
                                                    %end
                                                    <td class="dropend">
                                                        <div class="sc-card sc-tt d-flex align-items-center justify-content-center" id="dropdown{{cval[2]}}" style="background-color: {{cval[1]}}" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <span><span class="fw-light fs-7">{{module_type}}</span><br>{{cval[0]}}</span>
                                                        </div>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdown{{cval[2]}}">
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}">Anzeigen</a></li>
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}?action=edit&id={{cval[2]}}">Bearbeiten</a></li>
                                                        </ul>
                                                    </td>
                                                    %else:
                                                    <td></td>
                                                    %end
                                                    %end
                                                </tr>

                                                <tr>
                                                    <td class="sc-table-time">08:00 - 10:00</td>
                                                    %course = timetable_helper.get_timetables_active_courses("1")
                                                    %for index, cval in enumerate(course):
                                                    %if cval[0]:
                                                    %if cval[4] == "V":
                                                    %module_type = "Vorlesung"
                                                    %elif cval[4] == "Ü":
                                                    %module_type = "Übung"
                                                    %elif cval[4] == "T":
                                                    %module_type = "Tutorium"
                                                    %else:
                                                    %module_type = "Sonstige"
                                                    %end
                                                    <td class="dropend">
                                                        <div class="sc-card sc-tt d-flex align-items-center justify-content-center" id="dropdown{{cval[2]}}" style="background-color: {{cval[1]}}" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <span><span class="fw-light fs-7">{{module_type}}</span><br>{{cval[0]}}</span>
                                                        </div>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdown{{cval[2]}}">
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}">Anzeigen</a></li>
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}?action=edit&id={{cval[2]}}">Bearbeiten</a></li>
                                                        </ul>
                                                    </td>
                                                    %else:
                                                    <td></td>
                                                    %end
                                                    %end
                                                </tr>

                                                <tr>
                                                    <td class="sc-table-time">10:00 - 12:00</td>
                                                    %course = timetable_helper.get_timetables_active_courses("2")
                                                    %for index, cval in enumerate(course):
                                                    %if cval[0]:
                                                    %if cval[4] == "V":
                                                    %module_type = "Vorlesung"
                                                    %elif cval[4] == "Ü":
                                                    %module_type = "Übung"
                                                    %elif cval[4] == "T":
                                                    %module_type = "Tutorium"
                                                    %else:
                                                    %module_type = "Sonstige"
                                                    %end
                                                    <td class="dropend">
                                                        <div class="sc-card sc-tt d-flex align-items-center justify-content-center" id="dropdown{{cval[2]}}" style="background-color: {{cval[1]}}" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <span><span class="fw-light fs-7">{{module_type}}</span><br>{{cval[0]}}</span>
                                                        </div>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdown{{cval[2]}}">
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}">Anzeigen</a></li>
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}?action=edit&id={{cval[2]}}">Bearbeiten</a></li>
                                                        </ul>
                                                    </td>
                                                    %else:
                                                    <td></td>
                                                    %end
                                                    %end
                                                </tr>

                                                <tr>
                                                    <td class="sc-table-time">12:00 - 14:00</td>
                                                    %course = timetable_helper.get_timetables_active_courses("3")
                                                    %for index, cval in enumerate(course):
                                                    %if cval[0]:
                                                    %if cval[4] == "V":
                                                    %module_type = "Vorlesung"
                                                    %elif cval[4] == "Ü":
                                                    %module_type = "Übung"
                                                    %elif cval[4] == "T":
                                                    %module_type = "Tutorium"
                                                    %else:
                                                    %module_type = "Sonstige"
                                                    %end
                                                    <td class="dropend">
                                                        <div class="sc-card sc-tt d-flex align-items-center justify-content-center" id="dropdown{{cval[2]}}" style="background-color: {{cval[1]}}" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <span><span class="fw-light fs-7">{{module_type}}</span><br>{{cval[0]}}</span>
                                                        </div>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdown{{cval[2]}}">
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}">Anzeigen</a></li>
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}?action=edit&id={{cval[2]}}">Bearbeiten</a></li>
                                                        </ul>
                                                    </td>
                                                    %else:
                                                    <td></td>
                                                    %end
                                                    %end
                                                </tr>

                                                <tr>
                                                    <td class="sc-table-time">14:00 - 16:00</td>
                                                    %course = timetable_helper.get_timetables_active_courses("4")
                                                    %for index, cval in enumerate(course):
                                                    %if cval[0]:
                                                    %if cval[4] == "V":
                                                    %module_type = "Vorlesung"
                                                    %elif cval[4] == "Ü":
                                                    %module_type = "Übung"
                                                    %elif cval[4] == "T":
                                                    %module_type = "Tutorium"
                                                    %else:
                                                    %module_type = "Sonstige"
                                                    %end
                                                    <td class="dropend">
                                                        <div class="sc-card sc-tt d-flex align-items-center justify-content-center" id="dropdown{{cval[2]}}" style="background-color: {{cval[1]}}" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <span><span class="fw-light fs-7">{{module_type}}</span><br>{{cval[0]}}</span>
                                                        </div>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdown{{cval[2]}}">
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}">Anzeigen</a></li>
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}?action=edit&id={{cval[2]}}">Bearbeiten</a></li>
                                                        </ul>
                                                    </td>
                                                    %else:
                                                    <td></td>
                                                    %end
                                                    %end
                                                </tr>

                                                <tr>
                                                    <td class="sc-table-time">16:00 - 18:00</td>
                                                    %course = timetable_helper.get_timetables_active_courses("5")
                                                    %for index, cval in enumerate(course):
                                                    %if cval[0]:
                                                    %if cval[4] == "V":
                                                    %module_type = "Vorlesung"
                                                    %elif cval[4] == "Ü":
                                                    %module_type = "Übung"
                                                    %elif cval[4] == "T":
                                                    %module_type = "Tutorium"
                                                    %else:
                                                    %module_type = "Sonstige"
                                                    %end
                                                    <td class="dropend">
                                                        <div class="sc-card sc-tt d-flex align-items-center justify-content-center" id="dropdown{{cval[2]}}" style="background-color: {{cval[1]}}" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <span><span class="fw-light fs-7">{{module_type}}</span><br>{{cval[0]}}</span>
                                                        </div>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdown{{cval[2]}}">
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}">Anzeigen</a></li>
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}?action=edit&id={{cval[2]}}">Bearbeiten</a></li>
                                                        </ul>
                                                    </td>
                                                    %else:
                                                    <td></td>
                                                    %end
                                                    %end
                                                </tr>

                                                <tr>
                                                    <td class="sc-table-time">18:00 - 20:00</td>
                                                    %course = timetable_helper.get_timetables_active_courses("6")
                                                    %for index, cval in enumerate(course):
                                                    %if cval[0]:
                                                    %if cval[4] == "V":
                                                    %module_type = "Vorlesung"
                                                    %elif cval[4] == "Ü":
                                                    %module_type = "Übung"
                                                    %elif cval[4] == "T":
                                                    %module_type = "Tutorium"
                                                    %else:
                                                    %module_type = "Sonstige"
                                                    %end
                                                    <td class="dropend">
                                                        <div class="sc-card sc-tt d-flex align-items-center justify-content-center" id="dropdown{{cval[2]}}" style="background-color: {{cval[1]}}" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <span><span class="fw-light fs-7">{{module_type}}</span><br>{{cval[0]}}</span>
                                                        </div>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdown{{cval[2]}}">
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}">Anzeigen</a></li>
                                                            <li><a class="dropdown-item" href="/timetables/view/{{cval[3]}}?action=edit&id={{cval[2]}}">Bearbeiten</a></li>
                                                        </ul>
                                                    </td>
                                                    %else:
                                                    <td></td>
                                                    %end
                                                    %end
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    %else:
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <p class="card-text">Du hast noch keinen Stundenplan angelegt. Um einen anzulegen, gehe auf den Punkt "Vorlesungen" im Menü links und erstelle dort einen Stundenplan.</p>
                                            </div>
                                        </div>
                                    </div>
                                    %end
                                </div>
                            </div>
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
