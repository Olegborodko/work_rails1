class UserPosition < ActiveRecord::Migration
  def up
  	add_column('users', 'position', :integer)
  end

  def down
  	rename_column('users', 'position', :integer)
  end
end
