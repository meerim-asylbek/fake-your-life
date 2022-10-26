class AddArtistReferenceToHires < ActiveRecord::Migration[7.0]
  def change
    add_reference :hires, :artist, null: false, foreign_key: true
  end
end
