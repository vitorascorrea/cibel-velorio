class FormulariosController < ApplicationController
  
<<<<<<< HEAD
=======
  def main
    @reserva = Reserva.new
  end

>>>>>>> Primeira_Sprint
  def selecao_velorio
  	@cemiterios = Cemiterio.all
  	@velorios = Velorio.all
  end

  def filtro_salas
    @sepultamento = Cemiterio.find(params[:cemiterio_id])
    if params[:mesmo_local] != "1"
      @velorio = Velorio.find(params[:velorio_id])
    else
      @velorio = Velorio.find_by(nome: @sepultamento.nome)
    end
    @reserva = Reserva.create(atendente_id: current_funcionario.id, cemiterio_id: @sepultamento.id)
    @salas = @velorio.salas
    @array_salas = []
    gon.array = @array_salas
    @salas.each do |s|
      gon.array << maiorHorario(s)
    end
    gon.amanha = 1.day.from_now
  end

  def confirmacao_reserva
  	@reserva = Reserva.find(params[:reserva_id])
  	@h_sepul = date_time_from_date_time_select_params(params[:horario_sepultamento], 'horario')
  	@h_sepul_fix = fix_time(@h_sepul.to_time)
  	@reserva.update_attributes(sala_id: params[:sala_id], sepultamento: @h_sepul_fix, inicio: Time.now.in_time_zone)
  end

  private

    def date_time_from_date_time_select_params(date_params, key)
      string_from_date_select_params(date_params, key).to_datetime.utc
    end
    
    def string_from_date_select_params(params, key)
      date_parts = params.select { |k,v| k.to_s =~ /\A#{key}\([1-6]{1}i\)/ }.values
      date_parts[0..2].join('-') + ' ' + date_parts[3..-1].join(':')
    end
    
    def fix_time(time)
      offset = Time.now.in_time_zone.utc_offset
      time - offset
    end
    
    def maiorHorario(sala)
      sala.reservas.order(sepultamento: :desc).first
    end
end
