class ImageboardsController < ApplicationController

  def show
    respond_with imageboard
  end

  def edit
    respond_with imageboard
  end

  def update
    imageboard.update_attributes(params[:imageboard])
    binding.pry
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
