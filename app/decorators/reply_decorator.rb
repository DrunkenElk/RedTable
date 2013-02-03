# -*- encoding : utf-8 -*-
class ReplyDecorator < Draper::Base
  decorates :reply

  def full_number
    "№ #{number}"
  end
end
