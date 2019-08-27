require 'rails_helper'
describe Product do

  describe '#create' do
    it "is invalid without a name" do
      product = FactoryBot.build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a detail" do
      product = FactoryBot.build(:product, detail: "")
      product.valid?
      expect(product.errors[:detail]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      product = FactoryBot.build(:product, category_id:"" )
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without a size_id" do
      product = FactoryBot.build(:product, size_id:"" )
      product.valid?
      expect(product.errors[:size_id]).to include("を入力してください")
    end

    it "is invalid without a condition_id" do
      product = FactoryBot.build(:product, condition_id:"" )
      product.valid?
      expect(product.errors[:condition_id]).to include("を入力してください")
    end

    it "is invalid without a delivery_fee_id" do
      product = FactoryBot.build(:product, delivery_fee_id:"" )
      product.valid?
      expect(product.errors[:delivery_fee_id]).to include("を入力してください")
    end

    it "is invalid without a shipping_method_id" do
      product = FactoryBot.build(:product, shipping_method_id:"" )
      product.valid?
      expect(product.errors[:shipping_method_id]).to include("を入力してください")
    end

    it "is invalid without a prefecture_from_id" do
      product = FactoryBot.build(:product, prefecture_from_id:"" )
      product.valid?
      expect(product.errors[:prefecture_from_id]).to include("を入力してください")
    end

    it "is invalid without a shipping_days_id" do
      product = FactoryBot.build(:product, shipping_days_id:"" )
      product.valid?
      expect(product.errors[:shipping_days_id]).to include("を入力してください")
    end

    it "is invalid without a price" do
      product = FactoryBot.build(:product, price:"" )
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      product = FactoryBot.build(:product, user_id:"" )
      product.valid?
      expect(product.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid without status" do
      product = FactoryBot.build(:product, status:"" )
      product.valid?
      expect(product.errors[:status]).to include("を入力してください")
    end

    it "is invalid with a name that has more than 40 characters " do
      product = FactoryBot.build(:product, name: "a" * 41)
      product.valid?
      expect(product.errors[:name][0]).to include("は40文字以内で入力してください")
    end

    it "is valid with a name that has less than 40 characters " do
      @category = FactoryBot.create(:category)
      @user = FactoryBot.create(:user)
      product = FactoryBot.build(:product, name: "a" * 40, category_id: @category.id, user_id: @user.id)
      expect(product).to be_valid
    end

    it "is invalid with a detail that has more than 1000 characters " do
      product = FactoryBot.build(:product, detail: "a" * 1001)
      product.valid?
      expect(product.errors[:detail][0]).to include("は1000文字以内で入力してください")
    end

    it "is valid with a name that has less than 1000 characters " do
      @category = FactoryBot.create(:category)
      @user = FactoryBot.create(:user)
      product = FactoryBot.build(:product, detail: "a" * 1000, category_id: @category.id, user_id: @user.id)
      expect(product).to be_valid
    end

    it "is invalid with a price that has more than 300 characters" do
      product = FactoryBot.build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end

    it "is valid with a price that has less than 300 characters " do
      @category = FactoryBot.create(:category)
      @user = FactoryBot.create(:user)
      product = FactoryBot.build(:product, price: 300, category_id: @category.id, user_id: @user.id)
      expect(product).to be_valid
    end

    it "is invalid with a price that has more than 300 characters" do
      product = FactoryBot.build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end
    
    it "is valid with a price that has less than 300 characters " do
      @category = FactoryBot.create(:category)
      @user = FactoryBot.create(:user)
      product = FactoryBot.build(:product, price: 9999999, category_id: @category.id, user_id: @user.id)
      expect(product).to be_valid
    end
    

  end
end
