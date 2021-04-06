class VideosController < ApplicationController
  def show
    album = Album.friendly.find[params[:album_id]]

    redirect_to course_path(params[:course_id])
  end
end