class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  before_filter :user_logado?

  private

  def user_logado?
    gon.nada = nil
    if !logged_in? && params[:controller] != 'sessions'
      redirect_to login_path
    end
    if current_funcionario.class == Velorista && params[:controller] != 'home'
      redirect_to home_path
    end
  end

end
