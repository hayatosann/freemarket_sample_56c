require 'rails_helper'

describe Address do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '#create' do
    it "is invalid without a number" do
      card = FactoryBot.build(:card, number: '', user_id: @user.id)
      card.valid?
      expect(card.errors[:number]).to include("を入力してください")
    end

    it "is invalid without a expiration_date" do
      card = FactoryBot.build(:card, expiration_date: '', user_id: @user.id)
      card.valid?
      expect(card.errors[:expiration_date]).to include("を入力してください")
    end

    it "is invalid without a security_code" do
      card = FactoryBot.build(:card, security_code: nil, user_id: @user.id)
      card.valid?
      expect(card.errors[:security_code]).to include("を入力してください")
    end

    it "is invalid with a security_code of invalid format" do
      card = FactoryBot.build(:card, security_code: "12345", user_id: @user.id)
      card.valid?
      expect(card.errors[:security_code]).to include("は不正な値です")
    end

    it "is valid with a security_code of valid format" do
      card = FactoryBot.build(:card, security_code: "123", user_id: @user.id)
      expect(card).to be_valid
    end
  end
end