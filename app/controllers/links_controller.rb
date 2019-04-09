class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  impressionist :actions => [:show]

  # GET /links
  # GET /links.json
  def index
    @pagy, @links = pagy(Link.order(created_at: :desc), items: 25)
    authorize @links
  end

  def admin_index
    @admin = true
    @pagy, @links = pagy(Link.left_outer_joins(:instructors).where(instructors: {id: nil}).order(created_at: :desc), items: 25)
    authorize Link
    render "index"
  end

  # GET /links/1
  # GET /links/1.json
  def show
    authorize @link

    #Ratings
    @rating = @link.ratings.find_by(user_id: current_user&.id) || Rating.new

    @comments = @link.comments.all.order(created_at: :desc)
    @comment = @link.comments.build

    if current_user
      @private_notes_link_count = current_user.private_notes.where(link: @link).count
      @private_notes = current_user.private_notes.where(link: @link).order(created_at: :desc).limit(3)
      @private_note = @link.private_notes.build
    end
  end

  # GET /links/new
  def new
    @link = Link.new
    authorize @link
  end

  # GET /links/1/edit
  def edit
    authorize @link
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    authorize @link
    @link.user_id = current_user.id

    if Link.find_by_url(@link.url).kind_of?(Link)
      redirect_to root_path, alert: 'We already have that video.'
      return
    end

    respond_to do |format|
      if @link.save
        Link.enqueue_thumbnails
        format.html { redirect_to root_path, notice: 'Video added.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    authorize @link
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Video updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    authorize @link
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Video removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url, :description, :tag_ids => [], :instructor_ids => [])
    end
end
