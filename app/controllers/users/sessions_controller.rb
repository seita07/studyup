class Users::SessionsController < Devise::SessionsController
 
  def after_inactive_sign_in_path_for(resource)
    redirect_to root_path
  end

  def after_inactive_sign_out_path_for(resource)
    redirect_to root_path 
  end
end