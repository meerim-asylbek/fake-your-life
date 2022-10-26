class CreateHires < ActiveRecord::Migration[7.0]
  def change
    create_table :hires do |t|

      t.timestamps
    end
  end
end
