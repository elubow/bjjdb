class StatsPolicy
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def site?
    @current_user.admin?
  end
end
