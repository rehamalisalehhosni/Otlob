class PagesController < ApplicationController
  def index
    @us = current_user.id
    @order = Order.where('user_id=?',@us).last(5)
    # @friend = Friend.where('user_id=?',@us)

    # @friend = Friend.joins(users: :orders).where('user_id=?',@us)
    @friend= Friend.where('user_id=?',@us)
      # @friend =Friend.find(
    #                    :all,
    #                    :joins=>[:order, :user, :friend],
    #                    :select=>",user.id, user.name",
    #                    :condition => {:friend=>{:id => @us}}
    # )
    # --------- trial 2----------
    # @friend = User.joins(:friends,:orders).where("friends.user_id = 1 and users.id = friends.friend_id and orders.user_id = friends.friend_id")

    # SELECT *
    #     FROM users, friends, orders
    # WHERE friends.user_id =1
    # AND users.id = friends.friend_id
    # AND orders.user_id = friends.friend_id
    # LIMIT 0 , 30
    # @friend = Friend.select("users.name, orders.order as g_id, users.id as u_id,
    # users.name, users.email").joins(:users).where(:users => {:u_id => @us})
  end
end
