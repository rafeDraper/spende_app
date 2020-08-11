RSpec.feature 'ChangeUserRoles', type: :feature do
  scenario 'Administrator changes the role of a user' do
    admin = FactoryBot.create(:user, :admin)
    user = FactoryBot.create(:user)

    login_as(admin)
    visit(users_path)
    within '#edit_user_2' do
      select('Editor', from: 'user_role')
      click_button('Change Role')
    end

    expect do
      expect(page).to have_content('Benutzer erfolgreich aktualisiert')
    end
  end
end
