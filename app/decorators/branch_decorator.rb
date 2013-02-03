# -*- encoding : utf-8 -*-
class BranchDecorator < Draper::Base
  decorates :branch

  def full_number
    "№ #{number}"
  end
end
