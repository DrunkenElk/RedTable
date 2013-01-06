class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    case user.role
      when 'admin'
        can :manage, :all
      when 'moderator'
        can :read, :all
      when 'anonymous'
        can :read, :all
      when 'banned'
        can :read, :all
    end

  end
end
