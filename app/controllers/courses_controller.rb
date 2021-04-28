class CoursesController < ApplicationController
  before_action :set_categories, only: %i[index category]
  before_action :set_recommended, only: %i[show]

  def index
    @courses = Course.friendly.order('created_at DESC').limit(8)
  end

  def show
    @course = Course.friendly.find(params[:id])
  end

  def category
    @category = Category.friendly.find(params[:id])
    @courses = Course.friendly.where(category: @category).all
    render :index
  end

  private

  def set_categories
    @categories = Category.friendly.all
  end

  def set_recommended
    @recommended = Course.order(Arel.sql('RANDOM()')).limit(3)
  end
end
