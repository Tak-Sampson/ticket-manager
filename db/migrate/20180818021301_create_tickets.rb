class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :body
      t.integer :status, default: 0
      t.integer :project_id
      t.timestamps
    end
  end
end
