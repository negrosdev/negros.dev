class ContentsController < ApplicationController
  before_action :content_params, only: %i[show]

  def show
    return not_found unless @content.published?
  end

  private

  def content_params
    @content = Content.friendly.find(params[:id])
  end
end
