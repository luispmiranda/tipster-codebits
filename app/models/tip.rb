class Tip < ActiveRecord::Base

  #### Relations
  belongs_to :list
  has_many :favorites

  has_many :favorites
  has_many :favoriters, :through => :follows, :source => :user, :class_name => 'Citygate::User'

  #### Accessors
  attr_accessible :content, :title

  #### Scopes
  scope :by_list, lambda { |list| where list_id: list.id }
end
