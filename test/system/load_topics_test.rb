require "application_system_test_case"

class LoadTopicsTest < ApplicationSystemTestCase
  setup do
    @load_topic = load_topics(:one)
  end

  test "visiting the index" do
    visit load_topics_url
    assert_selector "h1", text: "Load Topics"
  end

  test "creating a Load topic" do
    visit load_topics_url
    click_on "New Load Topic"

    fill_in "Description", with: @load_topic.description
    fill_in "Pin", with: @load_topic.pin
    click_on "Create Load topic"

    assert_text "Load topic was successfully created"
    click_on "Back"
  end

  test "updating a Load topic" do
    visit load_topics_url
    click_on "Edit", match: :first

    fill_in "Description", with: @load_topic.description
    fill_in "Pin", with: @load_topic.pin
    click_on "Update Load topic"

    assert_text "Load topic was successfully updated"
    click_on "Back"
  end

  test "destroying a Load topic" do
    visit load_topics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Load topic was successfully destroyed"
  end
end
