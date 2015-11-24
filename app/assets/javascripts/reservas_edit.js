$(function() {
    $('.agenda_livre').click( function() {
        var clicou = true;
    	$('.agenda_livre').css('background-color', '#fff'); //Altera tudo pro padrão normal
    	document.getElementById('sepultamento').value = $(this).attr("data-horario");
        document.getElementById('sala_id').value = $(this).attr("data-sala");
        
        //Guarda a sala
        var sala = $(this).attr("data-sala");

        //Pinta o que foi clicado
        $(this).css('background-color', 'yellow'); 	

        //Pinta todos os outros
        $(this).prevAll('div').each(function(){
        	if($(this).attr("data-sala") == sala && $(this).hasClass('agenda_livre')){
        		$(this).css('background-color', 'yellow');
        	} else {
        	    return false;
        	}
        });       
    });
});