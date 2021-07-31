require "rails_helper"

RSpec.describe "audit_entries/new", type: :view do
  before(:each) do
    assign(:audit_entry, AuditEntry.new(
      user: "MyText",
      resource: "MyText",
      old: "",
      new: ""
    ))
  end

  it "renders new audit_entry form" do
    render

    assert_select "form[action=?][method=?]", audit_entries_path, "post" do
      assert_select "textarea[name=?]", "audit_entry[user]"

      assert_select "textarea[name=?]", "audit_entry[resource]"

      assert_select "input[name=?]", "audit_entry[old]"

      assert_select "input[name=?]", "audit_entry[new]"
    end
  end
end
