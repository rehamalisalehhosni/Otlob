class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /order_details
  # GET /order_details.json
  def index
    @order_details = OrderDetail.all
  end

  # GET /order_details/1
  # GET /order_details/1.json
  def show
  end

  # GET /order_details/new
  def new
    @order_detail = OrderDetail.new
  end

  # GET /order_details/1/edit
  def edit
  end

  # POST /order_details
  # POST /order_details.json
  def create
    @order_detail = OrderDetail.new(order_detail_params)
    @order = Order.find(@order_detail[:order_id])
    @order_detail = @order.order_details.create(order_detail_params)
    #@update_friend=InvitedFriend.find_by_sql (["update invited_friends set status = '1' where order_id=? and user_id=?", @order_detail[:order_id], current_user.id ])
    @update_friend=InvitedFriend.where(:order_id =>  @order_detail[:order_id] , :user_id => current_user.id ).update_all(:status => '1')

    redirect_to order_path(@order_detail[:order_id])

  end

  # PATCH/PUT /order_details/1
  # PATCH/PUT /order_details/1.json
  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
        format.html { redirect_to @order_detail, notice: 'Order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_detail }
      else
        format.html { render :edit }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1
  # DELETE /order_details/1.json
  def destroy

    #@order = Order.all
    @order_detail = OrderDetail.find(params[:id])
    @myid=@order_detail.order_id
    @order_detail.destroy
    # hyshof aza kan al user 3aml order_details tanya wla la
    @check_myOrders = OrderDetail.where("order_id = ?  and user_id = ? " , @order_detail[:order_id] , current_user.id )
    #aza kan mafesh hy3ml update  ll status bta3to
    if @check_myOrders.length == 0 
        @update_friend=InvitedFriend.where(:order_id =>  @order_detail[:order_id] , :user_id => current_user.id ).update_all(:status => '0')   
    end
    redirect_to order_path(@myid)


    
      
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order_detail = OrderDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_detail_params
      params.require(:order_detail).permit(:item, :amount, :price, :comment , :user_id , :order_id)
    end
end
