class Board
  include Mongoid::Document
  belongs_to :section

  mount_uploader :logo, ::LogoUploader

  attr_accessible :logo, :name, :trivia, :visibility, :shortcut, :section_id

  field :name, type: String
  field :logo, type: String
  field :trivia, type: String
  field :visibility, type: Boolean, default: true
  field :shortcut, type: String
end
