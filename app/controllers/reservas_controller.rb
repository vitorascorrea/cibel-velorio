class ReservasController < ApplicationController
  include FormulariosHelper
  
  def index
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
    # @reserva_antiga = @reserva
    # @reserva.destroy 
    @matriz = geraMatriz(@velorio)
    # Reserva.create(@reserva_antiga.attributes)
    gon.sala = @reserva.sala.id
    gon.sepultamento = @reserva.sepultamento + 3600
    @reserva.sala.reservas.each do |r|
      if r.sepultamento < @reserva.sepultamento
        if gon.inicio
          gon.inicio = [r.sepultamento, gon.inicio].min
        end
        gon.inicio = r.sepultamento
      end
    end
    gon.inicio = gon.inicio + 3600
  end
  
  def update
  end
  
  def destroy
  end
end
