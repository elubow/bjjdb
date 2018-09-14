class PrivateNotePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @private_note = model
  end

  def notebook?
    !@current_user.nil? 
  end

  def index?
    !@current_user.nil? and @current_user.admin?
  end

  def show?
    !@current_user.nil? and @current_user.admin?
  end

  def create?
    !@current_user.nil?
  end

  def edit?
    !@current_user.nil? or @current_user.admin?
  end

  def update?
    !@current_user.nil? and
      (@current_user.id == @private_note.user_id)
  end

  def destroy?
    !@current_user.nil? and
      (@current_user.id == @private_note.user_id)
  end

end
