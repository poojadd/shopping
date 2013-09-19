class Admin::ProductsController < ApplicationController

  def new
    @product = Products.new

    respond_to do |format|
      format.html  # new.html.erb

    end
  end

  def index
    @products = Products.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create

    @product = Products.new(params[:admin_product])
    respond_to do |format|
      if  @product.save
        format.html { redirect_to(admin_products_path, :notice => 'Products was successfully created.') }

      else
        format.html { render :action => "new" }

      end
    end

  end

  def show
    @product = Products.find(params[:id])

  end

  def edit
    @product = Products.find(params[:id])
  end

   def update
     @product = Products.find(params[:id])

     respond_to do |format|
       if @product.update_attributes(params[:admin_product])
         format.html  { redirect_to(admin_products_path, :notice => 'Products was successfully updated.') }

       else
         format.html  { render :action => "edit" }

       end
     end
   end
end
