class PublicBoardsController < ApplicationController
  before_filter :find_by_shortcut
  layout 'board'
  
  def show
    respond_with(@board)
  end

private

  def find_by_shortcut
    if params[:shortcut].present?
      @board = ::BoardDecorator.new( Board.find_by(shortcut: params[:shortcut]) )
    end
  end

end
