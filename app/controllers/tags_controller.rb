class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  impressionist :actions => [:show]

  # GET /tags
  # GET /tags.json
  def index
    @pagy, @tags = pagy(Tag.order(category: :asc).order(name: :asc), items: 25)
    authorize @tags
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    authorize @tag
    @pagy, @links = pagy(@tag.links.order(created_at: :desc), items: 25)
  end

  # GET /tags/new
  def new
    @tag = Tag.new
    authorize @tag
  end

  # GET /tags/1/edit
  def edit
    authorize @tag
    if(@tag.category == "start-position" || @tag.category == "end-position")
      flash[:notice] = "To edit either start-position or end-position you must edit the position tag of the same name!"
      redirect_to edit_tag_path(Tag.find_by_full_name("position::" + @tag.name))
    end
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    authorize @tag

    @tag.transaction do
      begin
        if @tag.category == "start-position" || @tag.category == "end-position"
          respond_to do |format| 
            flash[:alert] = 'To create a start/end-position tag you must instead create a position tag!'
            format.html { render :new }
            format.json { render json: @tag.errors, status: :unprocessable_entity }
          end
          return
        end
        @tag.save!
        if @tag.category == "position"
          @tag.create_start_end_position_tags
        end
        respond_to do |format| 
          format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
          format.json { render :show, status: :created, location: @tag }
        end
      rescue ActiveRecord::RecordInvalid
        respond_to do |format| 
          flash[:alert] = 'There was a problem saving the tag!'
          format.html { render :new }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    authorize @tag

    @tag.transaction do
      begin
        if(@tag.category == "position")
          previous_name = @tag.name
        end
        @tag.update!(tag_params)
        if(previous_name != nil)
          start_position = Tag.find_by_full_name("start-position::" + previous_name)
          end_position = Tag.find_by_full_name("end-position::" + previous_name)
          start_position.update!(name: @tag.name, description: "Starting at #{@tag.name}") if start_position != nil
          end_position.update!(name: @tag.name, description: "Ending at #{@tag.name}") if end_position != nil
        end
        respond_to do |format|
          format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
          format.json { render :show, status: :ok, location: @tag }
        end
      rescue ActiveRecord::RecordInvalid
        respond_to do |format|
          flash[:alert] = 'There was a problem editing the tag!'
          format.html { render :edit }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    authorize @tag
    @tag.transaction do
      begin
        if @tag.category == "position"
          start_position = Tag.find_by_full_name("start-position::" + previous_name)
          end_position = Tag.find_by_full_name("end-position::" + previous_name)
          start_position.destroy! if start_position != nil
          end_position.destroy! if end_position != nil
          @tag.destroy!
          flash[:notice] = "Position tag and all it's relative position have been successfully removed."
        elsif @tag.category == "start-position" || @tag.category == "end-position"
          flash[:alert] = "To delete this tag, you must delete position::" + @tag.name
        else
          @tag.destroy!
          flash[:notice] = 'Tag was successfully removed.'
        end
      rescue ActiveRecord::RecordNotDestroyed
        flash[:alert] = 'There was a problem destroying the tag!'
      end
      respond_to do |format|
        format.html { redirect_to tags_url }
        format.json { head :no_content }
      end
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
