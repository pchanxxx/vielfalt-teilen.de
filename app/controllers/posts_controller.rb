class PostsController < ApplicationController

  def show
    @post = @active_category.posts.published.find(params[:id])
    @simple = params[:simple]
  end

end