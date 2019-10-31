# README
# URL http://3.113.50.33/
# Explanation
- [チーム開発]
  - フリーマーケットアプリケーションである「メルカリ」のコピーサイトを作成しました
- 開発環境
  - ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
- 開発期間と平均作業時間
  - 開発期間：4週間
  - 1日あたりの平均作業時間：10時間
- 開発体制
  - 人数：5人
  - アジャイル型開発（スクラム）
  - Trelloによるタスク管理

## 【担当箇所】
- マークアップ
  - 商品詳細ページ
  - 商品購入ページ
- サーバーサイド 
  - 商品詳細ページ
  - 商品購入ページにおけるpay.jpを用いたクレジット決済実装
  - カテゴリー機能における初期データの採取とデータベースへの反映
  - ブランドデータの採取
  - 各viewにおける遷移先の設定
  - 商品modelのテスト

## Basic認証
  - ID/Pass
  - ID: hoge
  - Pass: huga
## 購入者用
  - メールアドレス:  buyer@gmail.com
  - パスワード: hugahuga
## 購入用カード情報
  - 番号：4242424242424242
  - 期限：12/21
  - ユーザー名：test_buyer
  - セキュリティコード：123
  - 出品者用
  - メールアドレス名: seller@gmail.com
  - パスワード: hugahuga


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
|security_code|string|null: false|
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
|status|integer|null: false|
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

### Note
- status -> 0: 未売却, 1: 売却済

## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|buyer_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
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
