class Post < ActiveRecord::Base
  attr_accessible :category_id, :full_text, :intro, :published_at, :simple_text, :status, :title, :user_id, :teaser_image

  after_save :generate_audio

  belongs_to :category
  belongs_to :user

  has_attached_file :teaser_image, styles: { thumb: '150x250>' }

  scope :published, lambda { {:conditions => ["published_at <= ?", Time.zone.now], order: 'published_at DESC' } }

  def generate_audio
    return if Rails.env != 'production'

    flags = []

    flags << :intro if self.intro_changed?
    flags << :full if self.full_text_changed?
    flags << :simple if self.simple_text_changed?

    unless flags.empty?
      VoiceWorker.perform_async(self.id, flags)
    end
  end
end
