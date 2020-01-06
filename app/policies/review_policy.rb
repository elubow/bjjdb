class ReviewPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @review = model
  end

  def index?
    true
  end

  def edit?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def create?
    !@current_user.nil?
  end

  def update?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def show?
    true
  end

  def destroy?
    !@current_user.nil? and
      (@current_user.id == @review.user_id)
  end

end
