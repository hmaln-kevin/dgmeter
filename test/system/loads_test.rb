require "application_system_test_case"

class LoadsTest < ApplicationSystemTestCase
  setup do
    @load = loads(:one)
  end

  test "visiting the index" do
    visit loads_url
    assert_selector "h1", text: "Loads"
  end

  test "creating a Load" do
    visit loads_url
    click_on "New Load"

    fill_in "Description", with: @load.description
    fill_in "Schedule", with: @load.schedule
    check "State" if @load.state
    click_on "Create Load"

    assert_text "Load was successfully created"
    click_on "Back"
  end

  test "updating a Load" do
    visit loads_url
    click_on "Edit", match: :first

    fill_in "Description", with: @load.description
    fill_in "Schedule", with: @load.schedule
    check "State" if @load.state
    click_on "Update Load"

    assert_text "Load was successfully updated"
    click_on "Back"
  end

  test "destroying a Load" do
    visit loads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Load was successfully destroyed"
  end
end
