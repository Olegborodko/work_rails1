class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id
    	t.string :avatar
    	t.text :full_detail
      t.timestamps
    end
  end
end
