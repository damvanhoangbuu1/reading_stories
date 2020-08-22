class StoriesController < ApplicationController
  def index
    @stories = Story.order_by_updated_at.paginate(:page => params[:page], :per_page => 30)
  end
  
  def hot
    @stories = Story.order_by_views.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @story = Story.find_by(id: params[:id])
    if @story
      @category = @story.category
      @chapters = @story.chapters.order_by_created_at
      @rating_count = @story.ratings.count
      if @rating_count != 0
        @rating_value = @story.ratings.average(:rating_number)
      else
        @rating_value = 0
      end
    else
      flash[:danger] = "Can't find story!!"
      redirect_to root_path
    end
  end
  
end
