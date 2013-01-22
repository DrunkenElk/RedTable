# -*- encoding : utf-8 -*-
class BoardsController < ApplicationController
  load_and_authorize_resource :section
  load_and_authorize_resource through: :section

  def show
    respond_with(@board)
  end

  def new
    respond_with(@board)
  end

  def edit
    respond_with(@board)
  end

  def create
    @board.save
    redirect_to @section
  end

  def update
    @board.update_attributes(params[:board])
    redirect_to section_path(@section)
  end

  def destroy
    @board.destroy
    redirect_to @section
  end

end
