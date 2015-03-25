class Zeichen < ActiveRecord::Base
  attr_accessible :email, :name, :picture, :text, :published

  validates_presence_of :email, :name, :picture, :text
end
