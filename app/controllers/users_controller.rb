class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index

    @users = User.all

  end


  def destroy
    p params[:id]
    User.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to book_users_path }

    end
  end

  def add_roles
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def assign_roles
    @user = User.find(params[:id])
    @user.roles.clear
    params[:role_id].each do |role_id|

      @user.roles << Role.find(role_id)


    end
    respond_to do |format|
      if @user.save
        @users = User.all
        format.html { render users_path }
        format.js { render 'index' }
      end
    end
  end
end
