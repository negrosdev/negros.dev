class ContentsController < ApplicationController
  before_action :set_content, only: %w[show track]

  def show; end

  def track
    @track = Track.friendly.find(params[:track_id])
    render :show
  end

  private

  def set_content
    @content = Content.includes(:tracks).friendly.find(params[:id])
  end
end
