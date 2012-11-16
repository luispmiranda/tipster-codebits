class Tip < ActiveRecord::Base

  #### Relations
  belongs_to :list

  #### Accessors
  attr_accessible :content, :title

  #### Scopes
  scope :by_list, lambda { |list| where list_id: list.id }
end
