jQuery ->
  index_inicial = null
  sala = null
  sepultamento = moment(gon.sepultamento)
  inicio = moment(gon.inicio)
  $('#matriz-edit .agenda_ocupado').each ->
    index = $(this).index()
    index_inicial = index if !index_inicial
    horario = moment($('.horarios').eq(index-index_inicial).attr('data-horario'))
    $(this).attr('data-horario', $('.horarios').eq(index-index_inicial).attr('data-horario'))
    sala = $(this).attr('data-sala').toString()
    if horario < sepultamento and horario >= inicio and sala is gon.sala.toString()
      $(this).removeClass('agenda_ocupado')
      $(this).addClass('agenda_livre')
      $(this).css('background-color', 'yellow')