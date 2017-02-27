class AddAlbumsCountToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :albums_count, :integer
  end
end
