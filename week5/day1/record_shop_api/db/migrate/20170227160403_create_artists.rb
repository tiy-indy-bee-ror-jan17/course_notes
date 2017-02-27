class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :representation
      t.string :hometown

      t.timestamps
    end
  end
end
