class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  
  private
  
  def user_logado?
    if !logged_in? && params[:controller] != 'sessions'  
      redirect_to login_path
    end
  end
  
end
