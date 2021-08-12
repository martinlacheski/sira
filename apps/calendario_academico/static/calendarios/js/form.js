$(function () {
    $('#nombre').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "yyyy",
        autoclose: true,
        todayHigligth: true
    });
    $('#fecha_desde').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });
    $('#fecha_hasta').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });
    $('#primer_cuat_inicio').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });
    $('#primer_cuat_fin').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });
    $('#segundo_cuat_inicio').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });
    $('#segundo_cuat_fin').datepicker({
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