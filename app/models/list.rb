class List < ActiveRecord::Base

  #### Relations
  belongs_to :user, :class_name => 'Citygate::User'
  has_many :tips
  belongs_to :category


  has_many :follows
  has_many :followers, :through => :follows, :class_name => 'Citygate::User'


  attr_accessible :category_id, :title
end
