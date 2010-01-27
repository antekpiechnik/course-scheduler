# For details on Sequel migrations see:
#   * http://sequel.rubyforge.org/
#   * http://sequel.rubyforge.org/rdoc-plugins/classes/Sequel/Migration.html

class DegreeMigration < Sequel::Migration

  def up
    create_table :degrees do
      primary_key :id
      foreign_key :university_id, :universities
      varchar     :name, :null => false
      boolean     :it
    end
  end

  def down
    drop_table :degrees
  end

end
