# For details on Sequel migrations see:
#   * http://sequel.rubyforge.org/
#   * http://sequel.rubyforge.org/rdoc-plugins/classes/Sequel/Migration.html

class UniversityMigration < Sequel::Migration

  def up
    create_table :universities do
      primary_key :id
      varchar     :name, :null => false
      boolean     :pensum
    end
  end

  def down
    drop_table :universities
  end

end
