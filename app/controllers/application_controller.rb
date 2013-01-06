require "application_responder"

class ApplicationController < ActionController::Base
  before_filter :check_format
  self.responder = ApplicationResponder

  respond_to :html

  protect_from_forgery

protected
  
  def imageboard
    @imageboard ||= Imageboard.find_or_create_by(name: Settings.imageboard.name)
  end

private

  def check_format
    request.format = :html if params[:format].blank? || 
      params[:format][/(html|json|xml)/].blank?
  end

end
