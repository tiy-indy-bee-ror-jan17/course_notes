require 'sqlite3'
require 'active_record'
if ARGV[0] == "test"
  require './test_connection'
else
  require './dev_connection'
end

class ChangeTypeColumn < ActiveRecord::Migration[5.0]

  def change
    rename_column :lorems, :type, :title
  end

end

ChangeTypeColumn.migrate(:up)
