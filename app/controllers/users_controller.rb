class UsersController < ApplicationController
  load_and_authorize_resource class: 'Citygate::User'

  def profile
    authorize! :show, current_user
  end

  def show
    @user = Citygate::User.find(params[:id])

  end

  def follow
    @user = Citygate::User.find(params[:id])
    Follow.create user_id: current_user.id, followed_id: @user.id
    #@user.followers << current_user
    redirect_to follows_path
  end

end
