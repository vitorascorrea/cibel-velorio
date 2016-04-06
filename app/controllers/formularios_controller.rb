class FormulariosController < ApplicationController
  include FormulariosHelper
  
  def main
    @reserva = Reserva.new
    @cem_aux = []
    gon.cemiterios = {}
    Cemiterio.all.each do |c|
      if !c.outro
        @cem_aux << [c.nome, c.id]
        gon.cemiterios[c.id] = c
      end
    end
    @cemiterios = @cem_aux << ["Outro", 0]
  end

def filtro_salas
  if params[:mesmo_local] == "Sim"
    @cemiterio = Cemiterio.find(params[:cemiterio_id]).id
    @nome_cemiterio = Cemiterio.find(@cemiterio).nome
    @velorio = Velorio.find_by(nome: @nome_cemiterio)
    @matriz = geraMatriz(@velorio)
  else
    if params[:cemiterio_id] == "0"
      @cemiterio = Cemiterio.create(nome: params[:outro], outro: true).id
    else
      @cemiterio = Cemiterio.find(params[:cemiterio_id]).id
    end
    @velorio = Velorio.find(params[:velorio_id])
    @matriz = geraMatriz(@velorio)
  end
  respond_to do |format|
    format.js
  end
end

  def dados_reserva
    @sepultamento = params[:sepultamento].to_time.beginning_of_hour.to_s
    @sala = Sala.find(params[:sala_id])
    @velorio = Velorio.find(params[:velorio_id])
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
               municipe: params[:reserva][:municipe], atendente_id: current_funcionario.id, contratacao: Time.now.in_time_zone)
    redirect_to root_url
  end
  
  def impressao
    redirect_to root_url if !params[:reserva]
    @reserva = Reserva.new(
               cemiterio_id: params[:reserva][:cemiterio_id], velorio_id: params[:reserva][:velorio_id], sala_id: params[:reserva][:sala_id], 
               sepultamento: params[:reserva][:sepultamento], d_obito: params[:reserva][:d_obito], falecido: params[:reserva][:falecido],
               municipe: params[:reserva][:municipe], atendente_id: current_funcionario.id)
  end

end
