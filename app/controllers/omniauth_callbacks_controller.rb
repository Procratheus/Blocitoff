class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    user = User.from_omniauth(request.env['omniauth.auth'])

    if user.persisted?
      flash[:notice] = "User Signed in succesfully."
      sign_in_and_redirect user
    else
      session['devise.user_atrributes'] = user.attributes 
      redirect_to new_user_registration_path
    end
  end

  alias_method :twitter, :all

end
