class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :index_category
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, :alert => exception.message }
      format.js { render '/shared/access_denied.js.erb' }
    end
  end

  def index_category
      @index_cat = Admin::Category.all

  end


end

