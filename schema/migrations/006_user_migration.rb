# For details on Sequel migrations see:
#   * http://sequel.rubyforge.org/
#   * http://sequel.rubyforge.org/rdoc-plugins/classes/Sequel/Migration.html

class UserMigration < Sequel::Migration
  def up
    create_table :users do
      primary_key :id
      varchar     :login, :null => false
      varchar     :crypted_password
      varchar     :salt
    end
  end

  def down
    drop_table :users
  end
end
