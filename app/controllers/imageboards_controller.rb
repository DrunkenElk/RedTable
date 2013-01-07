# -*- encoding : utf-8 -*-
class ImageboardsController < ApplicationController
  load_and_authorize_resource

  def show
    respond_with imageboard
  end

  def edit
    respond_with imageboard
  end

  def update
    imageboard.update_attributes(params[:imageboard])
    respond_with imageboard
  end

  def faq
    respond_with imageboard
  end

  def rules
    respond_with imageboard
  end

  def about
    respond_with imageboard
  end

  def news
    respond_with imageboard
  end

end
