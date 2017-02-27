class AddArtistIdToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_reference :albums, :artist, foreign_key: true
  end
end
