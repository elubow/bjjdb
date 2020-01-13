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

  # GET /gyms/new
  def new
    @gym = Gym.new
    authorize @gym
  end

  # POST /gyms
  # POST /gyms.json
  def create
    @gym = Gym.new(gym_params)
    authorize @gym

    respond_to do |format|
      if @gym.save
        format.html { redirect_to root_path, notice: 'Gym added.' }
        format.json { render :show, status: :created, location: @gym }
      else
        format.html { render :new }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    def set_gym
      @gym = Gym.find(params[:id])
    end

    def gym_params
      params.require(:gym).permit(:name, :address_full, :address_1, :address_2, :city, :state, :postal_code, :country, :website, :phone, :email, :affiliation)
    end

end
