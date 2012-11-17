class CommunityController < ApplicationController
  # layout 'home'
  # GET /
  def show
    @users = Citygate::User.all
  end
end
