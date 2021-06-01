class HomeController < ApplicationController
  def index
    @contents = Content.order(updated_at: :desc).limit(8)
  end
end
