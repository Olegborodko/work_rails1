class SecretWordSoltAndHash < ActiveRecord::Migration
  def up
  	add_column :users, :secret_word_salt, :string
  end

  def down
  	remove_column :users, :secret_word_salt, :string
  end
end
