require "rails_helper"

RSpec.describe "audit_entries/show", type: :view do
  before(:each) do
    @audit_entry = assign(:audit_entry, AuditEntry.create!(
      user: "MyText",
      resource: "MyText",
      old: "",
      new: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
