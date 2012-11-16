class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Citygate::User.new

    can :read, :all

    if user.persisted?
      can :profile, Citygate::User
      can :manage, List, user_id: user.id
      can :manage, Tip, list:     { user_id: user.id }
    end
  end

end
