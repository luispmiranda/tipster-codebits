Citygate::User.class_eval do
  has_many :lists

  has_many :follows
  has_many :followings, :through => :follows, :class_name => :list

  has_many :favorites
  has_many :favs, :through => :favorites, :class_name => :tips

end
