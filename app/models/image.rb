class Image < ApplicationRecord
  belongs_to :product,optional: true
  mount_uploader :image_path, ImageUploader
end
