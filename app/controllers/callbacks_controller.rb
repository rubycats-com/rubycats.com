class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.find_for_oauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end
