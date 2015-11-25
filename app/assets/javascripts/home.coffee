# jQuery ->
#   index_inicial = null
#   sala = null
#   # sepultamento = moment(gon.sepultamento)
#   # inicio = moment(gon.inicio)
#   alert gon.inicio
#   # $('#matriz_velorista .agenda_ocupado').each ->
  #   index = $(this).index()
  #   index_inicial = index if !index_inicial
  #   horario = moment($('.horarios').eq(index-index_inicial).attr('data-horario'))
  #   $(this).attr('data-horario', $('.horarios').eq(index-index_inicial).attr('data-horario'))
  #   sala = $(this).attr('data-sala').toString()
  #   if horario < sepultamento and horario >= inicio and sala is gon.sala.toString()
  #     $(this).css('background-color', 'yellow')