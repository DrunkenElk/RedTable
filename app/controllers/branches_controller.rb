class BranchesController < ApplicationController
  before_filter :find_by_shortcut
  layout 'board'

  def index
    @branches = ::BranchDecorator.decorate(@board.branches.page(params[:page]))
    @branch = ::BranchDecorator.new(@board.branches.build)
    respond_with(@branches)
  end

  def show
    respond_with(@branch)
  end

  def new
    @branch = ::BranchDecorator.new( @board.branches.build )
    respond_with(@branch)
  end

  def edit
    respond_with(@branch)
  end

  def create
    @branch = @board.branches.build(params[:branch])
    set_hidden_fields
    @branch.save
    redirect_to shortcut_path(@board.shortcut)
  end

  def update
    @branch.update_attributes(params[:branch])
    respond_with(@branch)
  end

  def destroy
    @branch.destroy
    respond_with(@branch)
  end

private

  def find_by_shortcut
    if params[:shortcut].present?
      @board = ::BoardDecorator.new( Board.find_by(shortcut: params[:shortcut]) )
    end

    if params[:number].present?
      @branch = ::BranchDecorator.new( Branch.find_by(number: params[:number]) )
    end
  end

  def set_hidden_fields
    unless current_user && current_user.role?(:admin)
      @branch.attached = false
    end
    @branch.ip = request.remote_ip
    @branch.number = @board.get_number
    @branch.updated_at = DateTime.now
  end
end
