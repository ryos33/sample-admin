class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location_for_admin, :unless => :devise_controller?

  protected

  def current_admin_no
    (admin_signed_in? ? current_admin.admin_no : 0)
  end

  def set_cache_headers_expiring
    response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || new_session_path(resource)
  end

  def delete_flash_notice
    if flash[:notice].present?
      flash.delete(:notice)
    end
  end

  private

  def store_current_location_for_admin
    store_location_for(:admin, request.url)
  end
end
