class ChangeGiverColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :debts, :giver_id ,:payer_id
  end
end
