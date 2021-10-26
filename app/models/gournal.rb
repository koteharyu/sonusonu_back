class Gournal < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :title, presence: true
  validates :content, presence: true

  has_one_attached :image
  has_one_attached :author_image

  def image_url
    image.attached? ? url_for(image) : nil
  end

  def author_image_url
    author_image.attached? ? url_for(author_image) : nil
  end

  scope :recent, -> (count) { order(created_at: :desc).limit(count)}
end
