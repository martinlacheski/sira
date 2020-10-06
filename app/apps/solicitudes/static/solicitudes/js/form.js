var solicitud = {
    items : {
        nombre:'',
        tipo:'',
        motivo:'',
        dni:'',
        nombres:'',
        apellido:'',
        email:'',
        sede:'',
        carrera:'',
        materia:'',
        comision:'',
        fecha_reserva:'',
        inicio_hs:'',
        fin_hs:'',
        repeticion:'',
        fin_repeticion:'',
    }
}

$(function () {
    $('.select2').select2({
        theme: "bootstrap4",
        language: 'es'
    })

    $('#fecha_reserva').datetimepicker({
        //format: 'DD-MM-YYYY',
        format: 'YYYY-MM-DD',
        //date: moment().format("DD-MM-YYYY"),
        date: moment().format("YYYY-MM-DD"),
        locale: 'es',
        minDate: moment().format("YYYY-MM-DD"),
    });
    $('#inicio_hs').datetimepicker({
        format: 'LT',
        //date: moment().format("DD-MM-YYYY"),
        locale: 'es',
    });
    $('#fin_hs').datetimepicker({
        format: 'LT',
        //date: moment().format("DD-MM-YYYY"),
        locale: 'es',
    });
    $('#fin_repeticion').datetimepicker({
        //format: 'DD-MM-YYYY',
        format: 'YYYY-MM-DD',
        //date: moment().format("DD-MM-YYYY"),
        date: moment().format("YYYY-MM-DD"),
        locale: 'es',
        minDate: moment().format("YYYY-MM-DD"),
    });

});