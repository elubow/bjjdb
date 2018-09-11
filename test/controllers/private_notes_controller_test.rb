require 'test_helper'

class PrivateNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @private_note = private_notes(:one)
  end

  test "should get index" do
    get private_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_private_note_url
    assert_response :success
  end

  test "should create private_note" do
    assert_difference('PrivateNote.count') do
      post private_notes_url, params: { private_note: { body: @private_note.body, link_id: @private_note.link_id, title: @private_note.title, user_id: @private_note.user_id } }
    end

    assert_redirected_to private_note_url(PrivateNote.last)
  end

  test "should show private_note" do
    get private_note_url(@private_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_private_note_url(@private_note)
    assert_response :success
  end

  test "should update private_note" do
    patch private_note_url(@private_note), params: { private_note: { body: @private_note.body, link_id: @private_note.link_id, title: @private_note.title, user_id: @private_note.user_id } }
    assert_redirected_to private_note_url(@private_note)
  end

  test "should destroy private_note" do
    assert_difference('PrivateNote.count', -1) do
      delete private_note_url(@private_note)
    end

    assert_redirected_to private_notes_url
  end
end
