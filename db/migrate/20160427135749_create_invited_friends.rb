class CreateInvitedFriends < ActiveRecord::Migration
  def change
    create_table :invited_friends do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
