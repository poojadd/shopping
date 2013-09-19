class Admin::BrandsController < ApplicationController

  def index
    @brands = Admin::Brand.all
    p '-------------------------------------'
    p @brands
  end

  def new
    @brand = Admin::Brand.new

    respond_to do |format|
      format.html # new.html.erb
                  #  format.json { render json: @brand }
                  # format.js
    end
  end

  def create
    @brand = Admin::Brand.new(params[:admin_brand])

    respond_to do |format|
      if @brand.save
        #  @brands = Admin::Brand.all

        format.html { redirect_to admin_brands_path, notice: 'Brand was successfully created.' }

        format.js { render :file => '/admin/category/index.js.erb' }
      else
        format.html { render action: "/admin/categories/new" }

      end
    end
  end

  def show
    @brand = Admin::Brand.find(params[:id])
  end
end
