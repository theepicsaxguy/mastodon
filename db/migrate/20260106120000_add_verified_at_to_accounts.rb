# frozen_string_literal: true

class AddVerifiedAtToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :verified_at, :datetime
    add_index :accounts, :verified_at
  end
end
