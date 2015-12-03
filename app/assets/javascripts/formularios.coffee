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
		obito = true
		falecido = true
		municipe = true
		obito = false if $('#form_d_obito').val().length is 0
		falecido = false if $('#form_n_falecido').val().length is 0
		municipe = false if $('#form_n_municipe').val().length is 0
		if obito and falecido and municipe
			$('#cib_submit').click()
		else
			$('#botao_modal').click()
			