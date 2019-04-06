class FavoritePolicy
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def create?
    !@current_user.nil?
  end

  def destroy?
    !@current_user.nil?
  end

end
