class ChangePriceToString < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :string
  end
end
