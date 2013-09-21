class Admin::UsersController < ApplicationController

  def index

      @users =  Admin::User.all

  end


  def destroy
    p params[:id]
    Admin::User.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to book_users_path  }

    end
  end

end
