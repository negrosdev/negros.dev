class HomeController < ApplicationController
  def index
    @contents = Content.order(created_at: :desc).where.not(status: :draft).limit(8)
  end
end
