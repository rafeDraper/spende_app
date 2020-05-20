module Features
  module SessionHelpers
    def signin(email, password)
      visit new_user_session_path
      fill_in 'E-Mail', with: email
      fill_in 'Passwort', with: password
      click_button('Anmelden')
    end
  end
end
