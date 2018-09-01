class CommentPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @comment = model
  end

  def create?
    @current_user.user
  end

  def update?
    @current_user.id == @comment.user_id
  end

  def destroy?
    @current_user.id == @comment.user_id
  end

end
