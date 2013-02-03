# -*- encoding : utf-8 -*-
class SectionsController < ApplicationController
  load_and_authorize_resource :imageboard
  load_and_authorize_resource through: :imageboard
  
  def index
    respond_with(@sections)
  end

  def show
    respond_with(@section)
  end

  def new
    respond_with(@section)
  end

  def edit
    respond_with(@section)
  end

  def create
    @section.save
    respond_with(@section)
  end

  def update
    @section.update_attributes(params[:section])
    respond_with(@section)
  end

  def destroy
    @section.destroy
    respond_with(@section)
  end

end
