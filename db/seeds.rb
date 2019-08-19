require "csv"
#csvファイルの読み込み

# csvファイル作成時にブランド一覧サインであるア~ンの一文字と数字の一文字は削除済み
# name: row['name']  左側がデータベースカラム、右側がcsvファイルのカラム

# brand一覧
CSV.foreach('db/brand.csv', headers: true) do |row|
  Brand.create(
    name: row['name'],
  )
end

parent_element = []
children_element = []

parent_count = 0
children_count = 0

# 親カテゴリー
parent_category = CSV.read("db/parent_category.csv")
parent_category.each_with_index do |parent, index|
  parent = Category.create(name: parent[0])
  parent_element[index] = parent
end

# 子カテゴリー
children_category = CSV.read("db/child_category.csv")
children_category.each_with_index do |child,index|
  if child != []
    parent_data = parent_element[parent_count]
    children = parent_data.children.create(name: child[0]) 
    children_element[index] = children
  else
    parent_count += 1
  end
end

children_element = children_element.compact
# 配列からnilを消去

# 孫カテゴリー
grandchild_category = CSV.read("db/grandchild_category.csv")
grandchild_category.each_with_index do |grandchild,index|
  if grandchild != []
    children_data = children_element[children_count]
    children_data.children.create(name: grandchild[0])
  else
    children_count += 1
  end
end

# 本番環境では
# rake db:seed RAILS_ENV=production
