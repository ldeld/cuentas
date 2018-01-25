class CreateDebts < ActiveRecord::Migration[5.1]
  def change
    create_table :debts do |t|
      t.references :giver
      t.references :receiver
      t.float :amount
      t.text :description

      t.timestamps
    end
  end
end
