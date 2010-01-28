# For details on Sequel migrations see:
#   * http://sequel.rubyforge.org/
#   * http://sequel.rubyforge.org/rdoc-plugins/classes/Sequel/Migration.html

class LectureClassMigration < Sequel::Migration

  def up
    create_table :lecture_classes do
      primary_key :id
      foreign_key :lecture_id, :lectures, :null => false
      foreign_key :lecture_type_id, :lecture_types, :null => false
      integer     :billing_hours, :null => false
      integer     :class_hours, :null => false
      integer     :total_hours, :null => false
      varchar     :semester, :null => false
    end
  end

  def down
    drop_table :lecture_classes
  end

end
