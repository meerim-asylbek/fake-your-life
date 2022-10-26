class AddCustomerReferenceToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :customer, null: false, foreign_key: true
  end
end
