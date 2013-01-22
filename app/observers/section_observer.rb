# -*- encoding : utf-8 -*-
class SectionObserver < Mongoid::Observer
  def after_build(section)
    imageboard = section.imageboard
    section.username = imageboard.username
    section.threadlimit = imageboard.threadlimit
    section.postlimit = imageboard.postlimit
  end
end
