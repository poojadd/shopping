class HomeController < ApplicationController
  before_filter :index_category
  def index
    @categories = Admin::Category.all
  end
end
