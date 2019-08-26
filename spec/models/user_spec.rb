require 'rails_helper'

describe User do
  describe '#create' do
    it "is invalid without a email" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = FactoryBot.build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = FactoryBot.build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "is invalid with a password less than 6 characters" do
      user = FactoryBot.build(:user, password: "a" * 5, password_confirmation: "a" * 5)
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "is valid with a password greater than 6 characaters" do
      user = FactoryBot.build(:user, password: "a" * 6, password_confirmation: "a" * 6)
      expect(user).to be_valid
    end

    it "is invalid with a differecnce between password and password_confirmation" do
      user = FactoryBot.build(:user, password: "foobar", password_confirmation: "barfoo")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "is invalid without a nickname" do
      user = FactoryBot.build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a family_name" do
      user = FactoryBot.build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid without a first_name" do
      user = FactoryBot.build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a family_name_kana" do
      user = FactoryBot.build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      user = FactoryBot.build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a birthday" do
      user = FactoryBot.build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "is invalid without a phone" do
      user = FactoryBot.build(:user, phone: "")
      user.valid?
      expect(user.errors[:phone]).to include("を入力してください")
    end

    it "is invalid with a phone of invalid format" do
      user = FactoryBot.build(:user, phone: "123456789012")
      user.valid?
      expect(user.errors[:phone]).to include("は不正な値です")
    end

    it "is valid without a image" do
      user = FactoryBot.build(:user, image: "")
      expect(user).to be_valid
    end

    it "is valid without a profile" do
      user = FactoryBot.build(:user, profile: "")
      expect(user).to be_valid
    end

    it "is valid without a uid" do
      user = FactoryBot.build(:user, uid: "")
      expect(user).to be_valid
    end

    it "is valid without a provider" do
      user = FactoryBot.build(:user, provider: "")
      expect(user).to be_valid
    end
  end
end