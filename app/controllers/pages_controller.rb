class PagesController < ApplicationController
  def top
    redirect_to articles_path if logged_in?
    @articles = Article.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end
end
