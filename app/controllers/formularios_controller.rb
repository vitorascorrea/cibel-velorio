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
    @cemiterios = @cemiterios.sort
  end

def filtro_salas
  if params[:mesmo_local] == "Sim"
    @cemiterio = Cemiterio.find(params[:cemiterio_id]).id
    @nome_cemiterio = Cemiterio.find(@cemiterio).nome
    @velorio = Velorio.find_by(nome: @nome_cemiterio)
    if @velorio.nome == 'Vila Formosa II'
      @matriz = geraMatriz(@velorio, 15)
      @colspan_central = 96
      @colspan_borda_esq = @colspan_central - Time.now.hour.to_i * 4 - 4
      @colspan_borda_dir = Time.now.hour.to_i * 4 + 8
    else
      @matriz = geraMatriz(@velorio, 60)
      @colspan_central = 24
      @colspan_borda_esq = @colspan_central - Time.now.hour.to_i - 1
      @colspan_borda_dir = Time.now.hour.to_i + 2
    end
  else
    if params[:cemiterio_id] == "0"
      @cemiterio = Cemiterio.create(nome: params[:outro], outro: true).id
    else
      @cemiterio = Cemiterio.find(params[:cemiterio_id]).id
    end
    @velorio = Velorio.find(params[:velorio_id])
    if @velorio.nome == 'Vila Formosa II'
      @matriz = geraMatriz(@velorio, 15)
      @colspan_central = 96
      @colspan_borda_esq = @colspan_central - Time.now.hour.to_i * 4 - 4
      @colspan_borda_dir = Time.now.hour.to_i * 4 + 8
    else
      @matriz = geraMatriz(@velorio, 60)
      @colspan_central = 24
      @colspan_borda_esq = @colspan_central - Time.now.hour.to_i - 1
      @colspan_borda_dir = Time.now.hour.to_i + 2
    end
  end
  respond_to do |format|
    format.js
  end
end

  def dados_reserva
    @sepultamento = params[:sepultamento]
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
               municipe: params[:n_municipe], atendente_id: current_funcionario.id, ncf: params[:ncf])
    respond_to do |format|
        format.js
    end
  end

  def confirmar_reserva
    @reserva = Reserva.create(
               cemiterio_id: params[:reserva][:cemiterio_id], velorio_id: params[:reserva][:velorio_id], sala_id: params[:reserva][:sala_id],
               sepultamento: params[:reserva][:sepultamento], d_obito: params[:reserva][:d_obito], falecido: params[:reserva][:falecido],
               municipe: params[:reserva][:municipe], atendente_id: current_funcionario.id, contratacao: Time.now.in_time_zone, ncf: params[:reserva][:ncf])
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
