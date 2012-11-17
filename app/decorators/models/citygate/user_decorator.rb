Citygate::User.class_eval do
  has_many :lists

  has_many :follows
  has_many :followeds, :through => :follows
  has_many :followers, :through => :follows, :source => :user

  has_many :favorites
  has_many :favorited, :through => :favorites

end
