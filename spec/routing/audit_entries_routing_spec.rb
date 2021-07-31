require "rails_helper"

RSpec.describe AuditEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/audit_entries").to route_to("audit_entries#index")
    end

    it "routes to #new" do
      expect(get: "/audit_entries/new").to route_to("audit_entries#new")
    end

    it "routes to #show" do
      expect(get: "/audit_entries/1").to route_to("audit_entries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/audit_entries/1/edit").to route_to("audit_entries#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/audit_entries").to route_to("audit_entries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/audit_entries/1").to route_to("audit_entries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/audit_entries/1").to route_to("audit_entries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/audit_entries/1").to route_to("audit_entries#destroy", id: "1")
    end
  end
end
