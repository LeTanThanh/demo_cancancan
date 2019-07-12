# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # ability for all user (even not logged in)
    can :read, Post

    if user
      # ability for logged in usser
      can :manage, Post, user_id: user.id
    end
  end
end
