class CreateAuditEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :audit_entries do |t|
      t.text :user, null: false
      t.text :resource, null: false
      t.jsonb :old_data, null: true
      t.jsonb :new_data, null: true

      t.timestamps
    end
    add_index :audit_entries, :created_at, name: "idx_audit_entries_created_at"
    add_index :audit_entries, :resource, name: "idx_audit_entries_resource"
    add_index :audit_entries, :user, name: "idx_audit_entries_user"
    add_index :audit_entries,
      :new_data,
      name: "idx_audit_entries_new_data",
      using: :gin
    add_index :audit_entries,
      :old_data,
      name: "idx_audit_entries_old_data",
      using: :gin
  end
end
