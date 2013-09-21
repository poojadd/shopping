class RoleUsersController < ApplicationController

  def index
    @roleusers = RoleUser.all
    p @roleusers
    p '------------------------------------'
    respond_to do |format|
      format.html

    end
  end

  def show
    @roles_user = RoleUser.find(params[:id])

  end

  def new
    @roleuser = RoleUser.new


  end

  def create
    @roleuser = RoleUser.new(params[:roleuser])

    p @roleuser
    p '+++++++++++++++++++++++++++++++++++++++++++++++++++'
    respond_to do |format|
      if @roleuser.save
        format.html { redirect_to(role_users_path, :notice => 'Role was successfully assigned.') }
        format.js

      else
        format.html { render :action => "new" }
        format.js

      end
    end
  end


  def edit
    @roleuser = Role_User.find(params[:id])

  end

  def update
    @roleuser = Role_User.find(params[:id])
    respond_to do |format|
      if @roleuser.update_attributes(params[:roleuser])
        format.html { redirect_to(role_users_path, :notice => 'Book was successfully updated.') }

      else

        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    Role_User.find(params[:id]).destroy
    respond_to do |format|


    end
  end


end

