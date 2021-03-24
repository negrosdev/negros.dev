class CoursesController < ApplicationController
  def index
  end

  def show
    @course = Course.friendly.find(params[:id])
    @relateds_courses = Course.friendly.where(category: @course.category).last(4)
  end
end