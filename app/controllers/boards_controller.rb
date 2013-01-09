class BoardsController < ApplicationController
  before_filter :find_by_shortcut, :only => :show
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
    #respond_with(@board)
  end

  def update
    @board.update_attributes(params[:board])
    redirect_to section_path(@section)
    #respond_with(@board)
  end

  def destroy
    @board.destroy
    redirect_to @section
    #respond_with(@board)
  end

private

  def find_by_shortcut
    @board = Board.find_by(shortcut: params[:shortcut]) if params[:shortcut].present?
  end

end
