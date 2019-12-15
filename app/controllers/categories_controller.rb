class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 15).order('created_at DESC')
  end
end