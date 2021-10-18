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

  validates :title, :description, :markdown, :featured_image, :thumbnail_image, :featured_alt_text, :thumbnail_alt_text, presence: true

  validate :image_file_ext_validation
  validates :featured_image, :thumbnail_image, content_type: VALID_CONTENT_TYPE, antivirus: true

  enum status: {
    draft: "draft",
    published: "published",
    unpublished: "unpublished",
  }, _default: "draft"

  def image_file_ext_validation
    if featured_image.attached? && VALID_FILE_EXTENSIONS.none? { |extension| featured_image.blob.filename.to_s.downcase.end_with?(extension) }
      errors.add(:featured_image, :invalid_extension)
    end
    if thumbnail_image.attached? && VALID_FILE_EXTENSIONS.none? { |extension| thumbnail_image.blob.filename.to_s.downcase.end_with?(extension) }
      errors.add(:thumbnail_image, :invalid_extension)
    end
  end
end
