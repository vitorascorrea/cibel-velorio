class ReservasController < ApplicationController
  include FormulariosHelper
  
  def index
    @reservas = Reserva.all
  end
  
  def selecao_velorio
    @velorio = Velorio.find(params[:velorio_id])
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
  
  def update
    @reserva = Reserva.find(params[:id])
    @reserva.update_attributes(reserva_params)
    @reserva.update_attributes(sepultamento: params[:sepultamento], sala_id: params[:sala_id])
    redirect_to reservas_path
  end
  
  def destroy
    Reserva.find(params[:id]).destroy
    redirect_to reservas_path
  end

  def pesquisa
    if params[:Nome]
      @resultado = Reserva.where("falecido LIKE ?", params[:Nome])
      respond_to do |format|
        format.html { render nothing: true }
        format.js { render layout: false }
      end
    end
  end
  
  private
  
  def reserva_params
    params.require(:reserva).permit(:falecido, :municipe, :d_obito)
  end
end
