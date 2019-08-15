class Image < ApplicationRecord
  belongs_to :product,optional: true
<<<<<<< Updated upstream
  mount_uploader :image_path, ImageUploader
=======
  mount_uploader :images, ImageUploader
>>>>>>> Stashed changes
end
