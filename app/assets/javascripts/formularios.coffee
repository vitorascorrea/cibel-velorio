# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#velorio_id').hide()
	$('#mesmo_local').change ->
		$('#velorio_id').toggle()
		
	jQuery.datetimepicker.setLocale('pt-BR')
	jQuery('#datetimepicker').datetimepicker
		format: 'd/m/Y H:i'
		minDate:'0' # '0' é a data/tempo atual
		minTime: '0'
	
