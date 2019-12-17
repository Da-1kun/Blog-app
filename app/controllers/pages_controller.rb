class PagesController < ApplicationController
  def top
    redirect_to articles_path if logged_in?
  end
end
