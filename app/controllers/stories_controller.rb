class StoriesController < ApplicationController
  def index
    @stories = Story.order_by_updated_at.paginate(:page => params[:page], :per_page => 30)
  end
  
  def hot
    @stories = Story.order_by_views.paginate(:page => params[:page], :per_page => 30)
  end
end
