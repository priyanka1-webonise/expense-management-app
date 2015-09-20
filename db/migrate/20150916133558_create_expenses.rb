class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :description
      t.integer :amount
      t.integer :paid_by
      t.references :group

      t.timestamps null: false
    end
    add_index :expenses, :group_id
  end
end
