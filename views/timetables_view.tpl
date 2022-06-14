%from datetime import datetime
%import timetable_helper

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <title>Stundenpläne - StudCal</title>
    <meta name="author" content="Niklas Schmidt - Universität Bremen">
    <meta name="description" content="StudCal ist ein von Studenten entwickelter Kalender zur Erleichterung des Studentenalltags sowie der Zusammenarbeit zwischen Kommilitonen*innen.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/calendar-style.css">
    <link rel="icon" type="image/x-icon" href="/static/images/logo-icon.png" />
</head>

<body class="d-flex sc-bg-main flex-column h-100">

    <nav class="navbar navbar-light sc-bg-light sc-navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="/static/images/logo-dark.png" alt="" height="36" class="d-inline-block align-text-top">
            </a>
        </div>
    </nav>

    <div class="container-fluid h-100 sc-container">
        <div class="row justify-content-center h-100">
            <div class="d-flex flex-column flex-shrink-0 sc-bg-light" style="width: 5rem;">
                <ul class="nav nav-pills my-auto nav-flush flex-column mb-auto text-center">
                    <li class="nav-item">
                        <a href="../../" class="nav-link py-3 border-bottom" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Stundenplan">
                            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="../../tasks" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Aufgaben">
                            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                <polyline points="14 2 14 8 20 8"></polyline>
                                <line x1="16" y1="13" x2="8" y2="13"></line>
                                <line x1="16" y1="17" x2="8" y2="17"></line>
                                <polyline points="10 9 9 9 8 9"></polyline>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="../../timetables" class="nav-link active py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Vorlesungen">
                            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="../../mensa" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Mensa">
                            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <path d="M18 8h1a4 4 0 0 1 0 8h-1"></path>
                                <path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"></path>
                                <line x1="6" y1="1" x2="6" y2="4"></line>
                                <line x1="10" y1="1" x2="10" y2="4"></line>
                                <line x1="14" y1="1" x2="14" y2="4"></line>
                            </svg>
                        </a>
                    </li>
                </ul>
                <div class="dropdown dropend border-top">
                    <a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" id="dropdown-nutzermenu" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="/static/images/default-user.jpg" alt="mdo" width="24" height="24" class="rounded-circle">
                    </a>
                    <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdown-nutzermenu">
                        <li><a class="dropdown-item" href="#">Einstellungen</a></li>
                        <li><a class="dropdown-item" href="#">Profil</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="./logout">Abmelden</a></li>
                    </ul>
                </div>
            </div>
            <div class="col h-100 overflow-auto">
                <div class="container p-3 mt-3">
                    <div class="row ps-2">
                        <div class="col-10">
                            <h1><span class="ms-2">Stundenplan "{{timetable_helper.get_timetables_name(timetableid)}}" verwalten</span></h1>
                        </div>
                        <div class="col-2">
                            <button class="sc-btn sc-secondary float-end" type="button" data-bs-toggle="modal" data-bs-target="#lectureCreate">+ Hinzufügen</button>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        %for row in course:
                        <div class="col-12 mb-2">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">
                                            <h5>{{row[3]}}</h5>
                                            <span>
                                                %if row[4] == "V":
                                                %module_type = "Vorlesung"
                                                %elif row[4] == "Ü":
                                                %module_type = "Übung"
                                                %elif row[4] == "T":
                                                %module_type = "Tutorium"
                                                %else:
                                                %module_type = "Sonstige"
                                                %end
                                                {{module_type}}
                                            </span>
                                        </div>
                                        <div class="col-3">
                                            <span>{{timetable_helper.get_timetable_day(row[6])}}</span><br>
                                            <span>{{timetable_helper.get_timetable_time(row[7])}}</span>
                                        </div>
                                        <div class="col-1 my-auto">
                                            <a href="#">
                                                <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                    <path d="M12 20h9"></path>
                                                    <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        %end
                        %if not course:
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-text">Keine Einträge gefunden. Um einen neuen Eintrag hinzuzufügen, drücke einfach auf "+ Hinzufügen".</p>
                                </div>
                            </div>
                        </div>
                        %end
                    </div>
                </div>
            </div>
            <div class="modal fade" id="lectureCreate" tabindex="-1" aria-labelledby="lectureCreateLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="/timetables/create" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="timetableCreateLabel">Eintrag hinzufügen</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <label class="form-label fw-bolder" for="titel">Name*</label>
                                    <input type="text" id="lecture" name="lecture" class="form-control" placeholder="Mathematik 1a" required>
                                </div>
                                <div class="mt-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="form-label fw-bolder" for="titel">Tag*</label>
                                            <select class="form-select" name="day">
                                                <option selected>Tag auswählen</option>
                                                <option value="a">Montag</option>
                                                <option value="b">Dienstag</option>
                                                <option value="c">Mittwoch</option>
                                                <option value="d">Donnerstag</option>
                                                <option value="e">Freitag</option>
                                                <option value="f">Samstag</option>
                                                <option value="g">Sonntag</option>
                                            </select>
                                        </div>
                                        <div class="col-6">
                                            <label class="form-label fw-bolder" for="titel">Zeitslot*</label>
                                            <select class="form-select" name="timeslot">
                                                <option selected>Tag auswählen</option>
                                                <option value="0">06:00 - 08:00</option>
                                                <option value="1">08:00 - 10:00</option>
                                                <option value="2">10:00 - 12:00</option>
                                                <option value="3">12:00 - 14:00</option>
                                                <option value="4">14:00 - 16:00</option>
                                                <option value="5">16:00 - 18:00</option>
                                                <option value="6">18:00 - 20:00</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label class="form-label fw-bolder" for="titel">Art der Veranstaltung</label>
                                    <select class="form-select" name="type">
                                        <option value="s" selected>Art auswählen</option>
                                        <option value="v">Vorlesung</option>
                                        <option value="ü">Übung</option>
                                        <option value="t">Tutorium</option>
                                        <option value="s">Sonstige</option>
                                    </select>
                                </div>
                                <div class="mt-3">
                                    <div class="row">
                                        <div class="col">
                                            <label class="form-label fw-bolder" for="titel">Ort*</label>
                                            <input type="text" id="location" name="location" class="form-control" placeholder="SFG 2020" required>
                                        </div>
                                        <div class="col">
                                            <label class="form-label fw-bolder" for="titel">Lehrkraft*</label>
                                            <input type="text" id="teacher" name="teacher" class="form-control" placeholder="Frau Musterfrau" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label class="form-label fw-bolder" for="titel">Hintergrundfarbe*</label>
                                    <input type="color" id="color" name="color" list="colors" class="form-control form-control-color">
                                    <datalist id="colors">
                                        <option value="#c6e2e9">
                                        <option value="#47cacc">
                                        <option value="#ffbe88">
                                        <option value="#ffbec2">
                                        <option value="#faa2ae">
                                        <option value="#a7beb6">
                                        <option value="#c2d5a8">
                                        <option value="#f1ffc4">
                                        <option value="#ffee93">
                                    </datalist>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="sc-btn sc-light" data-bs-dismiss="modal">Abbrechen</button>
                                <button type="submit" class="sc-btn sc-secondary">Hinzufügen</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            %include('rsidebar.tpl')
        </div>
    </div>

    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/static/js/app.js"></script>
    <script type="text/javascript" src="/static/js/calendar-bundle.js"></script>
</body>

</html>
