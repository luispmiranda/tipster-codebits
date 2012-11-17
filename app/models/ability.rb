class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Citygate::User.new

    can :read, :all

    if user.persisted?
      can :profile, Citygate::User
      can :manage, Citygate::User, id: user.id
      #can :manage, :all

      can :manage, List,   user_id: user.id
      can :manage, Follow, user_id: user.id
      #can :new, List
      can :manage, Tip, list:     { user_id: user.id }
      can :manage, :all
    end
  end

end
