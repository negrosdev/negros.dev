class HomeController < ApplicationController
  def index
    @courses = Course.order(updated_at: :desc).all.limit(8)
  end
end