feature 'Static Pages' do
  scenario 'Vist the Home Page' do
    visit root_path
    expect(page).to have_css('.initial_button')
    expect(page.has_css?('p.top', text: 'SpendeKollektor')).to eq(true)
    expect(page.title).to eq('Spende App | Home')
  end

  scenario 'Visit the Help Page' do
    visit static_pages_help_url
    expect(page.title).to eq('Spende App | Hilfe')
  end
end
