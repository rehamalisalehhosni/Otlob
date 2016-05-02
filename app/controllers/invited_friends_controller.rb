class InvitedFriendsController < ApplicationController
  before_action :set_invited_friend, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /invited_friends
  # GET /invited_friends.json
  def index
    @invited_friends = InvitedFriend.all
  end

  # GET /invited_friends/1
  # GET /invited_friends/1.json
  def show
      @order = Order.new
  end

  # GET /invited_friends/new
  def new
    @invited_friend = InvitedFriend.new
@order=Order.new
  end

  # GET /invited_friends/1/edit
  def edit
  end

  # POST /invited_friends
  # POST /invited_friends.json
  def create
    @invited_friend = InvitedFriend.new(invited_friend_params)

    respond_to do |format|
      if @invited_friend.save
        format.html { redirect_to @invited_friend, notice: 'Invited friend was successfully created.' }
        format.json { render :show, status: :created, location: @invited_friend }
      else
        format.html { render :new }
        format.json { render json: @invited_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invited_friends/1
  # PATCH/PUT /invited_friends/1.json
  def update
    respond_to do |format|
      if @invited_friend.update(invited_friend_params)
        format.html { redirect_to @invited_friend, notice: 'Invited friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @invited_friend }
      else
        format.html { render :edit }
        format.json { render json: @invited_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invited_friends/1
  # DELETE /invited_friends/1.json
  def destroy
    @invited_friend.destroy
    respond_to do |format|
      format.html { redirect_to invited_friends_url, notice: 'Invited friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invited_friend
      @invited_friend = InvitedFriend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invited_friend_params
      params.require(:invited_friend).permit(:status)
    end
end
