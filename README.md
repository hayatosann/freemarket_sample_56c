# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|phone|integer|unique:true|
|image|string||
|profile|text||

### Association
- has_one :address, :card
- has_many :products, :comments, :purchases
- has_many :bought_plural, class_name: "Purchase",dependent: :destroy
- has_many :sold_plural, class_name: "Purchase", dependent: :destroy

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false, unique:true|
|city|string|null: false|
|block|string|null: false|
|building|string|null: true|
|sub_phone|string|null: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to active_hash :prefecture
- belongs_to :user, :prefecture

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
|expiration_date|date|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false|
|brand|string|
|condition_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|shipping_method_id|integer|null: false|
|prefecture_from_id|integer|null: false|
|shipping_days_id|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :category, foreign_key: true, null:false 
- has_many :images, :comments, :users through :comments
- belongs_to active_hash :size_id, condition_id, delivery_fee_id, shipping_method, prefecture_from, shipping_days

## purchasesテーブル

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

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|purchase_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :purchase
- belongs_to :user

### Association
- has_many :products

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: true|
|ancestry|integer|null: true, index: true|

### Association
- has_ancestry
- has_many :products