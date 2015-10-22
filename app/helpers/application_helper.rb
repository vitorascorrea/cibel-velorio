module ApplicationHelper

  def log_in(funcionario)
    session[:funcionario_id] = funcionario.id
  end

  def current_funcionario
    if @current_funcionario ||= Atendente.find_by(id: session[:funcionario_id])
    else @current_funcionario ||= Velorista.find_by(id: session[:funcionario_id])
   	end
  end

  def logged_in?
    !current_funcionario.nil?
  end

  def log_out
    session.delete(:funcionario_id)
    @current_funcionario = nil
  end
end
