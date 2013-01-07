# -*- encoding : utf-8 -*-
class Imageboard
  include Mongoid::Document

  field :name, type: String
  field :trivia, type: String
  field :logo, type: String
  
  attr_accessible :logo, :name, :trivia

  mount_uploader :logo, ::LogoUploader

  def self.instance
    @imageboard ||= Imageboard.first || Imageboard.create
  end
end
