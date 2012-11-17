class Follow < ActiveRecord::Base
  
  #### Relations
  belongs_to :user, :class_name => 'Citygate::User'
  belongs_to :followed, :class_name => 'Citygate::User'


  attr_accessible :user_id, :followed_id

end
