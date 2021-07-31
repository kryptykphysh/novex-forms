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
class AuditEntry < ApplicationRecord
  validates :user, presence: true
  validates :resource, presence: true

  after_create_commit { broadcast_prepend_to "audit_entries" }
  after_update_commit { broadcast_replace_to "audit_entries" }
  after_destroy_commit { broadcast_remove_to "audit_entries" }
end
