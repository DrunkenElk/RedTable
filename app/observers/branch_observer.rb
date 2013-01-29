class BranchObserver < Mongoid::Observer
  def after_build(branch)
    board = branch.board
    branch.postlimit = board.postlimit
    branch.username = board.username
  end
end
