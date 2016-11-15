class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_url
    url_for :params => params
  end
end
