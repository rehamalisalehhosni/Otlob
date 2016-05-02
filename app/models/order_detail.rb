class OrderDetail < ActiveRecord::Base
  belongs_to :user;
  belongs_to :order;

has_many :invited_friends
accepts_nested_attributes_for :invited_friends, reject_if: :zero_invites

  def zero_invites(attributed)
    attributed['invites'].blank?
  end
end
