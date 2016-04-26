class CreateGroupmembers < ActiveRecord::Migration
  def change
    create_table :groupmembers do |t|

      t.timestamps null: false
    end
  end
end
