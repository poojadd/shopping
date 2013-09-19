class admin::CategoriesController < ApplicationController

      def index
        @categories = Category.all
      end
      def new
        @category = Category.new

        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @category }
          format.js
        end
      end

      def create
        @category = Mysubject.new(params[:mysubject])

        respond_to do |format|
          if @category.save
            @categories = Mysubject.find(:all)

            format.html { redirect_to category_path, notice: 'Category was successfully created.' }
            format.json { render json: category_path, status: :created, location: @mysubject }
            format.js { render :file => '/admin/category/index.js.erb' }
          else
            format.html { render action: "new" }
            format.json { render json: @mysubject.errors, status: :unprocessable_entity }
          end
        end
      end

end
