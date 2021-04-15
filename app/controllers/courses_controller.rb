class CoursesController < ApplicationController
  before_action :set_categories, only: %i[index category]

  def index
    @courses = Course.friendly.limit(8)
  end

  def show
    @course = Course.friendly.find(params[:id])
    @relateds_courses = Course.friendly.where(category: @course.category).last(3)
    @video = @course.album.videos.first
  end

  def category
    @category = Category.friendly.find(params[:id])
    @courses = Course.friendly.where(category: @category).all

    render :index
  end

  def video
    @video = Video.friendly.find(params[:id])
    @course = Course.find(@video.album.course.id)
    @relateds_courses = Course.friendly.where(category: @course.category).last(3)

    render :show
  end

  private

  def set_categories
    @categories = Category.friendly.all
  end
end
