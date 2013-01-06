class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    case user.role
      when 'admin'
        can :manage, :all
      when 'moderator'
        can :read, Imageboard
      when 'anonymous'
        can :read, Imageboard
      when 'banned'
        can :read, Imageboard
    end

  end
end
