class Tip < ActiveRecord::Base
  include PublicActivity::Model
  #include PublicActivity::StoreController
  tracked# :owner => proc { |controller, model| controller.current_user }

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
