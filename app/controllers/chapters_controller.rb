class ChaptersController < ApplicationController
  def show
    @chapter = Chapter.find_by(id: params[:id])
    if @chapter
      @story = @chapter.story
      @chapters = Chapter.where_story_id(@chapter.story_id)
    else
      flash[:danger] = "Can't find chapter"
      redirect_to root_path
    end
  end
end
