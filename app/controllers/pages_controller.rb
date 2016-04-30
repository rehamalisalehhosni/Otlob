class PagesController < ApplicationController
  def index

    @us = session["id"]
    @order = Order.where(user_id = @us).last(5)

  end
end
