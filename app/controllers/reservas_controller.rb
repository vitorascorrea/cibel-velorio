class ReservasController < ApplicationController
  include FormulariosHelper
  include ReservasHelper
  
  def index
    @reservas = Reserva.all
  end 

  def selecao_velorio
    @velorio = Velorio.find(params[:velorio_id])
    @reservas = @velorio.reservas.order(sepultamento: :desc)
    @matriz = geraMatriz(@velorio)
  	respond_to do |format|
  		format.js
  	end
  end
  
  def edit
    @reserva = Reserva.find(params[:id])
    @velorio = @reserva.velorio
    @matriz = geraMatriz(@velorio)
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
      @resultado = Reserva.where('falecido LIKE ?', nome).paginate(page: params[:page], per_page: 1)
      respond_to do |format|
        format.js
      end
    end
  end
  
  private
  
  def reserva_params
    params.require(:reserva).permit(:falecido, :municipe, :d_obito)
  end
end
