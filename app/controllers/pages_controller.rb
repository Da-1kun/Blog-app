class PagesController < ApplicationController
  def top
    redirect_to articles_path if logged_in?
    @articles = Article.all.limit(10).order('created_at DESC')
    @user = User.new
    @categories = Category.all
  end
end
