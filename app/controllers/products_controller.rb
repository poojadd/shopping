class ProductsController < ApplicationController

   def index
     @products = Admin::Product.where("category_id = ?", params[:category_id])

   end

  def show
    @product = Admin::Product.find(params[:id])
  end

end
