class FeedsController < ApplicationController

  load_and_authorize_resource class: 'Citygate::User'

  def main
    @followings = current_user.followings.joins(:tips).order('tips.updated_at DESC')
  end

end
