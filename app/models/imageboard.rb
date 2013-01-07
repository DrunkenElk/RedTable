# -*- encoding : utf-8 -*-
class Imageboard
  include Mongoid::Document
  has_many :sections, dependent: :destroy

  field :name,   type: String
  field :logo,   type: String

  # field :bumplimit, type: Integer
  # field :threadlimit, type: Integer

  field :trivia, type: String
  field :faq,    type: String
  field :rules,  type: String
  field :about,  type: String
  
  attr_accessible :logo, :name, :trivia, :faq, :rules, :about

  mount_uploader :logo, ::LogoUploader

  def self.instance
    @imageboard ||= Imageboard.first || Imageboard.create
  end
end
