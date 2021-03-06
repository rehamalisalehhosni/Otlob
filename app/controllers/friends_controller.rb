class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /friends
  # GET /friends.json
  
  def index
    	#@friends = Friend.all
      @us = current_user.id
      #@friends=User.find_by_sql (["select users.* from users, friends where user_id = ? and users.id = friends.friend_id", @us])
      # @friends=Friend.where("user_id= ?" , @us)
      #@friends=Friend.find_by_sql(["SELECT * FROM friends,users WHERE friends.user_id=? and friends.friend_id=users.id" ,@us])
      @friends=Friend.find_by_sql(["SELECT users.name , users.image , friends.id , friends.friend_id FROM friends,users WHERE friends.user_id=? and friends.friend_id=users.id" ,@us])


  end


  # GET /friends/1
  # GET /friends/1.json
  def show
    @user = User.find(params[:id])



  end
  #
  # def follow
  #   @user = User.find(params[:id])
  #   current_user.follow(@user)
  #   redirect_to :back
  # end

  # GET /friends/new
  def new
    @friend = Friend.new

  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @fid = params[:friend][:friend_id]
    #@data== User.select(:id).find_by(email: @fid)
    #@friend= Friend.create(params.require(:friend).permit(:friend_id))
    @data= User.find_by(email: @fid)
     if @data  
      user = @data.id
      params[:friend][:user_id]=current_user.id
      params[:friend][:friend_id]=user
      #@friend.user_id=current_user.id
      @datafriend= Friend.find_by(friend_id: user, user_id: current_user.id )
      if !@datafriend 
        @friend = Friend.new(friend_params)
        #@friend.friend_id= user
        @friend.save()
      end
    end
    @friend = Friend.new()
    redirect_to @friend

  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json




  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:friend_id, :user_id)
    end
end
