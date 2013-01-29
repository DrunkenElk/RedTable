class RepliesController < ApplicationController
  def index
    @replies = Reply.all
    respond_with(@replies)
  end

  def show
    @reply = Reply.find(params[:id])
    respond_with(@reply)
  end

  def new
    @reply = Reply.new
    respond_with(@reply)
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def create
    @reply = Reply.new(params[:reply])
    @reply.save
    respond_with(@reply)
  end

  def update
    @reply = Reply.find(params[:id])
    @reply.update_attributes(params[:reply])
    respond_with(@reply)
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    respond_with(@reply)
  end
end
