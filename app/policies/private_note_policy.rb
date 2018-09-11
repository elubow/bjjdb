class PrivateNotePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @private_note = model
  end

  def index?
    !@current_user.nil?
  end

  def create?
    !@current_user.nil?
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
