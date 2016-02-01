$('#resultado').html("<%= j render 'reservas/resultado', resultado: @resultado %>");

$(document).ready(function() {
    $('.data_table').DataTable( {
        "ordering": false,
        "searching": false,
        "lengthChange": false,
        "pageLength": 20,
        "info":     false
    } );
} );