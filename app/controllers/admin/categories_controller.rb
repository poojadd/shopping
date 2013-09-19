class Admin::CategoriesController < ApplicationController

  def index
    @categories = Admin::Category.all
    @category = Admin::Category.new
    p '-------------------------------------'
    p @categories
  end

  def new
    @category = Admin::Category.new

    respond_to do |format|
      format.html # new.html.erb
                  #  format.json { render json: @category }
                    # format.js
      end
  end

  def create
    @category = Admin::Category.new(params[:admin_category])

    respond_to do |format|
      if @category.save
        @categories = Admin::Category.all

        format.html { redirect_to admin_categories_path , notice: 'Category was successfully created.' }

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
