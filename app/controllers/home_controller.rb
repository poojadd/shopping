class HomeController < ApplicationController
  def index
    @categories = Admin::Category.all
  end
end
