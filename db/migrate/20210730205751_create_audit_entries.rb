# frozen_string_literal: true

class CreateAuditEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :audit_entries do |t|
      t.text :user, null: true
      t.text :resource, null: false
      t.jsonb :from, null: true
      t.jsonb :to, null: true

      t.timestamps
    end
    add_index :audit_entries, :user, name: "idx_audit_entries_user"
    add_index :audit_entries, :resource, name: "idx_audit_entries_resource"
    add_index :audit_entries, :created_at, name: "idx_audit_entries_created_at"
  end
end
