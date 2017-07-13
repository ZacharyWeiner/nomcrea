class PortfolioItemAttachment < ApplicationRecord
  belongs_to :portfolio_item
  mount_uploader :attachement, AttachmentUploader
end
