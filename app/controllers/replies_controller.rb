class RepliesController < ApplicationController
  before_filter :find_by_number
  layout 'board'

  def index
    @replies = ::ReplyDecorator.decorate(@branch.replies.page(params[:page]))
    @reply = ::ReplyDecorator.new(@branch.replies.build)
    respond_with(@replies)
  end

  def show
    respond_with(@reply)
  end

  def new
    @reply = ::ReplyDecorator.new(@branch.replies.build)
    respond_with(@reply)
  end

  def create
    @reply = @branch.replies.build(params[:reply])
    set_hidden_fields
    @reply.save
    redirect_to thread_path(shortcut: @board.shortcut, number: @branch.number)
  end

  #def destroy
    #@branch.destroy
    #respond_with(@branch)
  #end

private

  def find_by_number
    if params[:number].present?
      @branch = ::BranchDecorator.new( Branch.find_by(number: params[:number]) )
      @board = ::BoardDecorator.new( @branch.board )
    end
  end

  def set_hidden_fields
    @reply.ip = request.remote_ip
    @reply.number = @board.get_number
    @reply.updated_at = DateTime.now
  end

end
