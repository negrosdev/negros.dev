class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end
end