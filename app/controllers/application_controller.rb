class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def blocitoff
      render text: "<h>Blocitoff</h><p>A self destructing ToDo list</p>"
    end
end
