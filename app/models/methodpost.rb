class Methodpost < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :method_likes, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :subjects, presence: true
  validates :title, presence: true

  def avg_score
    unless self.reviews.empty?
      reviews.average(:evaluation).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:evaluation).round(1).to_f*100/5
    else
      0.0
    end
  end
end
