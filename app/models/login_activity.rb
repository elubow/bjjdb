class LoginActivity < ApplicationRecord
  belongs_to :user, polymorphic: true, optional: true
  attr_encrypted :ip, key: "Just encrypt, ip acquit dont fit"
end
