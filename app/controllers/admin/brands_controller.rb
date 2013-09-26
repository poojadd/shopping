class Admin::BrandsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @brands = Admin::Brand.all
    @brand = Admin::Brand.new
  end

  def new
    @brand = Admin::Brand.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @brand = Admin::Brand.new(params[:admin_brand])

    respond_to do |format|
      if @brand.save
        @brands = Admin::Brand.all
        format.html { redirect_to admin_brands_path, notice: 'Brand was successfully created.' }
        format.js { render :file => '/admin/brands/index.js.erb' }
      else
        format.html { render action: "/admin/brands/new" }

      end
    end
  end

  def show
    @brand = Admin::Brand.find(params[:id])
  end
end
