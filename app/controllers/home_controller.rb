class HomeController < ApplicationController
  
  def home
    if current_funcionario.class == Velorista
      @velorio = current_funcionario.velorio
      @reservas = @velorio.reservas.where(sepultamento: Time.now..24.hours.from_now)
    end
  end
end
