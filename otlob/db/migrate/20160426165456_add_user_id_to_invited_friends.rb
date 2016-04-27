class AddUserIdToInvitedFriends < ActiveRecord::Migration
  def change
    add_reference :invited_friends, :user, index: true, foreign_key: true
  end
end
