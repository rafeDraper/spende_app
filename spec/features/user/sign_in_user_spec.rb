feature 'Sign in', :devise do
  let(:user) { create(:user) }
  scenario 'user cannot sign in if not registered' do
    signin('example@example.com', 'password')
    expect(page).to have_content 'E-Mail oder Passwort ungültig.'
  end

  scenario 'user can sign in with valid credentials' do
    signin(user.email, user.password)
    expect(page).to have_content 'Erfolgreich angemeldet'
  end

  scenario 'user cannot sign in with invalid email' do
    signin('invalid@mail.com', user.password)
    expect(page).to have_content 'E-Mail oder Passwort ungültig.'
  end

  scenario 'user canont sign in with invalid password' do
    signin(user.email, 'invalidpass')
    expect(page).to have_content 'E-Mail oder Passwort ungültig.'
  end
end
