class FavoritesController < ApplicationController
  before_action :get_link


  def create
    current_user.favorite(@link)

    redirect_to controller: 'links', action: 'show', id: @link.id
  end

  def destroy
    current_user.unfavorite(@link)

    redirect_to controller: 'links', action: 'show', id: @link.id
  end

  private
    def get_link
      @link = Link.find(params[:link_id])
    end

end
