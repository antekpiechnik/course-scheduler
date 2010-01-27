# For details on Sequel migrations see:
#   * http://sequel.rubyforge.org/
#   * http://sequel.rubyforge.org/rdoc-plugins/classes/Sequel/Migration.html

class LectureMigration < Sequel::Migration

  def up
    create_table :lectures do
      primary_key :id
      foreign_key :degree_id, :degrees, :null => false
      varchar     :name, :null => false
      integer     :year
      text        :note
    end
  end

  def down
    drop_table :lectures
  end

end
