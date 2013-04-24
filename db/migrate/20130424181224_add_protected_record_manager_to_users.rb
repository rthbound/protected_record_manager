class AddProtectedRecordManagerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :protected_record_manager, :boolean
  end
end
