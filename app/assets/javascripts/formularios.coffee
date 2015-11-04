# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$(document).on 'ready page:load', ->
		$('#reserva_velorio_id').hide()
		$('#reserva_mesmo_local').change ->
			if $('#reserva_mesmo_local').val() == "Sim"
				$('#reserva_velorio_id').hide()
			else
				$('#reserva_velorio_id').show()
