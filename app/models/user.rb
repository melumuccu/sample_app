class User < ApplicationRecord
  #callback methods（特定のタイミングで呼び出される）
  before_save { self.email = email.downcase }
  #validations
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  #other Rails' methods
  has_secure_password
  
end
