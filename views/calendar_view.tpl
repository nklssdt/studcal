%from datetime import datetime

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

    <nav class="navbar navbar-light sc-bg-light sc-navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="/static/images/logo-dark.png" alt="" height="36" class="d-inline-block align-text-top">
            </a>
        </div>
    </nav>

    <div class="container-fluid h-100 sc-container">
        <div class="row justify-content-center h-100">
            % include('lsidebar.tpl')
            % for row in caldata:
            <div class="col h-100 overflow-auto">
                <div class="container p-3 mt-3">
                    <div class="row ps-2">
                        <div class="col-6">
                            <h1><span class="ms-2">Termin: {{datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%d.%m.%Y, %H:%M')}} Uhr</span></h1>
                        </div>
                        <div class="col-6">
                            <button class="sc-btn sc-secondary float-end" type="button" data-bs-toggle="modal" data-bs-target="#calendarEdit"><svg viewBox="0 1 26 26" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                    <path d="M12 20h9"></path>
                                    <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                                </svg> Bearbeiten</button>
                            <a class="sc-btn sc-primary me-2 float-end" href="../complete/{{row[0]}}"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg> Löschen</a>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5>{{row[2]}}</h5>
                                    <span>{{row[3]}}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="calendarEdit" tabindex="-1" aria-labelledby="calendarEditLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="/calendar/edit/{{row[0]}}" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="taskCreateLabel">Termin bearbeiten</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <label class="form-label fw-bolder" for="titel">Titel*</label>
                                    <input type="text" id="title" name="title" class="form-control" placeholder="Hausarbeit" value="{{row[2]}}" required>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="mt-3">
                                            <label class="form-label fw-bolder" for="date">Datum*</label>
                                            <input type="date" id="date" name="date" class="form-control" placeholder="" value="{{datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%Y-%m-%d')}}" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="mt-3">
                                            <label class="form-label fw-bolder" for="time">Zeit*</label>
                                            <input type="time" id="time" name="time" class="form-control" placeholder="" value="{{datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%H:%M:%S')}}" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label class="form-label fw-bolder" for="details">Details</label>
                                    <textarea type="text" id="details" name="details" class="form-control" placeholder="Mehr Informationen" rows="4">{{row[3]}}</textarea>
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
