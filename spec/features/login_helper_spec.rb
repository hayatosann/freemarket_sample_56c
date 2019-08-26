require 'rails_helper'

feature 'login', type: :feature do
  let(:user) {FactoryBot.create(:user) }

  scenario 'login' do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in 'user[password]', with: user.password
    find('input[name = "commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ピックアップカテゴリー')
  end

  scenario 'registration' do
    visit new_user_session_path
    find('[name = "register"]').click
    expect(current_path).to eq new_user_registration_path
    expect(page).to have_content('新規会員登録')
  end

  scenario 'top' do
    visit new_user_session_path
    find('[name = "to_top"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ピックアップカテゴリー')
  end

end

feature 'loginerror', type: :feature do
  scenario 'loginerror' do
    visit new_user_session_path
    find('input[name = "commit"]').click
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('メールアドレスまたはパスワードが違います')   
  end

end
