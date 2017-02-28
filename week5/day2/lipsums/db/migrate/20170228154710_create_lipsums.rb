class CreateLipsums < ActiveRecord::Migration[5.0]
  def change
    create_table :lipsums do |t|
      t.string :slug
      t.text :body

      t.timestamps
    end
  end
end
