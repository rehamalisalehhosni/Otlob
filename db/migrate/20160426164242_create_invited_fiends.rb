class CreateInvitedFiends < ActiveRecord::Migration
  def change
    create_table :invited_fiends do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
