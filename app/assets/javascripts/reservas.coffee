# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  index_inicial = null
  sala = null
  sepultamento = moment(gon.sepultamento)
  inicio = moment(gon.inicio)
  $('#matriz-edit .agenda_ocupado').each ->
    index = $(this).index()
    index_inicial = index if !index_inicial
    horario = moment($('.horarios').eq(index-index_inicial).attr('data-horario'))
    if $(this).prev().text().slice(0, 4) is "Sala"
      sala = $(this).prev().text()
      sala = sala.slice(5, sala.length)
    if horario < sepultamento and horario > inicio and sala.toString() is gon.sala.toString()
      $(this).css('background-color', 'blue')