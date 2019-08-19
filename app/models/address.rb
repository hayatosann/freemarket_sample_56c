class Address < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  VALID_ADDRESS_REGEX = /\A\d{3}[-]\d{4}\z/
  validates :postal_code, presence: true, format: { with: VALID_ADDRESS_REGEX }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :sub_phone, presence: false
  VALID_SUB_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :sub_phone, format: { with: VALID_SUB_PHONE_REGEX }, if: :sub_phone_present
  validates :user_id, presence: true

  def valid_address?
    valid?
    excluded_columns = [:user, :sub_phone, :user_id]
    excluded_columns.each{|column| errors.delete(column)}
    errors.empty?
  end

  def sub_phone_present
    sub_phone.presence
  end
end
