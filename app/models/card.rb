class Card < ApplicationRecord
  belongs_to :user

  VALID_NUMBER_REGEX = /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})\z/
  validates :number, presence: true, format: { with: VALID_NUMBER_REGEX }
  validates :expiration_date, presence: true
  VALID_SC_REGEX = /\A\d{3,4}\z/
  validates :security_code, presence: true, format: { with: VALID_SC_REGEX }
  validates :user_id, presence: true
end
