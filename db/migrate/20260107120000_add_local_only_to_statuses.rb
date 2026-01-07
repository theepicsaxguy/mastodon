# frozen_string_literal: true

class AddLocalOnlyToStatuses < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def change
    add_column :statuses, :local_only, :boolean, default: false, null: false
    add_index :statuses, :local_only, algorithm: :concurrently
  end
end
