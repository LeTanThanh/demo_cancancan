module Ability
  class UserAbility
    include CanCan::Ability

    def initialize(user)
      # ability for all user (even not logged in)
      can :read, Post

      if user
        # ability for logged in usser
        can :manage, Post, user_id: user.id

        # ability for admin usser
        if user.is_admin?
          can :manage, Post
        end
      end
    end
  end
end
