class Admin::UsersController < AdminController
  before_filter :find_model

  def index
    @users = User.order('email ASC')
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_posts_path, notice: 'Der Termin wurde erfolgreich gespeichert.'
    else
      render action: "new"
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path, notice: 'Der Termin wurde erfolgreich gespeichert.'
    else
      render action: "edit"
    end
  end

  private

  def find_model
    @user = User.find(params[:id]) if params[:id]
  end
end