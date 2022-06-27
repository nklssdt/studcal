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
    
    var calendarModal = new bootstrap.Modal(document.getElementById("calendarEdit"), {});

    const calFields = document.querySelectorAll('.calendarEditField')

    calFields.forEach(calField =>
        calField.addEventListener('click', calendarFieldClickHandler)
    )

    function calendarFieldClickHandler() {
        const calDate = this.dataset.caldate
        document.getElementById('calSetDate').value = calDate;
        calendarModal.show();
    }

    if (window.location.href.indexOf("tasks") > -1) {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);

        if (urlParams.get('action') == "edit") {
            var editModal = new bootstrap.Modal(document.getElementById("taskEdit"), {});
            editModal.show();
        };
    }

    if (window.location.href.indexOf("timetables") > -1) {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);

        if (urlParams.get('action') == "edit") {
            var editModal = new bootstrap.Modal(document.getElementById("lectureEdit"), {});
            editModal.show()
        };
    }
    
    if (window.location.href.indexOf("timetables") > -1) {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);

        if (urlParams.get('action') == "edit-timetable") {
            var editModal = new bootstrap.Modal(document.getElementById("timetableEdit"), {});
            editModal.show()
        };
    }
    
    if (window.location.href.indexOf("calendar") > -1) {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);

        if (urlParams.get('action') == "edit") {
            var editModal = new bootstrap.Modal(document.getElementById("calendarEdit"), {});
            editModal.show()
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
