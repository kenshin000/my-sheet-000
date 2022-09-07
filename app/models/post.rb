class Post < ApplicationRecord
  validates :text, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
  validates :language_id, presence: true

  belongs_to :user
  belongs_to :language, optional: true
end
