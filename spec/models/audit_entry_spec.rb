# == Schema Information
#
# Table name: audit_entries
#
#  id         :bigint           not null, primary key
#  new_data   :jsonb
#  old_data   :jsonb
#  resource   :text             not null
#  user       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  idx_audit_entries_created_at  (created_at)
#  idx_audit_entries_new_data    (new_data) USING gin
#  idx_audit_entries_old_data    (old_data) USING gin
#  idx_audit_entries_resource    (resource)
#  idx_audit_entries_user        (user)
#
require "rails_helper"

RSpec.describe AuditEntry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
