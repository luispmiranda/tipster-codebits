class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :load_user_tips

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      flash[:error] = "Please don't try to go there. Stuff would break :("
        Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
      redirect_to profile_path
    else
      flash[:notice] = 'Please register first!'
      redirect_to citygate.new_user_session_path
    end
  end


  #protected

    def load_user_tips
      if user_signed_in?
        @user_lists = current_user.lists.where('id NOT NULL') if user_signed_in?
      end
    end

end
