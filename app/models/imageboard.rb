# -*- encoding : utf-8 -*-
class Imageboard
  include Mongoid::Document
  has_many :sections, dependent: :destroy

  field :name,   type: String
  field :logo,   type: String

  field :username, type: String, default: 'Anonymous'
  field :postlimit, type: Integer, default: 500
  field :threadlimit, type: Integer, default: 50

  field :trivia, type: String
  field :faq,    type: String
  field :rules,  type: String
  field :about,  type: String
  
  attr_accessible :logo, :name, :trivia, :faq, :rules, :about,
                  :username, :threadlimit, :postlimit

  mount_uploader :logo, ::LogoUploader

  def self.instance
    @imageboard ||= Imageboard.first || Imageboard.create
  end
end
