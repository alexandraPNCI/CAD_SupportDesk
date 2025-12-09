class Ticket < ApplicationRecord
has_many :comments, dependent: :destroy
belongs_to :user

validates :title, presence: true, length: { minimum: 3 }
validates :description, presence: true
validates :status, presence: true
validates :priority, presence: true

end
