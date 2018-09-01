class CommentsController < ApplicationController
  before_action :get_link, only: [:show, :edit, :update, :destroy]

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @link, notice: 'Added comment.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @link.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Comment removed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_link
      @link = Link.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
