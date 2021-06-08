class Book < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :img_url, presence: true
end
