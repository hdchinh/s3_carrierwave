class ItemPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :item
end
