class Admin::CategoriesController < AdminController
  before_filter :find_model

  def index
    @categories = Category.all
  end

  def edit

  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path
    else
      render action: "edit"
    end
  end

  private

  def find_model
    @category = Category.find_by_slug(params[:id]) if params[:id]
  end
end