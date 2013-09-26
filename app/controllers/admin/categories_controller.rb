class Admin::CategoriesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @categories = Admin::Category.all
    @category = Admin::Category.new

  end

  def new
    @category = Admin::Category.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @category = Admin::Category.new(params[:admin_category])

    respond_to do |format|
      if @category.save
        @categories = Admin::Category.all
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
        format.js { render :file => '/admin/categories/index.js.erb' }
      else
        format.html { render action: "/admin/categories/new" }
      end
    end
  end

  def show
    @category = Admin::Category.find(params[:id])
  end
end
