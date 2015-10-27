# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#velorio_id').hide()
	$('#mesmo_local').change ->
		$('#velorio_id').toggle()
		
	#maiorData(sala) ->
		#for i in sala.reservas
		
	d = new Date(Date.parse(gon.array[0].sepultamento))
	amanha = new Date(Date.parse(gon.amanha))
		
	jQuery.datetimepicker.setLocale('pt-BR')
	
	logic = (currentDateTime) ->
	  # 'this' is jquery object datetimepicker
	  if currentDateTime.getDay() == amanha.getDay()
	    @setOptions
	    	format: 'd/m/Y H:i'
	    	minTime: '0:00'
	    	minDate: d
	    	maxDate: amanha
	  else
	    @setOptions 
	    	format: 'd/m/Y H:i'
	    	minTime: '0'
	    	minDate: d
	    	maxDate: amanha
	  return

	jQuery('#sala-1').datetimepicker
	  onChangeDateTime: logic
	  onShow: logic
		#maxDate: amanha
		#minTime: d	
