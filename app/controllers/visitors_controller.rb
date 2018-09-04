class VisitorsController < ApplicationController
  def index
    @links = Link.order(created_at: :desc).limit(10)
  end
end
