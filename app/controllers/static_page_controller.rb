class StaticPageController < ApplicationController
  def home
    @hot_stories = Story.hot_stories
    @stories = Story.order_by_updated_at.paginate(:page => params[:page], :per_page => 30)
  end
end
