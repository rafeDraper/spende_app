require 'test_helper'

class MeetingsItemsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'should get meetings list new' do
    assert_response :success
    assert_select 'title', 'Spende App | New list'
  end

  test 'should get meetings list name' do
    assert_response :success
    assert_select 'title', "Spende App | #{@meetings_list.title}"
  end

end
