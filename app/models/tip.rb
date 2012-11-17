class Tip < ActiveRecord::Base
  include PublicActivity::Model
  tracked :owner => proc { |controller, model| controller.current_user },
    :params => {
      author: proc { |controller, model| model.list.user.name_or_email },
      time:   proc { |controller, model| model.created_at },
      list:   proc { |controller, model| model.list.title },
      title:  proc { |controller, model| model.title }
    }

  #### Relations
  belongs_to :list
  has_many :favorites

  has_many :favorites
  has_many :favoriters, :through => :follows, :source => :user, :class_name => 'Citygate::User'

  #### Accessors
  attr_accessible :content, :title

  #### Scopes
  scope :by_list, lambda { |list| where list_id: list.id }
  scope :by_follower, lambda { |user| joins(:list => :follows).where("follows.user_id == #{user.id}").order('tips.updated_at ASC').limit(10) }
end
