jQuery ->
  index_inicial = null
  sala = null
  sepultamento = moment(gon.sepultamento)
  inicio = moment(gon.inicio)
  $('#matriz-edit td.td_ocupado').each ->
    index = $(this).index()
    index_inicial = index if !index_inicial
    horario = moment($('.horarios').eq(index-index_inicial).attr('data-horario').slice(0,19))
    $(this).attr('data-horario', $('.horarios').eq(index-index_inicial).attr('data-horario').slice(0,19))    
    sala = $(this).find('.agenda_ocupado').attr('data-sala').toString()
    if horario < sepultamento and horario >= inicio and sala is gon.sala.toString()
      $(this).find('.agenda_ocupado').addClass('agenda_livre')
      $(this).find('.agenda_ocupado').removeClass('agenda_ocupado')
      $(this).removeClass('td_ocupado')
      $(this).addClass('td_livre')
      $(this).find('.agenda_livre').css('background-color', 'yellow')
      $(this).find('.agenda_livre').attr('data-horario', $('.horarios').eq(index-index_inicial).attr('data-horario').slice(0,19))
      
  
  $('#salva_reserva_edit_page').click ->
    obt = $('#edit_d_obito_salvar').val().trim().length
    flc = $('#edit_n_falecido_salvar').val().trim().length
    mnc = $('#edit_n_municipe_salvar').val().trim().length
    if obt is 0 or flc is 0 or mnc is 0
      $('#edit_submit_modal').click()
    else
      $('#edit_submit_mudancas').click()