class Category < ActiveRecord::Base
  default_scope order('sort_order ASC')

  attr_accessible :color_top, :color_bottom, :introtext, :simpletext, :name, :slogan, :slug, :sort_order, :header_image

  has_many :posts

  has_attached_file :header_image, styles: { header: '920x250>', thumb: '350x108>' }, default_url: '/assets/default_header.png'

  validates :slug, uniqueness: true

  def to_param
    self.slug
  end
end
