require 'sqlite3'
require 'active_record'
if ARGV[0] == "test"
  require './test_connection'
else
  require './dev_connection'
end



class LoremMigration < ActiveRecord::Migration[5.0]

  def change
    create_table :lorems do |t|
      t.string  :type
      t.text    :body

      t.timestamps
    end
  end

end

LoremMigration.migrate(:up)
