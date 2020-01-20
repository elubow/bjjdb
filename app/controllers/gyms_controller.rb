class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]
  before_action :set_aasm_gym, only: [:publish, :unpublish, :flag]
  after_action :verify_authorized

  # GET /gyms
  # GET /gyms.json
  def index
    @pagy, @gyms = pagy(Gym.reviewable_gyms.order(created_at: :desc), items: 25)
    authorize @gyms
  end

  def admin_index
    @pagy, @gyms = (params[:gym].present? and params[:gym][:filters].present?) ?
      pagy(Gym.send_chain(params[:gym][:filters]).order(created_at: :desc), items: 25) :
      pagy(Gym.all.order(created_at: :desc), items: 25)

    authorize @gyms
  end

  def search
    authorize Gym
    @pagy, @gym_search = pagy(
      Gym.reviewable_gyms.ransack(
        name_cont: params[:gym_search],
        affiliation_cont: params[:gym_search],
        city_cont: params[:gym_search],
        state_cont: params[:gym_search],
        country_cont: params[:gym_search],
        m: 'or'
      ).result(distinct: true),
      items: 25,
      link_extra: 'data-remote="true"'
    )
    respond_to do |format|
      format.js
    end
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
        format.html { redirect_to gyms_path, notice: "#{@gym.name} has been added to our database. It will be temporarily live for you to add a review and then must be verified by the admins. Thank you for your support." }
        format.json { render :show, status: :created, location: @gym }
      else
        format.html { render :new }
        format.json { render json: @gym.errors, status: :unprocessable_entity }
      end
    end
  end

  # Begin AASM state methods
  def publish
    authorize @gym
    @gym.publish!
    redirect_back(fallback_location: root_path)
  end

  def unpublish
    authorize @gym
    @gym.unpublish!
    redirect_back(fallback_location: root_path)
  end

  def flag
    authorize @gym
    @gym.flag!
    redirect_back(fallback_location: root_path)
  end
  # End AASM state methods


  private

    def set_aasm_gym
      @gym = Gym.find(params[:gym_id])
    end

    def set_gym
      @gym = Gym.find(params[:id])
    end

    def gym_params
      params.require(:gym).permit(:name, :address_full, :address_1, :address_2, :city, :state, :postal_code, :country, :website, :phone, :email, :affiliation)
    end

end
