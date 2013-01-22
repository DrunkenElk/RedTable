class PostObserver < Mongoid::Observer
  def after_build(post)
    board = post.board
    post.postlimit = board.postlimit
  end
end
