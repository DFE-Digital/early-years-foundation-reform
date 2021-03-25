class ContentAsset < ApplicationRecord
  VALID_FILE_EXTENSIONS = %w[.pdf .doc .docx .xls .xlsx .jpeg .jpg .png].freeze
  VALID_CONTENT_TYPE = %w[
    image/jpeg
    image/png
    application/pdf
    application/msword
    application/vnd.ms-excel
    application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
    application/vnd.openxmlformats-officedocument.wordprocessingml.document
  ].freeze

  has_one_attached :asset_file
  validates :title, presence: true
  validates :asset_file, presence: true
  validates :alt_text, presence: true
  validate :asset_file_ext_validation
  validates :asset_file, content_type: VALID_CONTENT_TYPE

  def asset_file_ext_validation
    return unless asset_file.attached?

    errors.add(:asset_file, :invalid_extension) if VALID_FILE_EXTENSIONS.none? { |extension| asset_file.blob.filename.to_s.downcase.end_with?(extension) }
  end
end
