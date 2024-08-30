require "application_system_test_case"

class FlexTemplatesTest < ApplicationSystemTestCase
  setup do
    @flex_template = flex_templates(:one)
  end

  test "visiting the index" do
    visit flex_templates_url
    assert_selector "h1", text: "Flex Templates"
  end

  test "creating a Flex template" do
    visit flex_templates_url
    click_on "New Flex Template"

    fill_in "Body", with: @flex_template.body
    fill_in "Name", with: @flex_template.name
    click_on "Create Flex template"

    assert_text "Flex template was successfully created"
    click_on "Back"
  end

  test "updating a Flex template" do
    visit flex_templates_url
    click_on "Edit", match: :first

    fill_in "Body", with: @flex_template.body
    fill_in "Name", with: @flex_template.name
    click_on "Update Flex template"

    assert_text "Flex template was successfully updated"
    click_on "Back"
  end

  test "destroying a Flex template" do
    visit flex_templates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flex template was successfully destroyed"
  end
end
