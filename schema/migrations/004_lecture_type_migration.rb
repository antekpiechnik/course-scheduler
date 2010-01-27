# For details on Sequel migrations see:
#   * http://sequel.rubyforge.org/
#   * http://sequel.rubyforge.org/rdoc-plugins/classes/Sequel/Migration.html

class LectureTypeMigration < Sequel::Migration

  def up
    create_table :lecture_types do
      primary_key :id
      varchar     :name, :null => false
      integer     :multiplier
    end
  end

  def down
    drop_table :lecture_types
  end

end
