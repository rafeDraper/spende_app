RSpec.feature 'MeetingsList', type: :feature do
  scenario 'user creates a new MeetingList' do
    user = FactoryBot.create(:user, :admin)
    meeting = FactoryBot.create(:meetings_list)

    visit(root_path)
    click_link 'Anmelden'
    fill_in 'E-Mail',	with: user.email
    fill_in 'Passwort', with: user.password
    click_button 'Anmelden'

    expect do
      find('#container_link_list').click_link('Listen')
      click_link('Neue Liste')
      fill_in 'meetings_list_title',	with: meeting.title
      fill_in 'meetings_list_responsible', with: meeting.responsible
      click_button('Erstellen')
      expect(page).to have_content('Die Meeting-Liste wurde erfolgreich erstellt.')
      expect(page).to have_content(meeting.title)
      expect(page).to have_content("Angemeldet als: #{user.email}")
    end.to change(MeetingsList, :count).by(1)
  end
end
