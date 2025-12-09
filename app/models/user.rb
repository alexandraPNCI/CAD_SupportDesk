class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :tickets, dependent: :destroy

end

class User < ApplicationRecord
  enum role: { user: "user", admin: "admin" }, _default: "user"
end
