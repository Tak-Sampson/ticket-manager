class AddAssigneeToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :assignee_id, :integer, index: true
    add_foreign_key :tickets, :users, column: :assignee_id
  end
end
