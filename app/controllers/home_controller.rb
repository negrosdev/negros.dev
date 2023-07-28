class HomeController < ApplicationController
  def index
    @contents = Content.includes(:category).published.order('created_at DESC').limit(6)
  end
end
