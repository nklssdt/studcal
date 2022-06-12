%import bottle
<div class="col-3 sc-right-sidebar sc-bg-light">
    <div class="h-100 d-flex flex-column">
        <div class="row h-100 justify-content-center sc-calendar-box">
            <div class="text-center">
                <div id="calendar-widget"></div>
            </div>
        </div>
        <div class="row h-100 justify-content-center sc-task-box overflow-auto">
            %for row in rows:
            <div class="sc-task-card mb-2">
                <div class="card-body">
                    <div class="row">
                        <div class="col-10 my-auto">
                            <div><strong>{{row[2]}}</strong> <span class="text-muted">bis {{datetime.strptime(row[5], '%Y-%m-%d %H:%M:%S').strftime('%d.%m.%Y, %H:%M')}} Uhr</span></div>
                            <span class="card-text">{{row[3]}}</span>
                        </div>
                        <div class="col-2 my-auto text-end">
                            <a href="/tasks/complete/{{row[0]}}"><svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg></a>
                        </div>
                    </div>
                </div>
            </div>
            %end
        </div>
        <div class="row h-100 justify-content-center sc-mensa-box p-1" style="height: 25vh;">
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
                            <h5>{{menu_0_0}}</h5>
                            <p>Preis für Studierende: {{menu_p_0_0}}</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="text-center">
                            <span class="text-muted">Gericht 2</span>
                            <h5>{{menu_0_1}}</h5>
                            <p>Preis für Studierende: {{menu_p_0_1}}</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="text-center">
                            <span class="text-muted">Gericht 3</span>
                            <h5>{{menu_0_2}}</h5>
                            <p>Preis für Studierende: {{menu_p_0_2}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>