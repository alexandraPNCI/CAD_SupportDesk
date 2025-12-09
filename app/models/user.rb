class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 enum :role, {
  user: "user",
  admin: "admin"
}, prefix: true


  # Default role
  after_initialize do
    self.role ||= "user"
  end

  # Associations if any
  has_many :comments, dependent: :destroy
end

