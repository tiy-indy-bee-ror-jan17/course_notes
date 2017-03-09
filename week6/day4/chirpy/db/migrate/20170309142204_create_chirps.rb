class CreateChirps < ActiveRecord::Migration[5.0]
  def change
    create_table :chirps do |t|
      t.references :user, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
