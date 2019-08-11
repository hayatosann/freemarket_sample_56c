# README

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false, unique:true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|phone|integer|null: false, unique:true|
|image|string|null: false|
|profile|text|null: false|

### Association
- has_one :address, :card
- has_many :products, :comments, :purchases
- has_many :bought_plural, class_name: "Purchase",dependent: :destroy
- has_many :sold_plural, class_name: "Purchase", dependent: :destroy

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|integer|null: false, unique:true|
|city|string|null: false|
|block|string|null: false|
|building|string|null: true|
|sub_phone|integer|null: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to active_hash :prefecture
- belongs_to :user, :prefecture

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|expiration_date|date|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## Productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|large_category_id|integer|null: false, foreign_key: true|
|medium_category_id|integer|null: false, foreign_key: true|
|small_category_id|integer|null: true, foreign_key: true|
|size_id|integer|null: false|
|brand_id|integer|null: false|
|condition_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|shipping_method|integer|null: false|
|prefecture_from|integer|null: false|
|shipping_days|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user, :large_category, :medium_category, :small_category, optional: true, :brand optional: true
- has_many :images, :comments, :users through :comments
- belongs_to active_hash :size_id, brand_id, condition_id, delivery_fee_id, shipping_method, prefecture_from, shipping_days

## Purchaseテーブル

|Column|Type|Options|
|------|----|-------|
|buyer_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|postage_by|integer|null: false|
|status|integer|null: false|

### Association
- has_many :comments
- belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
- belongs_to :seller, class_name: "User", foreign_key: "seller_id"

## Imageテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product


## Commentテーブル

|Column|Type|Options|
|------|----|-------|
|purchase_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :purchase
- belongs_to :user