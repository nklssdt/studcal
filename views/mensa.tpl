%from datetime import datetime
<!DOCTYPE html>
<html lang="de" class="h-100">

<head>
    <meta charset="utf-8">
    <title>Mensa - StudCal</title>
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
    <script type="text/javascript" src="/static/js/calendar.js"></script>
</body>

</html>
