/* global bootstrap: false */
(function () {
    'use strict'
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    tooltipTriggerList.forEach(function (tooltipTriggerEl) {
        new bootstrap.Tooltip(tooltipTriggerEl)
    })
})()

$(document).ready(function () {
    $("#passwordconf").bind('keyup change', function () {
        check_Password($("#password").val(), $("#passwordconf").val())
    })

    $("#register").click(function () {
        check_Password($("#password").val(), $("#passwordconf").val())
    })

    if (window.location.href.indexOf("tasks") > -1) {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);

        var editModal = new bootstrap.Modal(document.getElementById("taskEdit"), {});
        if (urlParams.get('action') == "edit") {
            editModal.show();
        };
    }
    
    if (window.location.href.indexOf("timetables") > -1) {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);

        var editModal = new bootstrap.Modal(document.getElementById("lectureEdit"), {});
        if (urlParams.get('action') == "edit") {
            editModal.show();
        };
    }
});

function check_Password(password, password_conf) {
    if (password === "") {} else if (password.length <= 8) {
        $("#passwordconf").focus()
        $('#confirm_password_msg').show()
        $("#confirm_password_msg").html('<div class="alert alert-danger mt-3">Das Passwort muss mindestens aus 8 Zeichen bestehen.</div>')
        document.querySelector('#register').disabled = true;

        setTimeout(function () {
            $('#confirm_password_msg').fadeOut('slow');
        }, 30000);

    } else if (password === password_conf) {
        $("#register").removeAttr("onclick")
        $('#confirm_password_msg').show()
        $("#confirm_password_msg").html('<div class="alert alert-success mt-3">Super! Dein Passwort sieht gut aus!</div>')
        document.querySelector('#register').disabled = false;

        setTimeout(function () {
            $('#confirm_password_msg').fadeOut('slow');
        }, 3000);

    } else {
        $("#passwordconf").focus()
        $('#confirm_password_msg').show()
        $("#confirm_password_msg").html('<div class="alert alert-danger mt-3">Die Passwörter stimmen nicht überein.</div>')
        document.querySelector('#register').disabled = true;

        setTimeout(function () {
            $('#confirm_password_msg').fadeOut('slow');
        }, 30000);

    }

}
