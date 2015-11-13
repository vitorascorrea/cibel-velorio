class FormulariosController < ApplicationController
  include FormulariosHelper
  
  def main
    @reserva = Reserva.new
  end

  def filtro_salas
  	if params[:mesmo_local] == "Sim"
  		@matriz = geraMatriz(Velorio.find(Cemiterio.find(params[:cemiterio_id])))
  	else
  		@matriz = geraMatriz(Velorio.find(params[:velorio_id]))
  	end
  	respond_to do |format|
  		format.js
  	end
  end

  def dados_reserva
    @sepultamento = params[:sepultamento]
    @sala = Sala.find(params[:sala_id])
    @velorio = @sala.velorio
    @cemiterio = Cemiterio.find(params[:cemiterio_id])
    @atendente = current_funcionario
    @reserva = Reserva.new

    respond_to do |format|
      format.js
    end
  end

  def criar_reserva
    @reserva = Reserva.new(
               cemiterio_id: params[:cemiterio], velorio_id: params[:velorio], sala_id: params[:sala], 
               sepultamento: params[:sepultamento], d_obito: params[:d_obito], falecido: params[:n_falecido],
               municipe: params[:n_municipe], atendente_id: current_funcionario.id)
    respond_to do |format|
        format.js
    end
  end
  
  def confirmar_reserva
    @reserva = Reserva.create(
               cemiterio_id: params[:reserva][:cemiterio_id], velorio_id: params[:reserva][:velorio_id], sala_id: params[:reserva][:sala_id], 
               sepultamento: params[:reserva][:sepultamento], d_obito: params[:reserva][:d_obito], falecido: params[:reserva][:falecido],
               municipe: params[:reserva][:municipe], atendente_id: current_funcionario.id)
    redirect_to root_url
  end

end
