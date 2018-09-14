class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  impressionist :actions => [:show]

  # GET /tags
  # GET /tags.json
  def index
    @pagy, @tags = pagy(Tag.all, items: 25)
    authorize @tags
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    authorize @tag
  end

  # GET /tags/new
  def new
    @tag = Tag.new
    authorize @tag
  end

  # GET /tags/1/edit
  def edit
    authorize @tag
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    authorize @tag

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    authorize @tag
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    authorize @tag
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:category, :name, :value, :description)
    end
end
