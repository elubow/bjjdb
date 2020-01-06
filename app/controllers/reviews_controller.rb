class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /reviews
  # GET /reviews.json
  def index
    @pagy, @reviews = pagy(Link.order(created_at: :desc), items: 25)
    authorize @reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    authorize @review
    @review = Review.find(params[:id])
  end

  # GET /reviews/1/edit
  def edit
    authorize @review
    @review = Review.find(params[:id])
    @gym = @review.gym
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    authorize @review
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:star, :body)
    end

end