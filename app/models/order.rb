class Order < ActiveRecord::Base
  belongs_to :user;
  has_many :order_details ,dependent: :destroy;
  has_many :invited_friends ,dependent: :destroy;
mount_uploader :image, ImageUploader
end
