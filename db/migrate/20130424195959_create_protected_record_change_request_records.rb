class CreateProtectedRecordChangeRequestRecords < ActiveRecord::Migration
  def change
    create_table :protected_record_change_request_records do |t|
      t.integer :user_id
      t.integer :recordable_id
      t.string  :recordable_type
      t.text    :requested_changes
      t.integer :closed_by_id

      t.timestamps
    end
  end
end
