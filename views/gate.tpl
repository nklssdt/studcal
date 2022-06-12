<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Gate - StudCal</title>
    <meta name="author" content="Niklas Schmidt - Universität Bremen">
    <meta name="description" content="StudCal ist ein von Studenten entwickelter Kalender zur Erleichterung des Studentenalltags sowie der Zusammenarbeit zwischen Kommilitonen*innen.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="icon" type="image/x-icon" href="/static/images/logo-icon.png" />
</head>

<body class="gate-bg">
    <div class="vh-100">
        <div class="container py-4 h-100" style="display: none;">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="sc-glass-card">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                <img rel=preload as=image src="static/images/gate-image.png" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">
                                    <form action="./gate" method="POST">
                                        <div class="d-flex align-items-center mb-3 pb-1">
                                            <span class="mb-0"><img src="static/images/logo-dark.png" width="150"></span>
                                        </div>
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Logge dich in deinen Account ein.</h5>
                                        <div class="form-outline mb-4">
                                            <div>
                                                <label class="form-label fw-bolder" for="password">E-Mail*</label>
                                                <input type="email" id="email" name="email" class="form-control form-control-lg" placeholder="mail@domain.de" required>
                                            </div>
                                            <div class="mt-3">
                                                <label class="form-label fw-bolder" for="password">Passwort*</label>
                                                <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Dein Passwort" required>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="staylogged" name="staylogged">
                                                        <label class="form-check-label" for="staylogged">
                                                            Für 30 Tage angemeldet bleiben
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col text-end"><a class="small sc-primary fw-bolder sc-no-ul" href="#">Passwort vergessen?</a></div>
                                            </div>
                                        </div>
                                        <div class="pt-1 mb-4">
                                            <button class="sc-btn sc-primary btn-block" name="login" type="submit">Login</button>
                                        </div>

                                        <p class="mb-5 pb-lg-2">Du hast noch keinen Account? <a href="./register" class="sc-primary sc-no-ul">Jetzt Registrieren!</a></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/static/js/app.js"></script>
    <script>
        $(window).on('load', function() {
            $('.overlay').delay(10).fadeOut('fast');
            $('.container').delay(100).fadeIn('slow');
        })

    </script>
</body>
