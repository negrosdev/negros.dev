class HomeController < ApplicationController
  def index
    @contents = Content.published.order('created_at DESC').limit(6)
  end
end
