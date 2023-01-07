class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :purchases, dependent: :destroy
    has_many :purchased_users, through: :purchases, source: :user
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags, dependent: :destroy
    validates_presence_of :image
    validates_presence_of :contents
    validates_presence_of :price
end
