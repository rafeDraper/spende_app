feature 'User index page', :devise do
  scenario 'user sees own email address' do
    user = FactoryBot.create(:user, :admin)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content(user.email)
  end
end
