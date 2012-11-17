class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      flash[:error] = "Please don't try to go there. Stuff would break :("
      redirect_to profile_path
    else
      flash[:notice] = 'Please register first!'
      redirect_to citygate.new_user_session_path
    end
  end

end
