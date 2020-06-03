feature 'User index page', :devise do
  scenario 'user sees own email address' do
    user = FactoryBot.build(:user, :admin)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content(user.email)
  end

  scenario 'user is not an administrator' do
    user = FactoryBot.build(:user)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_text('Benutzer ist nicht Autorisiert')
  end
end
