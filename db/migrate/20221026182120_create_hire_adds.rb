class CreateHireAdds < ActiveRecord::Migration[7.0]
  def change
    create_table :hire_adds do |t|

      t.timestamps
    end
  end
end
