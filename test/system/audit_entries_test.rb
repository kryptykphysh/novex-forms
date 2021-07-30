require "application_system_test_case"

class AuditEntriesTest < ApplicationSystemTestCase
  setup do
    @audit_entry = audit_entries(:one)
  end

  test "visiting the index" do
    visit audit_entries_url
    assert_selector "h1", text: "Audit Entries"
  end

  test "creating a Audit entry" do
    visit audit_entries_url
    click_on "New Audit Entry"

    fill_in "From", with: @audit_entry.from
    fill_in "Resource", with: @audit_entry.resource
    fill_in "To", with: @audit_entry.to
    fill_in "User", with: @audit_entry.user
    click_on "Create Audit entry"

    assert_text "Audit entry was successfully created"
    click_on "Back"
  end

  test "updating a Audit entry" do
    visit audit_entries_url
    click_on "Edit", match: :first

    fill_in "From", with: @audit_entry.from
    fill_in "Resource", with: @audit_entry.resource
    fill_in "To", with: @audit_entry.to
    fill_in "User", with: @audit_entry.user
    click_on "Update Audit entry"

    assert_text "Audit entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Audit entry" do
    visit audit_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Audit entry was successfully destroyed"
  end
end
