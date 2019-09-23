require 'test_helper'

class MeetingsListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meetings_list = meetings_lists(:one)
  end

  test "should get index" do
    get meetings_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_meetings_list_url
    assert_response :success
  end

  test "should create meetings_list" do
    assert_difference('MeetingsList.count') do
      post meetings_lists_url, params: { meetings_list: { responsible: @meetings_list.responsible, title: @meetings_list.title } }
    end

    assert_redirected_to meetings_list_url(MeetingsList.last)
  end

  test "should show meetings_list" do
    get meetings_list_url(@meetings_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_meetings_list_url(@meetings_list)
    assert_response :success
  end

  test "should update meetings_list" do
    patch meetings_list_url(@meetings_list), params: { meetings_list: { responsible: @meetings_list.responsible, title: @meetings_list.title } }
    assert_redirected_to meetings_list_url(@meetings_list)
  end

  test "should destroy meetings_list" do
    assert_difference('MeetingsList.count', -1) do
      delete meetings_list_url(@meetings_list)
    end

    assert_redirected_to meetings_lists_url
  end
end
