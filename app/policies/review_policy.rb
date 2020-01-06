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

  def update?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def show?
    true
  end

end
