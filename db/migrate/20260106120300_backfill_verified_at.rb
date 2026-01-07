# frozen_string_literal: true

class BackfillVerifiedAt < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def change
    reversible do |dir|
      dir.up do
        say_with_time 'Backfilling accounts.verified_at for existing local accounts' do
          Account.where(verified_at: nil, domain: nil).find_in_batches do |batch|
            Account.where(id: batch.map(&:id)).update_all(verified_at: Time.current)
          end
        end
      end
    end
  end
end
