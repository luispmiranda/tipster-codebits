class Favorite < ActiveRecord::Base
  
  #### Relations
  belongs_to :user, :class_name => 'Citygate::User'
  belongs_to :list

end
