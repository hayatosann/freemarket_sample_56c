FactoryBot.define do
  factory :product do
    name                     {"テスト品"}
    detail                   {"お気に入り"}
    size_id                  {1}
    brand                    {"シャネル"}
    condition_id             {1}
    delivery_fee_id          {1}
    shipping_method_id       {1}
    prefecture_from_id       {1}
    shipping_days_id         {1}
    price                    {300}
    category_id              {1}
    status                   {0}
    user_id                  {1}
  end
end