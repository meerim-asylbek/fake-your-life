class AddCoordinatesToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :latitude, :float
    add_column :artists, :longitude, :float
  end
end
