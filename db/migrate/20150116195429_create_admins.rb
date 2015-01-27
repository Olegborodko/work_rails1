class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "information"
    t.string   "password_salt"
    t.string   "password_hash"
    t.integer  "role_id"
      t.timestamps
    end
  end
end
