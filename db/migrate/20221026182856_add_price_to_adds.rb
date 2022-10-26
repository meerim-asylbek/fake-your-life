class AddPriceToAdds < ActiveRecord::Migration[7.0]
  def change
    add_column :adds, :price, :integer
  end
end
