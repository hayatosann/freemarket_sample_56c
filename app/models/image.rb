class Image < ApplicationRecord
  belongs_to :product,optional: true
  mount_uploader :images, ImageUploader
end
