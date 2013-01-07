# -*- encoding : utf-8 -*-
class SectionsController < ApplicationController
  def index
    @sections = Section.all
    respond_with(@sections)
  end

  def show
    @section = Section.find(params[:id])
    respond_with(@section)
  end

  def new
    @section = Section.new
    respond_with(@section)
  end

  def edit
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(params[:section])
    @section.save
    respond_with(@section)
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(params[:section])
    respond_with(@section)
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    respond_with(@section)
  end
end
