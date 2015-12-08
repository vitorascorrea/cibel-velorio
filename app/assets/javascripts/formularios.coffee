# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#velorio').hide()
	$('#mesmo_local').change ->
		if $('#mesmo_local').val() == "Sim"
			$('#velorio').hide()
		else
			$('#velorio').show()

	$('.corpo-principal').delegate "#botao_criar_reserva", "click", ->
		obito = $('#form_d_obito').val().trim().length
		falecido = $('#form_n_falecido').val().trim().length
		municipe = $('#form_n_municipe').val().trim().length
		if obito is 0 or falecido is 0 or municipe is 0
			$('#botao_modal').click()
		else
			$('#cib_submit').click()

			