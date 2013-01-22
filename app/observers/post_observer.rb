# -*- encoding : utf-8 -*-
class PostObserver < Mongoid::Observer
  def after_build(post)
    if post.thread?
      board = post.board
      post.postlimit = board.postlimit
      post.username = board.username
    else
      thread = post.thread
      post.username = thread.username
    end
  end
end
