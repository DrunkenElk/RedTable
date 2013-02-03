# -*- encoding : utf-8 -*-
class ReplyDecorator < Draper::Base
  decorates :branch

  def full_number
    "№ #{number}"
  end
end
