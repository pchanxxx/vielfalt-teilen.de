class Admin::PostsController < AdminController
  before_filter :find_model

  def index
    @posts = Post.order('published_at DESC')
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to admin_posts_path, notice: 'Der Eintrag wurde erfolgreich gespeichert.'
    else
      render action: "new"
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to admin_posts_path, notice: 'Der Eintrag wurde erfolgreich gespeichert.'
    else
      render action: "edit"
    end
  end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path, notice: 'Der Eintrag wurde erfolgreich gelöscht.'
    else
      redirect_to admin_posts_path, error: 'Der Eintrag konnte nicht gelöscht werden.'
    end
  end

  private

  def find_model
    @post = Post.find(params[:id]) if params[:id]
  end
end