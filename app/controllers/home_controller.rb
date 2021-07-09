class HomeController < ApplicationController
  def index
    @contents = Content.order(created_at: :desc).limit(8)
  end
end
