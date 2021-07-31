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
FactoryBot.define do
  factory :audit_entry do
    user { "user" }
    resource { "resource" }
    old_data { {data: "old"} }
    new_data { {data: "new"} }
  end
end
