class InvitedFiendsController < ApplicationController
  before_action :set_invited_fiend, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /invited_fiends
  # GET /invited_fiends.json
  def index
    @invited_fiends = InvitedFiend.all
  end

  # GET /invited_fiends/1
  # GET /invited_fiends/1.json
  def show
  end

  # GET /invited_fiends/new
  def new
    @invited_fiend = InvitedFiend.new
  end

  # GET /invited_fiends/1/edit
  def edit
  end

  # POST /invited_fiends
  # POST /invited_fiends.json
  def create
    @invited_fiend = InvitedFiend.new(invited_fiend_params)

    respond_to do |format|
      if @invited_fiend.save
        format.html { redirect_to @invited_fiend, notice: 'Invited fiend was successfully created.' }
        format.json { render :show, status: :created, location: @invited_fiend }
      else
        format.html { render :new }
        format.json { render json: @invited_fiend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invited_fiends/1
  # PATCH/PUT /invited_fiends/1.json
  def update
    respond_to do |format|
      if @invited_fiend.update(invited_fiend_params)
        format.html { redirect_to @invited_fiend, notice: 'Invited fiend was successfully updated.' }
        format.json { render :show, status: :ok, location: @invited_fiend }
      else
        format.html { render :edit }
        format.json { render json: @invited_fiend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invited_fiends/1
  # DELETE /invited_fiends/1.json
  def destroy
    @invited_fiend.destroy
    respond_to do |format|
      format.html { redirect_to invited_fiends_url, notice: 'Invited fiend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invited_fiend
      @invited_fiend = InvitedFiend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invited_fiend_params
      params.require(:invited_fiend).permit(:status)
    end
end
