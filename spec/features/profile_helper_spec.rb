require 'rails_helper'

feature 'profile', type: :feature do
  let(:user) {FactoryBot.create(:user) }

  background do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in 'user[password]', with: user.password
    find('input[name = "commit"]').click
  end

  scenario 'profile' do
    visit users_mypage_path
    find('[name="prof"]').click
    expect(current_path).to eq user_path(user.id)
    fill_in "user[profile]", with: "hogehoge"
    fill_in 'user[nickname]', with: "hugahuga"
    find('input[name = "confirm"]').click
    expect(page).to have_content('登録しました')
  end

end


