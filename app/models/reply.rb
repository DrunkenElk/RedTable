class Reply
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :branch

  field :email, type: String
  field :comment, type: String
  field :image, type: String
  field :password, type: String
  field :number, type: Integer
  field :ip, type: String
  field :username, type: String

  default_scope order_by(updated_at: :asc)

  mount_uploader :image, ::ImageUploader

  validates :image, file_size: { maximum: 2.megabytes.to_i }
  validates :comment, presence: true

  attr_accessible :email, :comment, :image,
                  :password, :number

end
