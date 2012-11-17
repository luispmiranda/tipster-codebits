Citygate::User.class_eval do
  has_many :lists

  has_many :follows
  has_many :followings, :through => :follows, :source => :list

  has_many :favorites
  has_many :favorited, :through => :favorites, :source => :tip

end
