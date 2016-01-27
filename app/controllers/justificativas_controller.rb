class JustificativasController < ApplicationController
  
  def index
    @justificativas = Justificativa.paginate(page: params[:page], per_page: 10)
  end
  
end
