class CreateProtectedRecordChangeLogRecords < ActiveRecord::Migration
  def change
    create_table :protected_record_change_log_records do |t|
      t.integer :user_id
      t.integer :recordable_id
      t.string  :recordable_type
      t.string  :observed_changes

      t.timestamps
    end
  end
end
