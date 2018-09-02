class LinkPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @link = model
  end

  def index?
  end

  def show?
  end

  def create?
    @current_user.admin? or @current_user.moderator?
  end

  def update?
    @current_user.admin? or @current_user.moderator?
  end

  def destroy?
    @current_user.admin? or @current_user.moderator?
  end

end
