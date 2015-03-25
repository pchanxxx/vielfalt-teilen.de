class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :active_category
  helper_method :active_header
  helper_method :categories

  before_filter :active_category
  before_filter :categories

  def active_category
    category_id = params[:category_id] || params[:id]

    @active_category ||= Category.find_by_slug(category_id)
    @simple = params[:simple]

    if !@active_category and !(params[:id].nil? || params[:category_id].nil?)
      redirect_to root_path
    end
  end

  def active_header
    if @active_category
      @active_header = @active_category.header_image.url(:header)
    end

    @active_header ||= '/assets/default_header.png'
  end

  def categories
    @categories ||= Category.all
  end
end
