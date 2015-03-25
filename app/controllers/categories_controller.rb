class CategoriesController < ApplicationController

  def index
    @posts = Post.published.page(params[:page]).per(10)

    render 'list'
  end

  def show
    @posts = @active_category.posts.published.page(params[:page]).per(10)
    render 'list'
  end

end
