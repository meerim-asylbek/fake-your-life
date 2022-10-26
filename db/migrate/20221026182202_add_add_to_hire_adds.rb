class AddAddToHireAdds < ActiveRecord::Migration[7.0]
  def change
    add_reference :hire_adds, :add, null: false, foreign_key: true
  end
end
