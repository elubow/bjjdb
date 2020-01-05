class GymPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @gym = model
  end

  def index?
    true
  end

  def show?
    true
  end
end
