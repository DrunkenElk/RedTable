class Reply
  include Mongoid::Document
  field :email, type: String
  field :theme, type: String
  field :comment, type: String
  field :image, type: String
  field :password, type: String
  field :ip, type: String
  field :username, type: String
end
