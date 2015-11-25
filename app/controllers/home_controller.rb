class HomeController < ApplicationController
  include FormulariosHelper
  
  def home
    if current_funcionario.class == Velorista
      @velorio = current_funcionario.velorio
      @salas = @velorio.salas
      @contador = 1
    end
    
    
    # if current_funcionario.class == Velorista
    #   @velorio = current_funcionario.velorio
    #   @matriz = geraMatriz(@velorio)
    #   aux = false
    #   @array = []
    #   hash = {}
    #   @velorio.salas.each do |s|
    #     s.reservas.order(sepultamento: :desc).each do |r|
    #       if aux == true
    #         if Time.now.in_time_zone >= r.sepultamento
    #           hash.store(s.id, Time.now.in_time_zone)
    #           @array << hash
    #           hash = {}
    #         else
    #           hash.store(s.id, r.sepultamento + 3600)
    #           @array << hash
    #           hash = {}
    #         end
    #         aux = false
    #       end
    #       aux = true
    #     end
    #   end
    #   gon.inicio = @array
    # end
  end
  
end
