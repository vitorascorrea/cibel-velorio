class FuncionariosController < ApplicationController
  def adm
  	if !current_funcionario.adm?
  		redirect_to root_url
  	end
  end

  def new
  end

  def edit
  end
end
