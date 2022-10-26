class AddColumnsToHires < ActiveRecord::Migration[7.0]
  def change
    add_column :hires, :total_price, :integer
    add_column :hires, :start_date, :date
    add_column :hires, :end_date, :date
  end
end
