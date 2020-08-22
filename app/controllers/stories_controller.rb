class StoriesController < ApplicationController
  def index
    @stories = Story.search_by_name_or_author(params[:search]).paginate(page: params[:page], per_page: 30)
  end

  def hot
    @stories = Story.order_by_views.paginate(page: params[:page], per_page: 30)
  end

  def show
    @story = Story.find_by(id: params[:id])
    if @story
      @category = @story.category
      @chapters = @story.chapters.order_by_created_at
      @rating_count = @story.ratings.count
      @rating_value = if @rating_count != 0
                        @story.ratings.average(:rating_number)
                      else
                        0
                      end
    else
      flash[:danger] = "Can't find story!!"
      redirect_to root_path
    end
  end
end
