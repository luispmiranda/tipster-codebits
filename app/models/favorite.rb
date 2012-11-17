class Favorite < ActiveRecord::Base
  
  #### Relations
  belongs_to :user, :class_name => 'Citygate::User'
  belongs_to :favorited, :class_name => 'List', :foreign_key => :list_id

end
