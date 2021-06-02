class ContentsController < ApplicationController
  before_action :set_tags, only: %i[index tag]

  def index
    @contents = Content.friendly.order('created_at DESC').limit(8)
  end

  def show
    @content = Content.friendly.find(params[:id])
  end

  private

  def set_tags
    @tags = Tag.all
  end
end
