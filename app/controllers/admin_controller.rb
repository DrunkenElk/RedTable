# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    authorize! :access_to_admin_page, imageboard
  end

end
