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
		falecido = $('#form_n_falecido').val().trim().length
		municipe = $('#form_n_municipe').val().trim().length
		if falecido is 0 or municipe is 0
			$('#botao_modal').click()
		else
			$('#cib_submit').click()
			
	$('#outro').hide()
	$('#label_outro').hide()
	$('#cemiterio_id').change ->
		if $('#cemiterio_id').val() is "0"
			$('#outro').show()
			$('#label_outro').show()
			$('#mesmo_local').val("Não")
			$('#mesmo_local').prop("disabled", true)
			$('#velorio').show()
		else
			$('#mesmo_local').prop("disabled", false)
			$('#velorio').hide()
			$('#outro').hide()
			$('#label_outro').hide()
			$('#mesmo_local').val("Sim")
			
	$('#sel_vel_sub').click ->
		if $('#cemiterio_id').val() isnt "0"
			$('#prox_pass_but').click()
		else
			if $('#outro').val() is ""
				$('#botao_modal_sel').click()
			else
				$('#prox_pass_but').click()