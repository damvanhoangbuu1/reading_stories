class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    if @category
      @stories = @category.stories.order_by_updated_at.paginate(page: params[:page], per_page: 30)
    else
      flash[:danger] = "Can't find this category name!!"
      redirect_to root_path
    end
  end
end
