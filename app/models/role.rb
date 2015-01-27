class Role < ActiveRecord::Base
  attr_accessible :name, :admin_id

  has_one :admin
end
