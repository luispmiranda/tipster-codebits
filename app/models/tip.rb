class Tip < ActiveRecord::Base

  #### Relations
  belongs_to :list

  #### Accessors
  attr_accessible :content, :title
end
