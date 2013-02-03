# -*- encoding : utf-8 -*-
class Section
  include Mongoid::Document
  belongs_to :imageboard
  has_many :boards, dependent: :destroy

  field :name, type: String

  field :username, type: String
  field :postlimit, type: Integer
  field :threadlimit, type: Integer

  attr_accessible :name, :username, :threadlimit, :postlimit

end
