class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # User must be authenticated before edit user information or interact with app
  before_action :authenicate_user!
  
end
