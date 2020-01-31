class GymPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @gym = model
  end

  def index?
    true
  end

  def admin_index?
    !@current_user.nil? and @current_user.admin?
  end

  def search?
    true
  end

  def show?
    true if @gym.is_reviewable?
  end

  def edit?
    !@current_user.nil? and current_user.admin?
  end

  def update?
    !@current_user.nil? and current_user.admin?
  end

  def new?
    !@current_user.nil?
  end

  def create?
    !@current_user.nil?
  end

  # Begin AASM state methods
  def publish?
    !@current_user.nil? and current_user.admin?
  end

  def unpublish?
    !@current_user.nil? and current_user.admin?
  end

  def flag?
    !@current_user.nil?
  end
  # End AASM state methods

end
