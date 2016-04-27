class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order
      t.string :resturant
      t.string :image
      t.string :status

      t.timestamps null: false
    end
  end
end
