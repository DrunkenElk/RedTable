class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  paginates_per 5

  belongs_to :board, inverse_of: :thread

  has_many :replies, class_name: "Post", inverse_of: :thread, dependent: :destroy
  belongs_to :thread, class_name: "Post", inverse_of: :reply

  field :email, type: String
  field :theme, type: String
  field :comment, type: String
  field :image, type: String
  field :password, type: String
  field :number, type: Integer
  field :attached, type: Boolean
  field :postlimit, type: Integer
  field :ip, type: String
  field :username, type: String

  default_scope order_by(attached: :desc).order_by(updated_at: :asc)

  mount_uploader :image, ::ImageUploader
  validates :image, file_size: { maximum: 2.megabytes.to_i }

  attr_accessible :email, :theme, :comment, :image, 
                  :password, :number, :attached

  def thread?
    board.present?
  end

end
