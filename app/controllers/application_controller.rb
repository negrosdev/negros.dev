class ApplicationController < ActionController::Base
  protected

  def not_found
    render 'errors/404', status: :not_found
  end
end
