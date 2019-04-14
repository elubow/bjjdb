class TranslationTermsController < ApplicationController
  before_action :set_translation_term, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /translation_terms
  # GET /translation_terms.json
  def index
    @pagy, @translation_terms = pagy(TranslationTerm.order(body: :asc), items: 50)
    authorize @translation_terms
  end

  # GET /translations
  # GET /translations.json
  def search
    @translation_term = TranslationTerm.new
    authorize @translation_term
  end

  # GET /translations_charts
  # GET /translations_charts.json
  def charts
    @src = TranslationTerm.get_chart(params[:src])
    @dst = TranslationTerm.get_chart(params[:dst])
    @translation_term = TranslationTerm.new
    authorize @translation_term
  end

  # GET /translation_terms/1
  # GET /translation_terms/1.json
  def show
    authorize @translation_term
  end

  # GET /translation_terms/new
  def new
    @translation_term = TranslationTerm.new
    authorize @translation_term
  end

  # GET /translation_terms/1/edit
  def edit
    authorize @translation_term
  end

  # POST /translation_terms
  # POST /translation_terms.json
  def create
    @translation_term = TranslationTerm.new(translation_term_params)
    @translation_term.user_id = current_user.id
    @translation_term.base_term_id = 0 if @translation_term.base_term_id.nil?
    authorize @translation_term

    respond_to do |format|
      if @translation_term.save
        format.html { redirect_to @translation_term, notice: 'Translation Term was successfully created.' }
        format.json { render :show, status: :created, location: @translation_term }
      else
        format.html { render :new }
        format.json { render json: @translation_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translation_terms/1
  # PATCH/PUT /translation_terms/1.json
  def update
    authorize @translation_term
    @translation_term.user_id = current_user.id
    @translation_term.base_term_id = 0 if @translation_term.base_term_id.nil?
    respond_to do |format|
      if @translation_term.update(translation_term_params)
        format.html { redirect_to @translation_term, notice: 'Translation Term was successfully updated.' }
        format.json { render :show, status: :ok, location: @translation_term }
      else
        format.html { render :edit }
        format.json { render json: @translation_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translation_terms/1
  # DELETE /translation_terms/1.json
  def destroy
    authorize @translation_term
    @translation_term.destroy
    respond_to do |format|
      format.html { redirect_to translation_terms_url, notice: 'Translation Term was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation_term
      @translation_term = TranslationTerm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_term_params
      params.require(:translation_term).permit(:body, :language, :base_term_id)
    end
end
