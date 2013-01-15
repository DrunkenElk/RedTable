class Post
  include Mongoid::Document

  belongs_to :board, inverse_of: :thread

  has_many :replies, class_name: "Post", inverse_of: :thread, dependent: :destroy
  belongs_to :thread, class_name: "Post", inverse_of: :reply

  field :email, type: String
  field :theme, type: String
  field :comment, type: String
  field :file, type: String
  field :password, type: String
  field :number, type: Integer
  field :attached, type: Boolean
  field :postlimit, type: Integer
  field :ip, type: String
end
