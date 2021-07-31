require "rails_helper"

RSpec.describe "audit_entries/edit", type: :view do
  before(:each) do
    @audit_entry = assign(:audit_entry, AuditEntry.create!(
      user: "MyText",
      resource: "MyText",
      old: "",
      new: ""
    ))
  end

  it "renders the edit audit_entry form" do
    render

    assert_select "form[action=?][method=?]", audit_entry_path(@audit_entry), "post" do
      assert_select "textarea[name=?]", "audit_entry[user]"

      assert_select "textarea[name=?]", "audit_entry[resource]"

      assert_select "input[name=?]", "audit_entry[old]"

      assert_select "input[name=?]", "audit_entry[new]"
    end
  end
end
