class List < ActiveRecord::Base
  include PublicActivity::Model
  tracked :owner => proc { |controller, model| controller.current_user },
    :params => {
      author: proc { |controller, model| model.user.name_or_email },
      time:   proc { |controller, model| model.created_at },
      title:  proc { |controller, model| model.title }
    }

  #### Relations
  belongs_to :user, :class_name => 'Citygate::User'
  has_many :tips
  belongs_to :category


  has_many :favorites
  has_many :favoriters, :through => :favorites, :source => :user, :class_name => 'Citygate::User'


  attr_accessible :category_id, :title, :desc
end
