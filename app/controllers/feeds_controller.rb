class FeedsController < ApplicationController

  load_and_authorize_resource class: 'Citygate::User'

  def main
    @followed_tips = Tip.by_follower(current_user)
  end

  def follows
    @follows = current_user.followings
  end

  def favorites
    @favorites = current_user.favorites
  end

end
