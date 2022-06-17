%from datetime import datetime
<!DOCTYPE html>
<html lang="de" class="h-100">

<head>
    <meta charset="utf-8">
    <title>Aufgaben - StudCal</title>
    <meta name="author" content="Niklas Schmidt - Universität Bremen">
    <meta name="description" content="StudCal ist ein von Studenten entwickelter Kalender zur Erleichterung des Studentenalltags sowie der Zusammenarbeit zwischen Kommilitonen*innen.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
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
            %include('lsidebar.tpl')
            <div class="col h-100 overflow-auto">
                <div class="container p-3 mt-3">
                    <div class="row ps-2">
                        <div class="col-6">
                            <h1><span class="ms-2">Aufgaben</span></h1>
                        </div>
                        <div class="col-6">
                            <button class="sc-btn sc-secondary float-end" type="button" data-bs-toggle="modal" data-bs-target="#taskCreate">+ Hinzufügen</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="container">
                            %for row in rows:
                            <div class="card mb-2">
                                <div class="card-body p-3">
                                    <div class="row">
                                        <div class="col-8 my-auto ps-4">
                                            <h5>{{row[2]}}</h5>
                                            <span>{{row[3]}}</span>
                                        </div>
                                        <div class="col-6 col-lg-2 my-auto text-muted">
                                            <span>Fertigstellen bis:<br>
                                                {{datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%d.%m.%Y, %H:%M')}} Uhr</span>
                                        </div>
                                        <div class="col-6 col-lg-2 my-auto text-end pe-4">
                                            <div class="d-inline me-2">
                                                <a href="/tasks/view/{{row[0]}}">
                                                    <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                                </a>
                                            </div>
                                            <div class="d-inline me-2">
                                                <a href="/tasks/view/{{row[0]}}?action=edit">
                                                    <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                                        <path d="M12 20h9"></path>
                                                        <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="d-inline">
                                                <a href="/tasks/complete/{{row[0]}}">
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
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="taskCreate" tabindex="-1" aria-labelledby="taskCreateLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="/tasks/create" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="taskCreateLabel">Aufgabe hinzufügen</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <label class="form-label fw-bolder" for="titel">Titel*</label>
                                    <input type="text" id="title" name="title" class="form-control" placeholder="Hausarbeit" required>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="mt-3">
                                            <label class="form-label fw-bolder" for="date">Datum*</label>
                                            <input type="date" id="date" name="date" class="form-control" placeholder="" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="mt-3">
                                            <label class="form-label fw-bolder" for="time">Zeit*</label>
                                            <input type="time" id="time" name="time" class="form-control" placeholder="" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label class="form-label fw-bolder" for="details">Details</label>
                                    <textarea type="text" id="details" name="details" class="form-control" placeholder="Mehr Informationen" rows="4"></textarea>
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
