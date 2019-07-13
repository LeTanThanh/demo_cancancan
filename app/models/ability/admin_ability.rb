module Ability
  class AdminAbility
    include CanCan::Ability

    def initialize(admin)
      if admin
        # ability for admin
        can :manage, Post
      end
    end
  end
end
