class FormulariosController < ApplicationController
  
  def main
    @reserva = Reserva.new
  end
end
