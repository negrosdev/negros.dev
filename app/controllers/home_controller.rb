class HomeController < ApplicationController
  def index
    @contents = Content.published.limit(6).order('created_at DESC')
  end
end
