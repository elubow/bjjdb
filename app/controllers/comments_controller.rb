class CommentsController < ApplicationController
  before_action :get_link, only: [:create]
  before_action :get_comment, only: [:edit, :update, :destroy]

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @link.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @link, notice: 'Added comment.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { redirect_to @link, notice: 'Comment failed.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @link = Link.find(@comment.link_id)
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @link, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @link = Link.find(@comment.link_id)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @link, notice: 'Comment removed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_link
      @link = Link.find(params[:comment][:link_id])
    end

    def get_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :link_id, :user_id)
    end
end
