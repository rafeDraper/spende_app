feature 'User edits the data on his profile' do
  scenario 'user gets an updated message' do
    visit(users_edit_path)
    click_button('Aktualisierung')
    expect(page).to have_css('benutzer ...')
  end
end
