class CreateAdds < ActiveRecord::Migration[7.0]
  def change
    create_table :adds do |t|
      t.string :name
      t.string :category
      t.string :picture_url

      t.timestamps
    end
  end
end
