# -*- encoding : utf-8 -*-
require "application_responder"

class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  self.responder = ApplicationResponder

  before_filter :check_format, :load_imageboard
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

  # for cancanload_and_authorize_resource method 
  def load_imageboard
    @imageboard ||= imageboard
  end

end
