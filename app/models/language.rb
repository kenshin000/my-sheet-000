class Language < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :posts, dependent: :destroy
end
