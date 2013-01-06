require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  before_filter :check_format
  respond_to :html
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

protected

  def imageboard
    Imageboard.instance
  end

private

  def check_format
    request.format = :html if params[:format].blank? || 
      params[:format][/(html|json|xml)/].blank?
  end

end
