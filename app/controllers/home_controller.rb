class HomeController < ApplicationController
  def index
    @courses = Course.all
  end
end