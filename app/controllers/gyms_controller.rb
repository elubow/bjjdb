class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /gyms
  # GET /gyms.json
  def index
    @pagy, @gyms = pagy(Gym.order(created_at: :desc), items: 25)
    authorize @gyms
  end

end
