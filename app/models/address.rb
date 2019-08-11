class Address < ApplicationRecord
  belongs_to :user
  belongs_to active_hash :prefecture
end
