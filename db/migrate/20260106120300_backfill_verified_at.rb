# frozen_string_literal: true

class BackfillVerifiedAt < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def up
    say_with_time 'Backfilling accounts.verified_at for existing local accounts' do
      Account.where(verified_at: nil, domain: nil).in_batches.update_all(verified_at: Arel.sql('COALESCE(reviewed_at, created_at, NOW())'))
    end
  end

  def down
    # No-op: keep existing verification timestamps
  end
end
