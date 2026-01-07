# frozen_string_literal: true

class AddVerifiedAtToAccounts < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def change
    add_column :accounts, :verified_at, :datetime, null: true
    add_index :accounts, :verified_at, algorithm: :concurrently
  end
end
