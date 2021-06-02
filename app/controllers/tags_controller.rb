class TagsController < ApplicationController
  def index
    @tags = Tag.all.order('name ASC')
  end

  def show
    @tag = Tag.find_by(name: params[:name])
    @contents = Content.where(tag: @tag).all.order('title ASC')
  end
end
