class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
   current_user
  end

  def after_sign_up_path_for(resource)
    current_user
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action!"
      redirect_to(request.referrer || current_user)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name,
        :email,
        :phone_number,
        :address,
        :city,
        :state,
        :zip_code,
        :password,
        :password_confirmation
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
      :password_confirmation

      ]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(registration_params) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(registration_params << :current_password) }
    end
    

  end
  