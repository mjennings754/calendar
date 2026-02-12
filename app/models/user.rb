class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :email
  before_create :generate_verification_token
  has_many :tenants

  def generate_verification_token
    self.verification_token = SecureRandom.hex(10)
  end

  def verify_email(token)
    if self.verification_token == token
      update(verified: true, verification_token: nil)
    end 
  end
end
