class CartsController < ApplicationController
  before_filter :index_category

  def index
        @carts = Cart.find_all_by_users_id(current_user.id)
  end

  def create
    @cart = Cart.new
    @cart.users_id = current_user.id
   @cart.products_id = params[:format]
    p '====================================================================================================='
    p @cart
    respond_to do |format|
      if @cart.save
        format.html {redirect_to(carts_path) }
      else
        format.html {render }
      end
    end
  end

  def destroy
    Cart.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to carts_path }
    end
  end
end