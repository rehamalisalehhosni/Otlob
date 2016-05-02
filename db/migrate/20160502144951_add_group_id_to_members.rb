class AddGroupIdToMembers < ActiveRecord::Migration
  def change
    add_reference :members, :group, index: true, foreign_key: true
  end
end
