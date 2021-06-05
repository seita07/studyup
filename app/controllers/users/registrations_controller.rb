class Users::RegistrationsController < Devise::RegistrationsController
    # before_action :configure_account_update_params, only: [:update]
    # before_action :ensure_normal_user, only: %i[update destroy]
  
    protected

    def update_resource(resource, params)
        resource.update_without_password(params)
      end
  
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:occupation,:target_school,:comment,:image])
    end

    # def ensure_normal_user
    #   if resource.email == 'guest@example.com'
    #     redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    #   end
    # end
end