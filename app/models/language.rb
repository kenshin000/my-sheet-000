class Language < ApplicationRecord

  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :posts

end
