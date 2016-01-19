class FuncionariosController < ApplicationController
  def adm
  	if !current_funcionario.adm?
  		redirect_to root_url
  	end
  end

  def new
  	@funcionario = Funcionario.new
  	@atendente = Atendente.new
  end

  def create  	
    @atendente = Atendente.new(atendente_params)
  	@funcionario = Funcionario.new(func_params)
  	if @funcionario.save
  		@atendente = Atendente.new(atendente_params)
  		@atendente.funcionario = @funcionario
  		@atendente.id = @funcionario.id
  		if @atendente.save
  			redirect_to adm_path
  		else
  			flash[:notice] = "Preencha o formulário corretamente"
  			render 'new'
  		end
  	else
  		flash[:notice] = "Preencha o formulário corretamente"
  		render 'new'
  	end
  end

  def edit
  end

  private

  def func_params
  	params.require(:funcionario).permit(:nome, :rf, :password)
  end

  def atendente_params
  	params.require(:atendente).permit(:agencia_id)
  end

end
