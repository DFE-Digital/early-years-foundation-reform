# Even the author of this Cop thinks it is too restrictive
# https://github.com/rubocop/rubocop-rails/issues/110
# It would make the migration harder to read and longer
# rubocop:disable Rails/BulkChangeTable
#
class AddDeviceLockable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :failed_attempts, :integer, default: 0
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
  end
end

# rubocop:enable Rails/BulkChangeTable
