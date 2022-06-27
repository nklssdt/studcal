%from datetime import datetime
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
                        <div class="col-6">
                            <h1><span class="ms-2">Stundenpläne verwalten</span></h1>
                        </div>
                        <div class="col-6">
                            <button class="sc-btn sc-secondary float-end" type="button" data-bs-toggle="modal" data-bs-target="#timetableCreate">+ Hinzufügen</button>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        %for row in tables:
                        <div class="col-12 mb-2">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-1">
                                            <a href="/timetables/active/{{row[0]}}">
                                                <svg class="{{'active-tt' if row[3] == 1 else ''}}" viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                    <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path>
                                                </svg>
                                            </a>
                                        </div>
                                        <div class="col-9">
                                            <h5 class="card-title">{{row[2]}}</h5>
                                        </div>
                                        <div class="col-2 text-end">
                                            <div class="d-inline me-2">
                                                <a href="/timetables/remove/{{row[0]}}">
                                                    <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                        <polyline points="3 6 5 6 21 6"></polyline>
                                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                        <line x1="10" y1="11" x2="10" y2="17"></line>
                                                        <line x1="14" y1="11" x2="14" y2="17"></line>
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="d-inline me-2">
                                                <a href="/timetables/view/{{row[0]}}">
                                                    <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                                        <circle cx="12" cy="12" r="3"></circle>
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="d-inline">
                                                <a href="/timetables/view/{{row[0]}}?action=edit-timetable">
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
                        </div>
                        %end
                        %if not tables:
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-text">Keine Stundenpläne gefunden. Um einen neuen Stundenplan hinzuzufügen, drücke einfach auf "+ Hinzufügen".</p>
                                </div>
                            </div>
                        </div>
                        %end
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-text"><strong>Hinweis:</strong> Zum aktivieren eines Stundenplans klicke auf das jeweilige <svg class="" viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path>
                                        </svg> Bookmark Symbol.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="timetableCreate" tabindex="-1" aria-labelledby="timetableCreateLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="/timetables/create" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="timetableCreateLabel">Stundenplan hinzufügen</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <label class="form-label fw-bolder" for="titel">Titel*</label>
                                    <input type="text" id="name" name="name" class="form-control" placeholder="3. Semester" required>
                                </div>
                                <div class="mt-3">
                                    <label class="form-label fw-bolder" for="titel">Intelligente Erstellung</label>
                                    <select class="form-select" name="course">
                                        <option selected>Studiengang auswählen</option>
                                        %for row in course:
                                        <option value="{{row[1]}}">{{row[2]}}</option>
                                        %end
                                    </select>
                                    <select class="form-select mt-2" name="semester">
                                        <option selected>Semester auswählen</option>
                                        <option value="1">1. Semester</option>
                                        <option value="2">2. Semester</option>
                                        <option value="3">3. Semester</option>
                                        <option value="4">4. Semester</option>
                                        <option value="5">5. Semester</option>
                                        <option value="6">6. Semester</option>
                                    </select>
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
    <script type="text/javascript" src="/static/js/calendar.js"></script>
</body>

</html>
