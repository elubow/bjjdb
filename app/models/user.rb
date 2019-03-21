class User < ApplicationRecord
  enum role: {user: 0, moderator: 5, admin: 10}
  after_initialize :set_default_role, :if => :new_record?

  has_many :comments, dependent: :destroy
  has_many :private_notes, dependent: :destroy
  has_many :links
  has_many :login_activities, as: :user

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  cattr_accessor :current_user
  # instead of deleting, indicate the user requested a delete & timestamp it
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
  	!deleted_at ? super : :deleted_account
  end
end
