# -*- encoding : utf-8 -*-
class PostsController < ApplicationController
  before_filter :find_by_shortcut
  layout 'board'

  def index
    @threads = @source.page(params[:page]).decorate
    @post = @source.build
    respond_with(@threads)
  end

  def thread
    @replies = @source.page(params[:page]).decorate
    @post = @source.build
    respond_with(@replies)
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
    @post = @source.build(params[:post])
    set_hidden_fields
    @post.save
    redirect_to @source_path
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

    if params[:thread].present?
      @thread = ::PostDecorator.new( Post.find_by(number: params[:thread]) )
    end

    if @thread.present?
      @source = @thread.replies
      @source_path = thread_path(shortcut: @board.shortcut, thread: @thread.number)
    else
      @source = @board.threads
      @source_path = shortcut_path(@board.shortcut)
    end
  end

  def set_hidden_fields
    unless current_user && current_user.role?(:admin)
      @post.attached = false
    end
    @post.ip = request.remote_ip
    @post.number = @board.get_number
    @post.updated_at = DateTime.now
  end
end
