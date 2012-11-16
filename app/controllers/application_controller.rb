class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to profile_path
    else
      redirect_to citygate.new_user_session_path
    end
  end

end
