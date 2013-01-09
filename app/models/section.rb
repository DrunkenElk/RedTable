# -*- encoding : utf-8 -*-
class Section
  include Mongoid::Document
  belongs_to :imageboard
  has_many :boards, dependent: :destroy

  field :name, type: String

  # field :bumplimit, type: Integer
  # field :threadlimit, type: Integer

end
