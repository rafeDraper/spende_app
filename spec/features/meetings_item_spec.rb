require 'rails_helper'

RSpec.feature 'MeetingsItems', type: :feature do
  scenario 'user creates a new MeetingList' do
    user = FactoryBot.create(:user, :admin)

    visit(root_path)
    click_link 'Anmelden'
    fill_in 'E-Mail',	with: user.email
    fill_in 'Passwort', with: user.password
    click_button 'Anmelden'

    expect do
      find('#container_link_list').click_link('Listen')
      find(click_link 'Neue Liste'

      expect(page).to have_content("Meeting list successfully created")
      expect(page).to have_content("Test List")
      expect(page).to have_content("angemeldet als: #{user.email}")
    end.to change(MeetingsList, :count).by(1)
  end
end
