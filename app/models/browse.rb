class Browse < ApplicationRecord
  self.inheritance_column = nil
  mount_uploader :attachment, AttachmentUploader
  belongs_to :admin
  has_many :comments, dependent: :destroy
end
