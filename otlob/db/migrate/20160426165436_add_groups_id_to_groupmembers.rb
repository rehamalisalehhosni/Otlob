class AddGroupsIdToGroupmembers < ActiveRecord::Migration
  def change
    add_reference :groupmembers, :group, index: true, foreign_key: true
  end
end
