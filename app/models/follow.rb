class Follow < ActiveRecord::Base
  
  #### Relations
  has_one :user, :class_name => 'Citygate::User'
  has_one :list

end
