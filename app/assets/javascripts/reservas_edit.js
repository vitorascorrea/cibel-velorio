$(function() {
    $('td.td_livre').click( function() {
    	$('.agenda_livre').css('background-color', '#fff'); //Altera tudo pro padrão normal
        document.getElementById('sepultamento').value = $(this).find('.agenda_livre').attr("data-horario");
        document.getElementById('sala_id').value = $(this).find('.agenda_livre').attr("data-sala");
        
        //Guarda a sala
        var sala = $(this).find('.agenda_livre').attr("data-sala");

        //Pinta o que foi clicado
        $(this).find('.agenda_livre').css('background-color', 'yellow'); 	

        //Pinta todos os outros
        $(this).prevAll('td').each(function(){
            if ($(this).hasClass('td_ocupado')){
                return false;
            }
        	if($(this).find('.agenda_livre').attr("data-sala") == sala){
        		$(this).find('.agenda_livre').css('background-color', 'yellow');
        	}        	
        });       
    });
});