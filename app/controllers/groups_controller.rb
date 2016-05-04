class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end
    # GET /groups/1
  # GET /groups/1.json
  def show
=begin
    groupmember = groupmember.new
=end
    # find all users named David who are Code Artists and sort by created_at in reverse chronological order
    #usersGroup = group_members.where(user_id: current_user.id, group_id=id).order(id: :desc)
 end
 def autocomplete_user_name
    resources :users do
      get :autocomplete_user_name, :on => :collection
    end
 end  
 def  group_member
      @id= params[:id]
      @us = current_user.id
      @group=Group.find(@id)
      #not read where
      #@usrGroups=User.joins( groups: :members).where('groups.user_id=?', @id)
      


      @usrGroups=User.find_by_sql(["
                                SELECT users.*  FROM users,groups,members where 
                                groups.id=members.group_id
                                AND  groups.user_id=?
                                AND  groups.id=?
                                AND users.id = members.user_id
                                 " , @us , @id])
      #query error

=begin
      @group.each do |group|
        @user.push(group.user_id)
      end  
=end
     # @usrGroups=User.find(@user)  
      respond_to do |format|
           format.html
           format.js {} 
           format.json { 
              render json: {:groups => @group,:usrGroups => @usrGroups}
           } 
        end
  end

  # GET /groups/new
  def new
    @group = Group.new
    @groups= Group.find(1)
    @member =@groups.members.new
    @groupsData = Group.all
    #@user = User.all
    @user=User.select('email')
    @data = Array.new
    @user.each do |data|
      @n={label: data.id  ,value: data.email  }
      @data.push(@n)
     end  
  end
  def get_user_data
       @email= params[:email]
       @id=User.select('id').where('email=?', @email)
       respond_to do |format|
           format.html
           format.js {} 
           format.json { 
              render json: {:id => @id}
           } 
        end
  end  
  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to new_group_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    
    @group.destroy
    respond_to do |format|
      format.html { redirect_to new_group_path, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:group_name,:user_id)
    end
end
