%from datetime import datetime
%from bottle import request
%import timetable_helper

<!DOCTYPE html>
<html lang="de" class="h-100">

<head>
    <meta charset="utf-8">
    <title>Stundenpläne - StudCal</title>
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
                                        <div class="col-4">
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
                                        <div class="col text-center my-auto">
                                            <div><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                                </svg>
                                                {{timetable_helper.get_timetable_value("day", row[6])}}
                                            </div>

                                        </div>
                                        <div class="col text-center my-auto">
                                            <div><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                    <circle cx="12" cy="12" r="10"></circle>
                                                    <polyline points="12 6 12 12 16 14"></polyline>
                                                </svg>
                                                {{timetable_helper.get_timetable_value("time", row[7])}}
                                            </div>
                                        </div>
                                        <div class="col text-center my-auto">
                                            <div class="{{'text-muted' if not row[8] else ""}}"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg>
                                                <span>
                                                    {{'Lehrer' if not row[9] else row[9]}}
                                                </span>
                                            </div>
                                            <div class="mt-2 {{'text-muted' if not row[8] else ""}}"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                                    <circle cx="12" cy="10" r="3"></circle>
                                                </svg>
                                                <span>
                                                    {{'Ort' if not row[8] else row[8]}}
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col text-center my-auto">
                                            <span class="sc-dot my-auto" style="background-color: {{row[5]}};"></span>
                                        </div>
                                        <div class="col-1 my-auto">
                                            <a href="/timetables/view/{{timetableid}}/remove_course/{{row[0]}}">
                                                <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                            </a>
                                            <a href="/timetables/view/{{timetableid}}?action=edit&id={{row[0]}}">
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
                        <form action="/timetables/create_course/{{timetableid}}" method="post">
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
                                            <select class="form-select" name="day" required>
                                                <option value="" disabled>Tag auswählen</option>
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
                                            <select class="form-select" name="timeslot" required>
                                                <option value="" disabled>Zeit auswählen</option>
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
                                        <option value="S">Art auswählen</option>
                                        <option value="V">Vorlesung</option>
                                        <option value="Ü">Übung</option>
                                        <option value="T">Tutorium</option>
                                        <option value="s">Sonstige</option>
                                    </select>
                                </div>
                                <div class="mt-3">
                                    <div class="row">
                                        <div class="col">
                                            <label class="form-label fw-bolder" for="titel">Ort</label>
                                            <input type="text" id="location" name="location" class="form-control" placeholder="SFG 2020">
                                        </div>
                                        <div class="col">
                                            <label class="form-label fw-bolder" for="titel">Lehrkraft</label>
                                            <input type="text" id="teacher" name="teacher" class="form-control" placeholder="Frau Musterfrau">
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
            %lecture = timetable_helper.get_lecture(request.query.id)
            %for lec in lecture:
            <div class="modal fade" id="lectureEdit" tabindex="-1" aria-labelledby="lectureEditLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="/timetables/view/{{timetableid}}/edit_course/{{lec[0]}}" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="timetableCreateLabel">Eintrag bearbeiten</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <label class="form-label fw-bolder" for="titel">Name*</label>
                                    <input type="text" id="lecture" name="lecture" class="form-control" placeholder="Mathematik 1a" value="{{lec[3]}}" required>
                                </div>
                                <div class="mt-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="form-label fw-bolder" for="titel">Tag*</label>
                                            <select class="form-select" name="day" required>
                                                <option value="">Tag auswählen</option>
                                                <option value="a" {{'selected="selected"' if lec[6] == "a" else ""}}>Montag</option>
                                                <option value="b" {{'selected="selected"' if lec[6] == "b" else ""}}>Dienstag</option>
                                                <option value="c" {{'selected="selected"' if lec[6] == "c" else ""}}>Mittwoch</option>
                                                <option value="d" {{'selected="selected"' if lec[6] == "d" else ""}}>Donnerstag</option>
                                                <option value="e" {{'selected="selected"' if lec[6] == "e" else ""}}>Freitag</option>
                                                <option value="f" {{'selected="selected"' if lec[6] == "f" else ""}}>Samstag</option>
                                                <option value="g" {{'selected="selected"' if lec[6] == "g" else ""}}>Sonntag</option>
                                            </select>
                                        </div>
                                        <div class="col-6">
                                            <label class="form-label fw-bolder" for="titel">Zeitslot*</label>
                                            <select class="form-select" name="timeslot" required>
                                                <option value="">Zeit auswählen</option>
                                                <option value="0" {{'selected="selected"' if lec[7] == "0" else ""}}>06:00 - 08:00</option>
                                                <option value="1" {{'selected="selected"' if lec[7] == "1" else ""}}>08:00 - 10:00</option>
                                                <option value="2" {{'selected="selected"' if lec[7] == "2" else ""}}>10:00 - 12:00</option>
                                                <option value="3" {{'selected="selected"' if lec[7] == "3" else ""}}>12:00 - 14:00</option>
                                                <option value="4" {{'selected="selected"' if lec[7] == "4" else ""}}>14:00 - 16:00</option>
                                                <option value="5" {{'selected="selected"' if lec[7] == "5" else ""}}>16:00 - 18:00</option>
                                                <option value="6" {{'selected="selected"' if lec[7] == "6" else ""}}>18:00 - 20:00</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label class="form-label fw-bolder" for="titel">Art der Veranstaltung</label>
                                    <select class="form-select" name="type">
                                        <option value="S">Art auswählen</option>
                                        <option value="V" {{'selected="selected"' if lec[4] == "V" else ""}}>Vorlesung</option>
                                        <option value="Ü" {{'selected="selected"' if lec[4] == "Ü" else ""}}>Übung</option>
                                        <option value="T" {{'selected="selected"' if lec[4] == "T" else ""}}>Tutorium</option>
                                        <option value="S" {{'selected="selected"' if lec[4] == "S" else ""}}>Sonstige</option>
                                    </select>
                                </div>
                                <div class="mt-3">
                                    <div class="row">
                                        <div class="col">
                                            <label class="form-label fw-bolder" for="titel">Ort</label>
                                            <input type="text" id="location" name="location" class="form-control" placeholder="SFG 2020" value="{{lec[8]}}">
                                        </div>
                                        <div class="col">
                                            <label class="form-label fw-bolder" for="titel">Lehrkraft</label>
                                            <input type="text" id="teacher" name="teacher" class="form-control" placeholder="Frau Musterfrau" value="{{lec[9]}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label class="form-label fw-bolder" for="titel">Hintergrundfarbe*</label>
                                    <input type="color" id="color" name="color" list="colors" class="form-control form-control-color" value="{{lec[5]}}">
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
                                <button type="submit" class="sc-btn sc-secondary">Bearbeiten</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            %end
            %include('rsidebar.tpl')
        </div>
    </div>

    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/static/js/app.js"></script>
    <script type="text/javascript" src="/static/js/calendar.js"></script>
</body>

</html>
