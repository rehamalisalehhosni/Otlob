class PagesController < ApplicationController
  def index



    @us = current_user.id
    @order = Order.where('user_id=?',@us).last(5)


  end
end
