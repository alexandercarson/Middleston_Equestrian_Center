class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied. You are not authorized to access the requested page."
    redirect_to root_path and return
  end


  def after_sign_in_path_for(resource_or_scope)
   current_user
  end

  def after_sign_up_path_for(resource)
    current_user
  end
  
    protected

  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name,
        :email,
        :phone_number,
        :address,
        :city,
        :state,
        :zip_code
      ])

    registration_params = [
      :name, 
      :phone_number, 
      :address, 
      :city, 
      :state, 
      :zip_code,
      :email,
      :password,
      :password_confirmation,
      { roles: [] },
      ]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(registration_params) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(registration_params << :current_password) }
    end
  end
  