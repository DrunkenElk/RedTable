class Board
  include Mongoid::Document
  field :name, type: String
  field :logo, type: String
  field :trivia, type: String,
  field :visibility, type: Boolean,
  field :shortcut, type: String
end
