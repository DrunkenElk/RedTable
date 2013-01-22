class PostsController < ApplicationController
  before_filter :find_by_shortcut
  layout 'board'

  def index
    @posts = @board.threads
    @post = @board.threads.build
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    respond_with(@post)
  end

  def edit
    respond_with(@post)
  end

  def create
    @post = @board.threads.build(params[:post])
    set_hidden_fields
    @post.save
    redirect_to shortcut_path(params[:shortcut])
  end

  def update
    @post.update_attributes(params[:post])
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

private

  def find_by_shortcut
    if params[:shortcut].present?
      @board = ::BoardDecorator.new( Board.find_by(shortcut: params[:shortcut]) )
    end
  end

  def set_hidden_fields
    unless current_user && current_user.role?(:admin)
      @post.attached = false
    end
    @post.ip = request.remote_ip
    @post.number = @board.get_number
  end
end
