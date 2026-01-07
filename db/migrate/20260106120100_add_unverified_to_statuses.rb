# frozen_string_literal: true

class AddUnverifiedToStatuses < ActiveRecord::Migration[8.0]
  def change
    add_column :statuses, :unverified, :boolean, default: false, null: false
    add_index :statuses, [:account_id, :unverified]
  end
end
