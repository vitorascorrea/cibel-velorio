class FormulariosController < ApplicationController
  
  def main
    @reserva = Reserva.new
  end

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
  	#Start here
  	@salas = @velorio.salas

  	#End here
  end

  def confirmacao_reserva
  	@reserva = Reserva.find(params[:reserva_id])
  	@reserva.update_attributes(sala_id: params[:sala_id], sepultamento: params[:date], inicio: Time.now.in_time_zone)
  end

  private

  #def checaHorario(sala)
  #	time = 0
  #	sala.reservas.each do |r|
  #		if r.sepultamento > time
  #			time = r.sepultamento
  #	end
  #	time
  #end


end
