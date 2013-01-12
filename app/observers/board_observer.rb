class BoardObserver < Mongoid::Observer
  def after_build(board)
    section = board.section
    board.username = section.username
    board.threadlimit = section.threadlimit
    board.postlimit = section.postlimit
  end
end
