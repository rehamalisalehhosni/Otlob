class CreateInvitedFriends < ActiveRecord::Migration
  def change
    create_table :invited_friends do |t|
      t.string :status

      t.timestamps null: false
    end
    change_column :invited_friends, :created_at, :DATETIME, :default => CURRENT_TIMESTAMP, :null => true
    change_column :invited_friends, :updated_at, :DATETIME, :default => CURRENT_TIMESTAMP, :null => true

  end
end
