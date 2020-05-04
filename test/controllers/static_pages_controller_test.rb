require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get help' do
    get static_pages_help_url
    assert_response :success
    assert_select 'title', 'Spende App Hilfe'
  end

  test 'should get contact' do
    get static_pages_contact_url
    assert_response :success
    assert_select 'title', 'Spende App Kontakt'
  end
end
