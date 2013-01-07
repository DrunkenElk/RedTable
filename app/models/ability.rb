# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    case user.role
      when 'admin'
        can :manage, :all
        can :access_to_admin_page, Imageboard
      when 'moderator'
        can :read, Imageboard
        can :access_to_admin_page, Imageboard
      when 'anonymous'
        can :read, Imageboard
    end

  end
end
