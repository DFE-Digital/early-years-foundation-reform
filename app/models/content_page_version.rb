class ContentPageVersion < ApplicationRecord
  audited

  belongs_to :content_page
end
