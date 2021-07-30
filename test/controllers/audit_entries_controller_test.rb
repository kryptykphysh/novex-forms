require "test_helper"

class AuditEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audit_entry = audit_entries(:one)
  end

  test "should get index" do
    get audit_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_audit_entry_url
    assert_response :success
  end

  test "should create audit_entry" do
    assert_difference("AuditEntry.count") do
      post audit_entries_url, params: {audit_entry: {from: @audit_entry.from, resource: @audit_entry.resource, to: @audit_entry.to, user: @audit_entry.user}}
    end

    assert_redirected_to audit_entry_url(AuditEntry.last)
  end

  test "should show audit_entry" do
    get audit_entry_url(@audit_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_audit_entry_url(@audit_entry)
    assert_response :success
  end

  test "should update audit_entry" do
    patch audit_entry_url(@audit_entry), params: {audit_entry: {from: @audit_entry.from, resource: @audit_entry.resource, to: @audit_entry.to, user: @audit_entry.user}}
    assert_redirected_to audit_entry_url(@audit_entry)
  end

  test "should destroy audit_entry" do
    assert_difference("AuditEntry.count", -1) do
      delete audit_entry_url(@audit_entry)
    end

    assert_redirected_to audit_entries_url
  end
end
