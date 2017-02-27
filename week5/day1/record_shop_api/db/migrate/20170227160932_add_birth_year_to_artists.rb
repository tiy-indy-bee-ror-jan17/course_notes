class AddBirthYearToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :birth_year, :integer
  end
end
