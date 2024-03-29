class Methodpost < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :method_likes, dependent: :destroy
  has_many :methodliking_users, through: :method_likes, source: :user

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :subjects, presence: true
  validates :title, presence: true

  def self.search(search)
    if search
      Methodpost.where(['title LIKE ?',
                        "%#{search}%"]).or(Methodpost.where(['subjects LIKE ?',
                                                             "%#{search}%"])).or(Methodpost.where(['content LIKE ?',
                                                                                                   "%#{search}%"]))
    else
      Methodpost.all
    end
  end

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:evaluation).round(1).to_f
    end
  end

  def review_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:evaluation).round(1).to_f * 100 / 5
    end
  end
end
