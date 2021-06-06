class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_account_update_params, only: [:update]
  
    protected

    def update_resource(resource, params)
        resource.update_without_password(params)
    end
  
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:occupation,:target_school,:comment,:image])
    end

    def after_inactive_sign_up_path_for(resource)
      redirect_to root_path
    end
    
    def after_inactive_sign_update_path_for(resource)
      redirect_to root_path
    end
end