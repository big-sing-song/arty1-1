class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates_length_of :content, maximum: 30
end
