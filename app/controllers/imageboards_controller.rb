class ImageboardsController < ApplicationController
  respond_to :html, :json

  def show
    respond_with imageboard
  end

end
