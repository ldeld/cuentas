class AddDescriptionToFacturas < ActiveRecord::Migration[5.1]
  def change
    add_column :facturas, :description, :string
  end
end
