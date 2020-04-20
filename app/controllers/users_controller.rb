class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 8).order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 10).recent
    @user_categories = Category
                        .joins(:articles)
                        .where(articles: {user_id: @user.id}).group("categories.id")
                        .select("categories.id, categories.name, count(categories.id) as ctg_count")
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:success] = "User and all articles created by user have been deleted"
    redirect_to root_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:error] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end
