class TranslationTermPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @translation_term = model
  end

  def index?
    !@current_user.nil? and 
      (@current_user.moderator? or @current_user.admin?)
  end

  def search?
    true
  end

  def charts?
    true
  end

  def show?
    !@current_user.nil? and 
      (@current_user.moderator? or @current_user.admin?)
  end

  def new?
    !@current_user.nil? and 
      (@current_user.moderator? or @current_user.admin?)
  end

  def edit?
    !@current_user.nil? and 
      (@current_user.moderator? or @current_user.admin?)
  end

  def create?
    !@current_user.nil? and 
      (@current_user.moderator? or @current_user.admin?)
  end

  def update?
    !@current_user.nil? and 
      (@current_user.moderator? or @current_user.admin?)
  end

  def destroy?
    !@current_user.nil? and 
      (@current_user.moderator? or @current_user.admin?)
  end
end
