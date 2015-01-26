class SecretWordAdd < ActiveRecord::Migration
  def up
  	add_column :users, :secret_word, :string
  end

  def down
  	remove_column :users, :secret_word, :string
  end
end
