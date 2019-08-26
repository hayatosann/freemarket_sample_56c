FactoryBot.define do

  factory :address do
    postal_code {"123-4567"}
    prefecture_id {1}
    city {"横浜市緑区"}
    block {"青山1-1-1"}
    building {"柳ビル103"}
    sub_phone {"09012345678"}
  end

end