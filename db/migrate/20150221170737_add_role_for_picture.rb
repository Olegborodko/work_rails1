class AddRoleForPicture < ActiveRecord::Migration
  def change

  	add_column 'pictures', 'user_type', :string
  end
end
