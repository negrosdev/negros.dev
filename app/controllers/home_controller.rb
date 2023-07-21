class HomeController < ApplicationController
  def index
    @contents = Content.where(status: :published).order('created_at desc').limit(6)
    puts @contents
    puts @contents.count
  end
end
