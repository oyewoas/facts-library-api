class User < ApplicationRecord
  has_many :facts
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: { minimum: 3, maximum: 25 }
  # has_secure_password
end
