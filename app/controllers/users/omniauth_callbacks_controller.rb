class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    # You need to implement the method below in your model
    @user = User.find_for_instagram_oauth(request.env["omniauth.auth"], current_user)

    if @user.present?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Instagram"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.instagram_data"] = request.env["omniauth.auth"]
      flash[:notice] = "Could not authenticate you via Instagram, please check your Instagram credentials or sign up below"
      redirect_to new_user_registration_url
    end
  end
end