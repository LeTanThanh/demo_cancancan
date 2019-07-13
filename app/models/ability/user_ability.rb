module Ability
  class UserAbility
    include CanCan::Ability

    def initialize(user)
      # ability for all user (even not logged in)
      can :read, Post

      if user
        # ability for logged in usser
        can :manage, Post, user_id: user.id
        can :create, Comment
        can [:update, :destroy], Comment, user_id: user.id
        can :destroy, Comment, post: { user_id: user.id }

        # ability for admin usser
        if user.is_admin?
          can :manage, Post
          can [:update, :destroy], Comment
        end
      end
    end
  end
end
