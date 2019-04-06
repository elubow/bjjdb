class FavoritesController < ApplicationController
  after_action :verify_authorized

  def create
    current_user.favorite(@link)

    render 'links/show'
  end

  def destroy
    current_user.unfavorite(@link)

    render 'links/show'
  end

end
