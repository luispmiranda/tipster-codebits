class Category < ActiveRecord::Base

  #### Relations
  has_many :lists

  #### Accessors
  attr_accessible :name

end
