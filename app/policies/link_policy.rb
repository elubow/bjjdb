class LinkPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @link = model
  end

  def index?
    true
  end

  def show?
    true
  end

  def index_without_instructors?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def index_based_on_tags?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end
    
  def filter_by_tags?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def new?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def create?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def edit?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def update?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end

  def destroy?
    !@current_user.nil? and
      (@current_user.admin? or @current_user.moderator?)
  end
end
