class Admin::ProductsController < ApplicationController
  load_and_authorize_resource

  def new
    @product = Admin::Product.new
    @brands = Admin::Brand.all
    @categories = Admin::Category.all
    respond_to do |format|
      format.html  # new.html.erb
    end
  end

  def index

    p @products = Admin::Product.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create

    @product = Admin::Product.new(params[:admin_product])
    @product.brand_id = params[:brand]
    @product.category_id = params[:category][:category_id]
    @product.size = params[:size]
    @product.color = params[:color]
    @product.gender = params[:gender]
    respond_to do |format|

      if  @product.save

        format.html { redirect_to(admin_products_path, :notice => 'Product was successfully created.') }

      else

        format.html { render :action => "new" }

      end
    end

  end

  def show
    @product = Admin::Product.find(params[:id])

  end

  def edit
    @product = Admin::Product.find(params[:id])
    @brands = Admin::Brand.all
    @categories = Admin::Category.all
      p @product
    p '------------------'
  end

   def update
     @product = Admin::Product.find(params[:id])
     @product.brand_id = params[:brand]
     @product.category_id = params[:category]
     @product.size = params[:size]
     @product.color = params[:color]
     @product.gender = params[:gender]
     p @product
     p '-----------------------------------------------------'
     respond_to do |format|
       if @product.update_attributes(params[:admin_product])

         format.html  { redirect_to(admin_products_path, :notice => 'Product was successfully updated.') }

       else
         format.html  { render :action => "edit" }

       end
     end
   end
end
