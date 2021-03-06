class ReservasController < ApplicationController
  include FormulariosHelper
  include ReservasHelper

  before_action :pre_editou?, only: [:edit]

  def index
    @reservas = Reserva.all
  end

  def selecao_velorio
    @velorio = Velorio.find(params[:velorio_id])
    @reservas = @velorio.reservas.order(sepultamento: :desc)
    if Velorio.find(params[:velorio_id]).nome == 'Vila Formosa II'
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
  	respond_to do |format|
  		format.js
  	end
  end

  def edit
    @reserva = Reserva.find(params[:id])
    @velorio = @reserva.velorio
    if Velorio.find(@reserva.velorio_id).nome == 'Vila Formosa II'
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
    gon.sala = @reserva.sala.id
    gon.sepultamento = @reserva.sepultamento + 3600
    aux = false
    @reserva.sala.reservas.order(sepultamento: :desc).each do |r|
      if aux == true
        gon.inicio = r.sepultamento + 3600 if r && r.sepultamento
        break
      end
      if r == @reserva
        aux = true
      end
    end
    gon.inicio ? gon.inicio = gon.inicio : gon.inicio = Time.now.in_time_zone - 3600
  end

  def pre_edicao
    @reserva = Reserva.find(params[:reserva][:id_edit])
    Justificativa.create(reserva: @reserva.id, acao: "Editar", justificativa: params[:reserva][:justificativa], atendente: current_funcionario.id, horario: Time.now.in_time_zone)
    session[:pre_edicao] = true
    redirect_to edit_reserva_path(@reserva)
  end

  def update
    @reserva = Reserva.find(params[:id])
    @reserva.update_attributes(reserva_params)
    @reserva.update_attributes(sepultamento: params[:sepultamento], sala_id: params[:sala_id])
    redirect_to reservas_path
  end

  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.update_attributes(excluida: true)
    Justificativa.create(reserva: @reserva.id, acao: "Deletar", justificativa: params[:reserva][:justificativa], atendente: current_funcionario.id, horario: Time.now.in_time_zone)
    redirect_to reservas_path
  end

  def pesquisa
    if params[:Nome]
      nome = '%' + params[:Nome] + '%'
      adapter_type = ActiveRecord::Base.connection.adapter_name.downcase.to_sym
      case adapter_type
      when :sqlite
        @resultado = Reserva.where('falecido LIKE ?', nome)
      when :postgresql
        @resultado = Reserva.where('falecido ILIKE ?', nome)
      else
        @resultado = Reserva.where('falecido LIKE ?', nome)
      end
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def pre_editou?
    redirect_to reservas_path unless session[:pre_edicao]
    session.delete(:pre_edicao)
  end

  def reserva_params
    params.require(:reserva).permit(:falecido, :municipe, :d_obito)
  end
end
