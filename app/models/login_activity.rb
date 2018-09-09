class LoginActivity < ApplicationRecord
  belongs_to :user, polymorphic: true, optional: true
  attr_encrypted :ip, key: "Don't acquit, let's encrypt"
end
