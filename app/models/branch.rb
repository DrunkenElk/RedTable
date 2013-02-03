class Branch
  include Mongoid::Document
  include Mongoid::Timestamps

  paginates_per 5

  belongs_to :board
  has_many :replies, dependent: :destroy

  field :email, type: String
  field :theme, type: String
  field :comment, type: String
  field :image, type: String
  field :password, type: String
  field :number, type: Integer
  field :attached, type: String
  field :postlimit, type: String
  field :ip, type: String
  field :username, type: String

  default_scope order_by(attached: :desc).order_by(updated_at: :asc)

  mount_uploader :image, ::ImageUploader

  validates :image, file_size: { maximum: 2.megabytes.to_i }
  validates :comment, presence: true

  attr_accessible :email, :theme, :comment, :image, 
                  :password, :number, :attached
end
