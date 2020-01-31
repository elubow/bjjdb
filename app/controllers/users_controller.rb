class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @pagy, @users = pagy(User.all.order(created_at: :desc), items: 25)
    authorize @users
  end

  def dashboard
    @user = User.find(current_user.id)
    authorize @user
    @pagy, @links = pagy(Link.all.order(created_at: :desc), items: 25)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def favorites
    @user = User.find(params[:user_id])
    @favorites = Link.favorited_by(@user)
    authorize @user
  end

  def reviews
    @user = User.find(params[:user_id])
    @reviews = @user.reviews.order('created_at DESC')
    @reviews_this_year = @user.reviews.by_year(Date.current.year)
    @reviews_last_year = @user.reviews.by_year(Date.current.year-1)
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
