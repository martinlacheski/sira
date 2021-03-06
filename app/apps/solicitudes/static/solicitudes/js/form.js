$(function () {
    $('#nombre').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });

    $('#fecha_reserva').datepicker({
        language: "es",
        todayBtn: "linked",
        clearBtn: true,
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHigligth: true
    });

    $('#fin_repeticion').datepicker({
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

    //para buscar MATERIAS pertenecientes a una CARRERA seleccionada
    var select_materias = $('select[name="materia"]');
    $('select[name="carrera"]').on('change', function () {
        var id = $(this).val();
        console.log(id);
        var options = '<option value="">---------</option>';
        if (id === '') {
            select_materias.html(options);
            return false;
        }
        $.ajax({
            url: window.location.pathname,
            type: 'POST',
            data: {
                'action': 'search_materias_id',
                'id': id
            },
            dataType: 'json',

        }).done(function (data) {
            if (!data.hasOwnProperty('error')) {
                select_materias.html('').select2({
                    theme: "bootstrap4",
                    language: 'es',
                    data: data
                });
                return false;
            }
            message_error(data.error);
        }).fail(function (jqXHR, textStatus, errorThrown) {
            //alert(textStatus + ': ' + errorThrown);
        }).always(function (data) {
        });
    });

    select_materias.on('change', function () {
        var value = $(this).val();
        //var value = select_provincias.select2('data')[0];
        console.log(value);
    });

    //para buscar Usuario segun DNI
    //$('input[name="dni"]').focusout( function(request, response) {
        //alert( $(this).val() );
    //});

    $('input[name="dni"]').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: window.location.pathname,
                type: 'POST',
                data: {
                    'action': 'autocomplete',
                    'term': request.term
                },
                dataType: 'json',
            }).done(function (data) {
                response(data);
            }).fail(function (jqXHR, textStatus, errorThrown) {
                //alert(textStatus + ': ' + errorThrown);
            }).always(function (data) {

            });
        },
        //delay: 500,
        minLength: 8,
        select: function (event, ui) {
            //Autocompletar campos del DOCENTE
            //var nombre = $(ui.item).attr('nombre');
            var nombre = $(ui.item).attr('first_name');
            //var apellido = $(ui.item).attr('apellido');
            var apellido = $(ui.item).attr('last_name');
            var email = $(ui.item).attr('email');
            $('input[name="nombres"]').val(nombre);
            $('input[name="apellido"]').val(apellido);
            $('input[name="email"]').val(email);
            console.log(ui.item);
        },

    });

    //para buscar Horarios posteriores al de inicio
    var select_horarios = $('select[name="fin_hs"]');
    $('select[name="inicio_hs"]').on('change', function () {
        var id = $(this).val();
        console.log(id);
        var options = '<option value="">---------</option>';
        if (id === '') {
            select_horarios.html(options);
            return false;
        }
        $.ajax({
            url: window.location.pathname,
            type: 'POST',
            data: {
                'action': 'search_horarios_id',
                'id': id
            },
            dataType: 'json',

        }).done(function (data) {
            if (!data.hasOwnProperty('error')) {
                select_horarios.html('').select2({
                    theme: "bootstrap4",
                    language: 'es',
                    data: data
                });
                return false;
            }
            message_error(data.error);
        }).fail(function (jqXHR, textStatus, errorThrown) {
            //alert(textStatus + ': ' + errorThrown);
        }).always(function (data) {
        });
    });

    //para comparar horario de inicio y de fin
    $('select[name="fin_hs"]').on('change', function () {
        var id = $(this).val();
        console.log(id);
        if (($('select[name="inicio_hs"]').val()) > ($('select[name="fin_hs"]').val())) {
            message_error("La hora de finalización es menor que la de inicio, por favor verifique");
        }
    });
});