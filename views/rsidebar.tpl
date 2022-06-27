%import bottle
<div class="col-25 h-100 sc-right-sidebar sc-bg-light">
    <div class="h-100 d-flex flex-column">
        <div class="row h-100 justify-content-center sc-calendar-box">
            <div class="calendar-box">
                <div class="text-center">
                    <div class="row">
                        <div class="col-3 text-center">
                            <div onclick="prevMonth()"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                    <line x1="19" y1="12" x2="5" y2="12"></line>
                                    <polyline points="12 19 5 12 12 5"></polyline>
                                </svg></div>
                        </div>
                        <div class="col-6">
                            <h6 class="sc-calendar-date" id="yearMonth"></h6>
                        </div>
                        <div class="col-3 text-center">
                            <div onclick="nextMonth()"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                </svg></div>
                        </div>
                    </div>
                </div>
                <div>
                    <ol class="calendarList1">
                        <li class="day-name">Mo</li>
                        <li class="day-name">Di</li>
                        <li class="day-name">Mi</li>
                        <li class="day-name">Do</li>
                        <li class="day-name">Fr</li>
                        <li class="day-name">Sa</li>
                        <li class="day-name">So</li>
                    </ol>
                    <ol class="calendarList2" id="calendarList">
                    </ol>
                </div>
            </div>
            <div class="calendar-entries mb-3">
                %if calentry:
                <h6 class="ms-3">Dein nächster Termin</h6>
                %end
                <div>
                    %for cale in calentry:
                    <div class="sc-task-card mb-2">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-10">
                                    <strong>{{cale[2]}}</strong>
                                    <span class="text-muted">{{datetime.strptime(cale[5], '%Y-%m-%d %H:%M:%S').strftime('%d.%m.%Y, %H:%M')}} Uhr</span>
                                </div>
                                <div class="col-2">
                                    <a href="/calendar/view/{{cale[0]}}?action=edit"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                            <path d="M12 20h9"></path>
                                            <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                                        </svg></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    %end
                </div>
            </div>
        </div>
        <div class="modal fade" id="calendarEdit" name="calendarEditModal" tabindex="-1" aria-labelledby="calendarEditLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form action="/calendar/create" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title" id="taskCreateLabel">Kalendareintrag hinzufügen</h5>
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
                                        <input type="date" id="calSetDate" name="date" class="form-control" value="" required>
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
                            <button type="submit" id="calendar_edit_id" class="sc-btn sc-secondary">Bearbeiten</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row h-100 d-flex align-content-start flex-wrap sc-task-box overflow-auto">
            <form action="/tasks/quick-create" class="p-0" method="post">
                <div class="input-group mb-3 p-0">
                    <input type="text" class="form-control" name="title" placeholder="Neue Aufgabe eingeben" aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn sc-btn-outline-primary" type="submit"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg></button>
                    </div>
                </div>
            </form>
            %for row in rows:
            <div class="sc-task-card mb-2">
                <div class="card-body">
                    <div class="row">
                        <div class="col-10 my-auto">
                            <a href="/tasks/view/{{row[0]}}" class="text-dark"><strong>{{row[2]}}</strong><br> <span class="text-muted">bis {{datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%d.%m.%Y, %H:%M')}} Uhr</span></a>
                        </div>
                        <div class="col-2 my-auto text-end">
                            <a href="/tasks/complete/{{row[0]}}"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                    <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                </svg></a>
                        </div>
                    </div>
                </div>
            </div>
            %end
            %if not rows:
            <div class="sc-task-card mb-2">
                <div class="card-body">
                    <span class="text-muted">Keine Aufgabe/n gefunden.</span>
                </div>
            </div>
            %end
        </div>
        <div class="row h-100 justify-content-center sc-mensa-box my-auto" style="height: 25vh;">
            <div class="text-muted"></div>
            <div id="carouselMensa" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselMensa" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselMensa" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselMensa" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="text-center">
                            <span class="text-muted">Gericht 1</span>
                            <h6>{{menu_0_0}}</h6>
                            <p>Preis für Studierende: {{menu_p_0_0}}</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="text-center">
                            <span class="text-muted">Gericht 2</span>
                            <h6>{{menu_0_1}}</h6>
                            <p>Preis für Studierende: {{menu_p_0_1}}</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="text-center">
                            <span class="text-muted">Gericht 3</span>
                            <h6>{{menu_0_2}}</h6>
                            <p>Preis für Studierende: {{menu_p_0_2}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
