class SessionsController < ApplicationController

  def new
  end

	def create
		funcionario = Funcionario.find_by(rf: params[:session][:rf].downcase)
		if funcionario && funcionario.authenticate(params[:session][:password])
		  log_in funcionario
		  redirect_to selecao_velorio_path
		else
		  flash.now[:danger] = 'RF ou Senha inválido'
		  render 'new'
		end
	end

  def destroy
    log_out
    redirect_to sessions_new_path
  end
end
