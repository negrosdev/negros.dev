class CoursesController < ApplicationController
  def index
  end

  def show
    @course = Course.find(params[:id])
    @relateds_courses = Course.where(category: @course.category).last(4)
  end
end