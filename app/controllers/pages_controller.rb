class PagesController < ApplicationController
  def index
    @us = current_user.id
    @order = Order.where('user_id=?',@us).last(5)
    # @friend = Friend.where('user_id=?',@us)

    # @friend = Friend.joins(users: :orders).where('user_id=?',@us)
<<<<<<< HEAD

    # @user = User.new



    #@friend= Friend.where('user_id=?',@us)

    @friend=User.find_by_sql (["select name from users, friends where user_id = ? and users.id = friends.friend_id", @us])
    # @user = User.find_by_sql ["SELECT name FROM users WHERE id = ? ", friend_id]




    def getNameById

              # @user = User.find_by_sql ["SELECT name FROM users WHERE id = ? ", friend_id]

    end





    # @friend =Friend.find(
=======
    @friend= Friend.where('user_id=?',@us)
      # @friend =Friend.find(
>>>>>>> 7cbfdcb6cf1b1cd3d594c14b205c622d1241f2ca
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
