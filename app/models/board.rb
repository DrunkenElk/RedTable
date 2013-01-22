# -*- encoding : utf-8 -*-
class Board
  include Mongoid::Document
  belongs_to :section
  has_many :threads, class_name: "Post", dependent: :destroy

  mount_uploader :logo, ::LogoUploader

  attr_accessible :logo, :name, :trivia, :visibility, :shortcut, :section_id,
                  :username, :threadlimit, :postlimit

  field :name, type: String
  field :logo, type: String
  field :trivia, type: String
  field :visibility, type: Boolean, default: true
  field :shortcut, type: String

  field :username, type: String
  field :postlimit, type: Integer
  field :threadlimit, type: Integer

  field :posts_counter, type: Integer, default: 0

  default_scope order_by(shortcut: :inc)

  def get_number
    self.posts_counter += 1
    self.save
    self.posts_counter
  end
end
