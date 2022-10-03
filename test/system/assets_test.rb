require "application_system_test_case"

class AssetsTest < ApplicationSystemTestCase
  setup do
    @asset = assets(:one)
  end

  test "visiting the index" do
    visit assets_url
    assert_selector "h1", text: "Assets"
  end

  test "creating a Asset" do
    visit assets_url
    click_on "New Asset"

    fill_in "Condition score", with: @asset.condition_score
    fill_in "Description", with: @asset.description
    fill_in "Name", with: @asset.name
    fill_in "Purchase date", with: @asset.purchase_date
    fill_in "Purchase type", with: @asset.purchase_type
    fill_in "Purchased from", with: @asset.purchased_from
    fill_in "Serial number", with: @asset.serial_number
    click_on "Create Asset"

    assert_text "Asset was successfully created"
    click_on "Back"
  end

  test "updating a Asset" do
    visit assets_url
    click_on "Edit", match: :first

    fill_in "Condition score", with: @asset.condition_score
    fill_in "Description", with: @asset.description
    fill_in "Name", with: @asset.name
    fill_in "Purchase date", with: @asset.purchase_date
    fill_in "Purchase type", with: @asset.purchase_type
    fill_in "Purchased from", with: @asset.purchased_from
    fill_in "Serial number", with: @asset.serial_number
    click_on "Update Asset"

    assert_text "Asset was successfully updated"
    click_on "Back"
  end

  test "destroying a Asset" do
    visit assets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Asset was successfully destroyed"
  end
end
