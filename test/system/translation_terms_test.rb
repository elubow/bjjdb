require "application_system_test_case"

class TranslationTermsTest < ApplicationSystemTestCase
  setup do
    @translation_term = translation_terms(:one)
  end

  test "visiting the index" do
    visit translation_terms_url
    assert_selector "h1", text: "Translation Terms"
  end

  test "creating a Translation term" do
    visit translation_terms_url
    click_on "New Translation Term"

    click_on "Create Translation term"

    assert_text "Translation term was successfully created"
    click_on "Back"
  end

  test "updating a Translation term" do
    visit translation_terms_url
    click_on "Edit", match: :first

    click_on "Update Translation term"

    assert_text "Translation term was successfully updated"
    click_on "Back"
  end

  test "destroying a Translation term" do
    visit translation_terms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Translation term was successfully destroyed"
  end
end
