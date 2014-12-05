class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   before_filter :configure_permitted_parameters, if: :devise_controller?
   include PublicActivity::StoreController

protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :profile_photo, :email, :admin, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :profile_photo, :email, :admin, :password, :password_confirmation) }
 end
end
