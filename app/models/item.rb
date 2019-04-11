class Item < ApplicationRecord
  has_many :item_photos
  accepts_nested_attributes_for :item_photos, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }
end
