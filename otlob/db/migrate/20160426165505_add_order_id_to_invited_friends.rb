class AddOrderIdToInvitedFriends < ActiveRecord::Migration
  def change
    add_reference :invited_friends, :order, index: true, foreign_key: true
  end
end
