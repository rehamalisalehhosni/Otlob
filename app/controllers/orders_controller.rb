class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    
    @check_friends = InvitedFriend.where("order_id = ?  and user_id = ? " , params[:id] , current_user.id )
    @order = Order.find(params[:id])
    
    if @check_friends.length == 0 &&  @order.user_id != current_user.id
        redirect_to '/orders', notice: 'Sorry This Page Cannot Be Opened'   
    end

  end

  # GET /orders/new
  def new
    @order = Order.new
    @invited_friend = InvitedFriend.new
    @f=params[:x]
    @oid=3
    # @fid=User.find_by_sql (["select id from users where email =?", @email])
    @fid=1
    @invited_friend=InvitedFriend.find_by_sql (["INSERT INTO invited_friends ( status, user_id, order_id) VALUES ('waiting' ,? ,? )", @fid,@oid])

    #@invited_friend=Invited_friends.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def friendapproved



      # hab3at  input type hidden  3ashan ya5od mnoh al kema bta3t al Order ID
      # w ha5odha fe al ajax   w ab3atha  l hna

      # SELECT name FROM invited_friends , users WHERE invited_friends.user_id = users.id

      @order = Order.find(params[:id])

      #@invitedFriend = InvitedFriend.where("status = 1 AND order_id = ? " , @order.id )

      @invitedFriend = InvitedFriend.find_by_sql(["SELECT invited_friends.id , invited_friends.user_id ,  users.image ,invited_friends.status, invited_friends.order_id , users.name
                      FROM invited_friends , users
                      WHERE invited_friends.user_id = users.id
                      AND invited_friends.status = 1
                      AND invited_friends.order_id = ?
                      group by users.email
                      " , @order.id])
      respond_to do |format|
           format.html
           format.js {}
           format.json {
              render json: {:invitedFriend => @invitedFriend}
           }
      end
  end


  def friendunapproved



      # hab3at  input type hidden  3ashan ya5od mnoh al kema bta3t al Order ID
      # w ha5odha fe al ajax   w ab3atha  l hna

      # SELECT name FROM invited_friends , users WHERE invited_friends.user_id = users.id

      @order = Order.find(params[:id])

      #@invitedFriend = InvitedFriend.where("status = 1 AND order_id = ? " , @order.id )

      @invitedFriend = InvitedFriend.find_by_sql(["SELECT invited_friends.id , invited_friends.user_id ,  users.image ,invited_friends.status, invited_friends.order_id , users.name
                      FROM invited_friends , users
                      WHERE invited_friends.user_id = users.id
                      AND invited_friends.status = 0
                      AND invited_friends.order_id = ?
                      group by users.email
                      " , @order.id])
      respond_to do |format|
           format.html
           format.js {}
           format.json {
              render json: {:invitedFriend => @invitedFriend}
           }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order, :resturant, :image, :status , :user_id)
    end
end
