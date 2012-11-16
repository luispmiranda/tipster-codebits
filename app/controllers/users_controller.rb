class UsersController < ApplicationController
  load_and_authorize_resource class: 'Citygate::User'

  def profile
    authorize! :show, current_user
  end

end
