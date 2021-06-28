class Timepost < ApplicationRecord
  belongs_to :user
  has_many :time_likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :timeliking_users, through: :time_likes, source: :user

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :time, presence: true
  validates :minitus, presence: true
  validates :subjects, presence: true
  validates :img, presence: true
  validates :content, length: { maximum: 140 }
end
