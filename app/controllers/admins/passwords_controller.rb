class Admins::PasswordsController < Devise::PasswordsController
  skip_before_action :require_no_authentication, only: [:reset_completed]
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  def sent
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  def reset_completed
  end

  protected

  def after_resetting_password_path_for(resource)
    sign_out resource
    reset_completed_admin_password_path
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    flash[:email] = resource[:email]
    sent_admin_password_path
  end
end
