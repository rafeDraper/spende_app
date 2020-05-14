describe "meetings_items/new.html.slim" do
  it 'displays the form' do
    render
    expect(rendered).to match(/Neue Eintrag/)
  end
end
