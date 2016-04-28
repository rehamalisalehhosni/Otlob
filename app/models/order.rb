class Order < ActiveRecord::Base
  belongs_to :user;
  has_many :order_details;
  has_many :invited_friends;

end
