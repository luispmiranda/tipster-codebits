class Category < ActiveRecord::Base

  #### Relations
  has_many :lists

  #### Accessors
  attr_accessor :name

end
