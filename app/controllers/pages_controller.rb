class PagesController < ApplicationController
   before_action :authenticate_user!
  def index
    @us = current_user.id
    @order = Order.where('user_id=?',@us).last(5)

    @friend=User.find_by_sql (["select users.* from users, friends where user_id = ? and users.id = friends.friend_id", @us])

    @friend_orders=Order.find_by_sql(["SELECT name, orders.order,resturant
    FROM orders, friends, users
    WHERE friends.user_id =?
    AND users.id = friends.friend_id
    AND orders.user_id = friends.friend_id" , @us]).last(1)
    # SELECT *
    #     FROM orders, friends, users
    # WHERE friends.user_id =1
    # AND users.id = friends.friend_id
    # AND friends.friend_id = users.id
    # LIMIT 0 , 30


    # def destroy
    #   @friend.destroy
    #   respond_to do |format|
    #     format.html { redirect_to pages_url, notice: 'Friend was successfully destroyed.' }
    #     format.json { head :no_content }
    #   end
    # end




  end
end