class AddCustomerReferenceToHires < ActiveRecord::Migration[7.0]
  def change
    add_reference :hires, :customer, null: false, foreign_key: true
  end
end
