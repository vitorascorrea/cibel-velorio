class ReservasController < ApplicationController
  
  def index
    @reservas = Reserva.all
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
