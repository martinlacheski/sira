
$(function () {

    $('#data').DataTable({

        responsive: true,
        autoWidth: false,
        destroy: true,
        deferRender: true,
        ajax: {
            url: window.location.pathname,
            type: 'POST',
            data: {
                'action': 'searchdata'
            },
            dataSrc: ""
        },
        columns: [
            {"data": "id"},
            {"data": "estado"},
            {"data": "apellido"},
            {"data": "nombres"},
            {"data": "carrera.nombre"},
            {"data": "materia.nombre"},
            {"data": "comision.nombre"},
            {"data": "observaciones"},
            {"data": "nombre"},
        ],
        columnDefs: [
            {
                targets: [-1],
                class: 'text-center',
                orderable: false,
                render: function (data, type, row) {
                    var buttons = '<a href="/solicitudes/update/' + row.id + '/" type="button" class="btn btn-warning btn-xs btn-flat"><i class="fas fa-edit"></i></a> ';
                    buttons += '<a href="/solicitudes/confirm/' + row.id + '/" class="btn btn-success btn-xs btn-flat"><i class="fas fa-check"></i></a> ';
                    buttons += '<a href="/solicitudes/cancel/' + row.id + '/" type="button" class="btn btn-danger btn-xs btn-flat"><i class="fas fa-times"></i></a>';
                    return buttons;
                }
            },
        ],

        initComplete: function (settings, json) {

        }

    });
});
