%from datetime import datetime
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <title>Mensa - StudCal</title>
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
            <a class="navbar-brand" href="./">
                <img src="/static/images/logo-dark.png" alt="" height="36" class="d-inline-block align-text-top">
            </a>
        </div>
    </nav>

    <div class="container-fluid h-100 sc-container">
        <div class="row justify-content-center h-100">
            <div class="d-flex flex-column flex-shrink-0 sc-bg-light" style="width: 5rem;">
                <ul class="nav nav-pills my-auto nav-flush flex-column mb-auto text-center">
                    <li class="nav-item">
                        <a href="./" class="nav-link py-3 border-bottom" aria-current="page" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Stundenplan">
                            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="./tasks" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Aufgaben">
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
                        <a href="./timetables" class="nav-link py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Vorlesungen">
                            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="./mensa" class="nav-link active py-3 border-bottom" title="" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Mensa">
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
                        <img src="../static/images/default-user.jpg" alt="mdo" width="24" height="24" class="rounded-circle">
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
                        <div class="col">
                            <h1><span class="ms-2">Mensaplan</span></h1>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row p-3">
                        <h3 class="ms-3 mt-2 sc-mensa-day">{{day1}}</h3>
                        <div class="col-lg-4 col-12 mt-lg-0 mt-2">
                            <div class="card" style="min-height: 200px;">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-12 my-auto">
                                            <span class="text-muted ">Gericht 1</span>
                                            <h5 class="">{{menu_0_0}}</h5>
                                        </div>
                                        %if menu_p_0_0:
                                        <div class="col-12 position-absolute bottom-0 end-0 pb-3">
                                            <span class="text-muted">Preis für Studierende</span>
                                            <br><span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_0_0}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-12 mt-lg-0 mt-2">
                            <div class="card" style="min-height: 200px;">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-12 my-auto">
                                            <span class="text-muted ">Gericht 2</span>
                                            <h5 class="">{{menu_0_1}}</h5>
                                        </div>
                                        %if menu_p_0_1:
                                        <div class="col-12 position-absolute bottom-0 end-0 pb-3">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_0_1}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-12 mt-lg-0 mt-2">
                            <div class="card" style="min-height: 200px;">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-12 my-auto">
                                            <span class="text-muted ">Gericht 3</span>
                                            <h5 class="">{{menu_0_2}}</h5>
                                        </div>
                                        %if menu_p_0_2:
                                        <div class="col-12 position-absolute bottom-0 end-0 pb-3">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_0_2}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-3 mt-3">
                        <h3 class="ms-3 mt-2 sc-mensa-day">{{day2}}</h3>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 1</span>
                                            <h5 class="">{{menu_1_0}}</h5>
                                        </div>
                                        %if menu_p_1_0:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_1_0}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 2</span>
                                            <h5 class="">{{menu_1_1}}</h5>
                                        </div>
                                        %if menu_p_1_1:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_1_1}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 3</span>
                                            <h5 class="">{{menu_1_2}}</h5>
                                        </div>
                                        %if menu_p_1_2:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_1_2}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-3 mt-3">
                        <h3 class="ms-3 mt-2 sc-mensa-day">{{day3}}</h3>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 1</span>
                                            <h5 class="">{{menu_2_0}}</h5>
                                        </div>
                                        %if menu_p_2_0:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_2_0}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 2</span>
                                            <h5 class="">{{menu_2_1}}</h5>
                                        </div>
                                        %if menu_p_2_1:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_2_1}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 3</span>
                                            <h5 class="">{{menu_2_2}}</h5>
                                        </div>
                                        %if menu_p_2_2:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_2_2}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-3 mt-3">
                        <h3 class="ms-3 mt-2 sc-mensa-day">{{day4}}</h3>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 1</span>
                                            <h5 class="">{{menu_3_0}}</h5>
                                        </div>
                                        %if menu_p_3_0:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_3_0}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 2</span>
                                            <h5 class="">{{menu_3_1}}</h5>
                                        </div>
                                        %if menu_p_3_1:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_3_1}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 3</span>
                                            <h5 class="">{{menu_3_2}}</h5>
                                        </div>
                                        %if menu_p_3_2:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_3_2}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-3 mt-3">
                        <h3 class="ms-3 mt-2 sc-mensa-day">{{day5}}</h3>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 1</span>
                                            <h5 class="">{{menu_4_0}}</h5>
                                        </div>
                                        %if menu_p_4_0:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_4_0}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 2</span>
                                            <h5 class="">{{menu_4_1}}</h5>
                                        </div>
                                        %if menu_p_4_1:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_4_1}}</span>
                                        </div>
                                        %end
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-1">
                            <div class="card">
                                <div class="card-body justify-content-center">
                                    <div class="row">
                                        <div class="col-9 my-auto">
                                            <span class="text-muted ">Gericht 3</span>
                                            <h5 class="">{{menu_4_2}}</h5>
                                        </div>
                                        %if menu_p_4_2:
                                        <div class="col-3 my-auto">
                                            <span class="text-muted">Preis für Studierende</span><br>
                                            <span><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="sc-mensa-price">
                                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                                    <circle cx="12" cy="7" r="4"></circle>
                                                </svg> {{menu_p_4_2}}</span>
                                        </div>
                                        %end
                                    </div>
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
    <script type="text/javascript" src="/static/js/calendar-bundle.js"></script>
</body>

</html>
