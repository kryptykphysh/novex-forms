require "rails_helper"

RSpec.describe "audit_entries/index", type: :view do
  before(:each) do
    assign(:audit_entries, [
      AuditEntry.create!(
        user: "MyText",
        resource: "MyText",
        old: "",
        new: ""
      ),
      AuditEntry.create!(
        user: "MyText",
        resource: "MyText",
        old: "",
        new: ""
      )
    ])
  end

  it "renders a list of audit_entries" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
