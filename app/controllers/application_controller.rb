require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  respond_to :any

  protect_from_forgery

protected
  
  def imageboard
    @imageboard ||= Imageboard.find_or_create_by(name: Settings.imageboard.name)
  end
end
