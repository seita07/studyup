class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 10 }
  has_many :timeposts, dependent: :destroy
  has_many :time_likes, dependent: :destroy
  has_many :like_times, through: :time_likes, source: :timepost
  has_many :comments, dependent: :destroy

  has_many :methodposts, dependent: :destroy
  has_many :method_likes, dependent: :destroy
  has_many :like_methods, through: :method_likes, source: :methodpost
  has_many :reviews, dependent: :destroy
  has_many :books, dependent: :destroy
  has_one :countdown
  has_one :studytime
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

    def update_without_current_password(params, *options)
      params.delete(:current_password)

      if params[:password].blank? && params[:password_confirmation].blank?
        params.delete(:password)
        params.delete(:password_confirmation)
      end

      result = update_attributes(params, *options)
      clean_up_passwords
      result
    end
end
