crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_mypage_path
  parent :root
end

crumb :sign_out do
  link "ログアウト", users_sign_out_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", users_mypage_identification_path
  parent :mypage
end

crumb :credit_confirmation do
  link "本人情報の登録", users_credit_confirmation_path
  parent :mypage
end

crumb :edit_profile do
  link "プロフィール", user_path
  parent :mypage
end