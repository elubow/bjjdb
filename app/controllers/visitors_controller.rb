class VisitorsController < ApplicationController
  def index
    @pagy, @links = pagy(Link.all.order(created_at: :desc), items: 25)
  end
end
