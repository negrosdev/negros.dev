class HomeController < ApplicationController
  def index
    @courses = Course.order(updated_at: :desc).limit(8)
  end
end