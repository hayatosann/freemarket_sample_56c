require 'rails_helper'

feature 'logout', type: :feature do
  let(:user) {FactoryBot.create(:user) }

  scenario 'logout' do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in 'user[password]', with: user.password
    find('input[name = "commit"]').click
    visit users_sign_out_path
    find('[name = "bye"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ピックアップカテゴリー')
  end

end
