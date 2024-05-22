class RenameStatusToStateInTickets < ActiveRecord::Migration[7.1]
  def change
    rename_column :tickets, :status, :state
  end
end
