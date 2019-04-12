class FavoritesController < ApplicationController
  before_action :get_link
  respond_to :js, :html

  def create
    @user = current_user
    current_user.favorite(@link)

    respond_to do |format|
      format.html{redirect_to controller: 'links', action: 'show', id: @link.id}
      format.js
    end
  end

  def destroy
    @user = current_user
    current_user.unfavorite(@link)

    respond_to do |format|
      format.html{redirect_to controller: 'links', action: 'show', id: @link.id}
      format.js
    end
  end

  private
    def get_link
      @link = Link.find(params[:link_id])
    end

end
