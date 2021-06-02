class ContentsController < ApplicationController
  def index
    @contents = Content.friendly.order('created_at DESC').limit(8)
  end

  def show
    @content = Content.friendly.find(params[:id])
  end
end
