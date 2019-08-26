FactoryBot.define do
  factory :user do
    nickname {"メルカリ太郎"}
    email {"mercari-taro@gmail.com"}
    password {"00000000"}
    password_confirmation {"00000000"}
    family_name {"山田"}
    first_name {"彩"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"アヤ"}
    birthday {"1999-09-09"}
    phone {"09012345678"}
  end
end
