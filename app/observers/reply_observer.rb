class ReplyObserver < Mongoid::Observer
  def after_build(reply)
    branch = reply.branch
    reply.username = branch.username
  end
end
