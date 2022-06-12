<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Registrieren - StudCal</title>
    <meta name="author" content="Niklas Schmidt - Universität Bremen">
    <meta name="description" content="StudCal ist ein von Studenten entwickelter Kalender zur Erleichterung des Studentenalltags sowie der Zusammenarbeit zwischen Kommilitonen*innen.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="icon" type="image/x-icon" href="/static/images/logo-icon.png" />
</head>

<body class="register-bg">
    <div class="vh-100">
        <div class="container py-4 h-100" style="display: none;">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="sc-glass-card">
                        <div class="row g-0">
                            <div class="col d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">
                                    <form action="#" method="post">
                                        <div class="d-flex align-items-center mb-3 pb-1">
                                            <span class="mb-0"><img src="static/images/logo-dark.png" width="150"></span>
                                        </div>
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Erstelle einen neuen Account.</h5>
                                        <div class="form-outline mb-4">
                                            %if error_account_exists:
                                            <div class="alert alert-danger mb-3"><strong>Fehler:</strong> Diese E-Mail Adresse wird bereits verwendet. Bitte logge dich ein oder wähle eine andere E-Mail Adresse.</div>
                                            %end
                                            <div>
                                                <label class="form-label fw-bolder" for="password">E-Mail*</label>
                                                <input type="text" id="email" name="email" class="form-control form-control-lg" placeholder="mail@domain.de" required>
                                            </div>
                                            <div class="mt-3">
                                                <label class="form-label fw-bolder" for="password">Vorname*</label>
                                                <input type="text" id="firstname" name="firstname" class="form-control form-control-lg" placeholder="Maximilian" required>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="mt-3">
                                                        <label class="form-label fw-bolder" for="password">Passwort*</label>
                                                        <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Dein Passwort" required>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="mt-3">
                                                        <label class="form-label fw-bolder" for="password">Passwort bestätigen*</label>
                                                        <input type="password" id="passwordconf" name="passwordconf" class="form-control form-control-lg" placeholder="Dein Passwort" required>
                                                    </div>
                                                </div>
                                                <p class="mt-2 text-muted">Das Passwort muss mindestens 8 Zeichen lang sein!</p>
                                                <span id="confirm_password_msg"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="pt-1 mb-4">
                                                    <button class="sc-btn sc-primary btn-block" name="register" id="register" type="submit">Registrieren</button>
                                                </div>
                                            </div>
                                        </div>

                                        <p class="mb-5 pb-lg-2">Du hast schon einen Account? <a href="./gate" class="sc-primary sc-no-ul">Log dich jetzt ein!</a></p>
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
