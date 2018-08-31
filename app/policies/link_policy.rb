class LinkPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @link = model
  end

  def index?
    @current_user.user
  end

  def show?
    @current_user.user
  end

  def create?
    @current_user.user
  end

  def udpate?
    @current_user.id == @link.user_id
  end

  def destroy?
    @current_user.id == @link.user_id
  end

end
