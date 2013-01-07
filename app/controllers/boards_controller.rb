class BoardsController < ApplicationController
  def index
    @boards = Board.all
    respond_with(@boards)
  end

  def show
    @board = Board.find(params[:id])
    respond_with(@board)
  end

  def new
    @board = Board.new
    respond_with(@board)
  end

  def edit
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(params[:board])
    @board.save
    respond_with(@board)
  end

  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params[:board])
    respond_with(@board)
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    respond_with(@board)
  end
end
