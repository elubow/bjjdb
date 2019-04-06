class User < ApplicationRecord
  enum role: {user: 0, moderator: 5, admin: 10}
  after_initialize :set_default_role, :if => :new_record?

  has_many :comments, dependent: :destroy
  has_many :private_notes, dependent: :destroy
  has_many :links
  has_many :login_activities, as: :user
  has_many :favorites, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  devise :omniauthable, omniauth_providers: [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    if User.exists?(email: auth.info.email)
      user = User.find_by(email: auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.image = auth.info.image
      user.save!
      user
    else
      where(
          provider: auth.provider, 
          uid: auth.uid,           
          image: auth.info.image, 
          name: auth.info.name
         ).first_or_create do |user|
        user.email = auth.info.email
        user.password = auth.uid
      end
    end
  end
  
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

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

  def favorite(link)
    favorites.find_or_create_by(link: link)
  end

  def unfavorite(link)
    favorites.where(link: link).destroy_all
  end

  def favorited?(link)
    favorites.find_by(link_id: link.id).present?
  end
end
