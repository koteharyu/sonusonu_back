class Gournal < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :title, presence: true
  validates :content, presence: true

  has_one_attached :image

  def image_url
    image.attached? ? url_for(image) : nil
  end
end
