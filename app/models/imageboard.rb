class Imageboard
  include Mongoid::Document
  field :name, type: String
  field :logo, type: String
  
  attr_accessible :logo, :name
  mount_uploader :logo, ::LogoUploader
end
