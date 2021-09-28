class Article < ApplicationRecord
  audited

  VALID_FILE_EXTENSIONS = %w[.jpeg .jpg .png].freeze
  VALID_CONTENT_TYPE = %w[
    image/jpeg
    image/png
  ].freeze
  extend FriendlyId

  friendly_id :title, use: :slugged

  has_one_attached :featured_image
  has_one_attached :thumbnail_image

  validates :title, :description, :markdown, :featured_image, :thumbnail_image, presence: true

  validates :featured_image, :thumbnail_image, antivirus: true
  validate :image_file_ext_validation
  validates :featured_image, content_type: VALID_CONTENT_TYPE
  validates :thumbnail_image, content_type: VALID_CONTENT_TYPE

  def image_file_ext_validation
    if featured_image.attached?
      errors.add(:featured_image, :invalid_extension) if VALID_FILE_EXTENSIONS.none? { |extension| featured_image.blob.filename.to_s.downcase.end_with?(extension) }
    end
    if thumbnail_image.attached?
      errors.add(:thumbnail_image, :invalid_extension) if VALID_FILE_EXTENSIONS.none? { |extension| thumbnail_image.blob.filename.to_s.downcase.end_with?(extension) }
    end
  end
end
