class ApplicationController < ActionController::Base

  before_action :request_path, :set_search
  helper_method :current_user, :logged_in?

  def request_path
    @path = controller_path + '#' + action_name
    def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
    end
  end

  def set_search
    @search = Article.ransack(params[:q])
    @search_articles = @search.result.paginate(page: params[:page], per_page: 10)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end

