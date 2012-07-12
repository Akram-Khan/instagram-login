class ApplicationController < ActionController::Base
  protect_from_forgery

 rescue_from OmniAuth::Strategies::OAuth2::CallbackError, :with =>
    :omniauth_callback_error_handler

 protected

 def omniauth_callback_error_handler
  redirect_to user_signed_in_path
 end

end
