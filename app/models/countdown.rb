class Countdown < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :omment, presence: true
  validates :event_day, presence: true
end
