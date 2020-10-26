$(function () {
    $('#inicio').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });
    $('#fin').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });

    $('.select2').select2({
        theme: "bootstrap4",
        language: 'es'
    })

});