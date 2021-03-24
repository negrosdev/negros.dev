class CoursesController < ApplicationController
  before_action :set_categories, only: [:index, :category]
  
  def index
    @courses = Course.friendly.all
  end

  def show
    @course = Course.friendly.find(params[:id])
    @relateds_courses = Course.friendly.where(category: @course.category).last(4)
  end

  def category
    begin
      @category = Category.friendly.find(params[:id])
      @courses = Course.friendly.where(category: @category).all
      render :index
    rescue => e
      flash[:notice] = "A categoria que você procura não foi encontrada 😢"
      redirect_to action: "index"
    end
  end

  private

  def set_categories
    @categories = Category.friendly.all
  end
end