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
  end

  def rules
  end

  def about
  end

  def news
  end

end
