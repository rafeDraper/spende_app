feature 'User edits the data on his profile' do

  before(:example) do
    @user = create(:user)
  end
  
  scenario 'user gets an updated message' do
    login_as(@user)
    visit(users_edit_path)
    fill_in 'E-Mail',	with: @user.email
    fill_in 'Passwort',	with: "teporingos2020"
    fill_in 'Passwortbestätigung',	with: "teporingos2020"
    fill_in 'Bisheriges Passwort', with: @user.password
    click_button 'Aktualisierung'
    expect(page).to have_text('Deine Daten wurden aktualisiert')
  end
end
