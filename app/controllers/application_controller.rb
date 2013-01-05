class ApplicationController < ActionController::Base
  protect_from_forgery

protected
  
  def imageboard
    @imageboard ||= Imageboard.find_or_create_by(name: Settings.imageboard.name)
  end
end
