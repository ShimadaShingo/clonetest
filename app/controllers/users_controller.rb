# encoding: UTF-8
class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  
  #shimadadadadaa
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
   end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
#    @user = User.find(params[:id])
 
#    respond_to do |format|
#      @user.
#      @user.save
#      format.html { redirect_to @user, notice: 'User was successfully updated.' }
#      format.json { head :no_content }
#    end
          
    begin
      @user = User.find(params[:id])
        User.transaction do
        respond_to do |format|
            @user.update_attributes!(params[:user])
            format.html { redirect_to @user, notice: '正しく更新されました。' }
            format.json { head :no_content }

        end
      end
    rescue  ActiveRecord::StaleObjectError
#      flash[:error] = "既に別の場所で編集されています。" 
      render :action => 'errform' 
    rescue        ActiveRecord::RecordInvalid
      render :action => 'edit' 
    else
#            format.html { redirect_to @user, notice: 'User was successfully updated.' }
    end
#          if @user.update_attributes!(params[:user])
#            format.html { redirect_to @user, notice: 'User was successfully updated.' }
#            format.json { head :no_content }
#          else
#            format.html { render action: "edit" }
#            format.json { render json: @user.errors, status: :unprocessable_entity }
#          end

 end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def errform
      render :action => 'errform' 
#      format.html # errform.html.erb
#      format.json { render json: @user }
#    respond_to do |format|
#      format.html 
#      format.json { render json: @user }
#    end
  end
end
