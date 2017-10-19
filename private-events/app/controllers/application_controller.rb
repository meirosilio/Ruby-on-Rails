class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to sign_in_path
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || events_path
  end

  def after_sign_up_path_for(resource)
    stored_location_for(resource) || events_path
  end

end
