class PrivateNotesController < ApplicationController
  before_action :get_link, only: [:create]
  before_action :set_private_note, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /notebook
  # GET /notebook.json
  def notebook
    @pagy, @private_notes = pagy(PrivateNote.where(user: current_user).order(created_at: :desc), items: 5)
    authorize @private_notes
  end

  # GET /private_notes
  # GET /private_notes.json
  def index
    @pagy, @private_notes = pagy(PrivateNote.order(created_at: :desc), items: 25)
    authorize @private_notes
  end

  def search
    authorize PrivateNote
    @pagy, @private_notes_search = pagy(
      PrivateNote.where(user_id: current_user.id).ransack(
        body_cont: params[:private_note_search],
        title_cont: params[:private_note_search],
        m: 'or'
      ).result(distinct: true),
      items: 10,
      link_extra: 'data-remote="true"'
    )
    respond_to do |format|
      format.js
    end
  end

  # GET /private_notes/1
  # GET /private_notes/1.json
  def show
    @private_note = PrivateNote.find(params[:id])
    authorize @private_note
  end

  # GET /private_notes/new
  def new
    @private_note = PrivateNote.new
    authorize @private_note
  end

  # GET /private_notes/1/edit
  def edit
    authorize @private_note
  end

  # POST /private_notes
  # POST /private_notes.json
  def create
    @private_note = PrivateNote.new(private_note_params)
    authorize @private_note
    @private_note.user_id = current_user.id

    respond_to do |format|
      if @private_note.save
        format.html { redirect_to @link, notice: 'Note added to your notebook.' }
        format.json { render :show, status: :created, location: @private_note }
      else
        format.html { render :new }
        format.json { render json: @private_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /private_notes/1
  # PATCH/PUT /private_notes/1.json
  def update
    respond_to do |format|
      if @private_note.update(private_note_params)
        format.html { redirect_to @private_note, notice: 'Private note was successfully updated.' }
        format.json { render :show, status: :ok, location: @private_note }
      else
        format.html { render :edit }
        format.json { render json: @private_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_notes/1
  # DELETE /private_notes/1.json
  def destroy
    authorize @private_note
    @private_note.destroy
    respond_to do |format|
      format.html { redirect_to link_path(@private_note.link), notice: 'Note removed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_link
      @link = Link.find(params[:private_note][:link_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_private_note
      @private_note = PrivateNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def private_note_params
      params.require(:private_note).permit(:user_id, :link_id, :body, :title)
    end
end
