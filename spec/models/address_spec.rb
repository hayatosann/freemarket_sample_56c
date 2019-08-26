require 'rails_helper'

describe Address do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '#create' do
    it "is invalid without a postal_code" do
      address = FactoryBot.build(:address, postal_code: '', user_id: @user.id)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "is invalid without a postal_code" do
      address = FactoryBot.build(:address, postal_code: '1234567', user_id: @user.id)
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end

    it "is invalid without a prefecture_id" do
      address = FactoryBot.build(:address, prefecture_id: nil, user_id: @user.id)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a city" do
      address = FactoryBot.build(:address, city: '', user_id: @user.id)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a block" do
      address = FactoryBot.build(:address, block: '', user_id: @user.id)
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end

    it "is valid without a building" do
      address = FactoryBot.build(:address, building: '', user_id: @user.id)
      expect(address).to be_valid 
    end

    it "is valid without a sub_phone" do
      address = FactoryBot.build(:address, sub_phone: '', user_id: @user.id)
      expect(address).to be_valid 
    end

    it "is invalid with a sub_phone of invalid format" do
      address = FactoryBot.build(:address, sub_phone: '123456789012', user_id: @user.id)
      address.valid?
      expect(address.errors[:sub_phone]).to include("は不正な値です")
    end
  end
end