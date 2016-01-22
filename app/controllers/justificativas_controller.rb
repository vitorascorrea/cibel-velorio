class JustificativasController < ApplicationController
  
  def index
    @justificativas = Justificativa.all
  end
  
  
end
