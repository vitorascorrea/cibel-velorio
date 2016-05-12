class FuncionariosController < ApplicationController
  def adm
  	if !current_funcionario.adm?
  		redirect_to root_url
  	end
  end
  
  def index
    @atendentes = Atendente.all
  end

  def new
  	@funcionario = Funcionario.new
  	@atendente = Atendente.new
  end

  def create
    @funcionario = Funcionario.new(func_params)
  	@atendente = Atendente.new(atendente_params)
  	if @funcionario.save
  		@atendente = Atendente.new(atendente_params)
  		@atendente.funcionario = @funcionario
  		@atendente.id = @funcionario.id
  		if @atendente.save
  			redirect_to adm_path
  		else
  			flash.now[:erro] = 'Preencha o formulário corretamente'
  			render 'new'
  		end
  	else
  		flash.now[:notice] = "Preencha o formulário corretamente"
  		render 'new'
  	end
  end
  
  def edit
    @funcionario = Funcionario.find(params[:id])
  	@atendente = Atendente.find_by(funcionario_id: params[:id])
  end
  
  def update
    @funcionario = Funcionario.find(params[:id])
  	@atendente = Atendente.find_by(funcionario_id: params[:id])
  	if @funcionario.update_attributes(func_params)
  	  @atendente = Atendente.find_by(funcionario_id: params[:id])
  		if @atendente.update_attributes(atendente_params)
  			redirect_to adm_path
  		else
  			flash.now[:erro] = 'Preencha o formulário corretamente'
  			render 'edit'
  		end
  	else
  		flash.now[:notice] = "Preencha o formulário corretamente"
  		render 'edit'
  	end
  end

  private

  def func_params
  	params.require(:funcionario).permit(:nome, :rf, :password)
  end

  def atendente_params
  	params.require(:atendente).permit(:agencia_id)
  end

end
