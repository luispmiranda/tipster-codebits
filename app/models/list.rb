class List < ActiveRecord::Base

  #### Relations
  belongs_to :user, class_name: 'Citygate::User'
  belongs_to :category
  has_many :tips

  #### Accessors
  attr_accessible :title
end
