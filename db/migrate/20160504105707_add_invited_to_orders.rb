class AddInvitedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :invited, :string
  end
end
