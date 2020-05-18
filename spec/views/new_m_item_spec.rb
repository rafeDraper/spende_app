describe "meetings_items/new.html.slim" do
  xit 'displays the form' do
    render
    expect(rendered).to match(/Neuer Eintrag/)
  end
end
