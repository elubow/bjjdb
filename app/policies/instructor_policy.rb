class InstructorPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @link = model
  end

  def index?
    true
  end

  def search?
    true
  end

  def show?
    true
  end

  def new?
    !@current_user.nil?
  end

  def create?
    !@current_user.nil?
  end

  def edit?
    !@current_user.nil?
  end

  def update?
    !@current_user.nil?
  end

  def destroy?
    !@current_user.nil?
  end
end
