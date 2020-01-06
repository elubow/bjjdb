class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /gyms
  # GET /gyms.json
  def index
    @pagy, @gyms = pagy(Gym.order(created_at: :desc), items: 25)
    authorize @gyms
  end

  # GET /gyms/1
  # GET /gyms/1.json
  def show
    authorize @gym

    # Reviews
    @reviews = @gym.reviews.all.order(created_at: :desc)
    @review = @gym.reviews.build
  end

  private

    def set_gym
      @gym = Gym.find(params[:id])
    end

end
