class Post < ApplicationRecord
  validates :text, presence: true
  validates :title, presence: true

  belongs_to :user
  belongs_to :language, optional: true
end
