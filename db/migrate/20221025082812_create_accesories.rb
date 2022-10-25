class CreateAccesories < ActiveRecord::Migration[7.0]
  def change
    create_table :accesories do |t|
      t.string :picture_ul
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
