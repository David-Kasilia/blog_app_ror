class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Comment] # start by defining rules for all users, also not logged ones
    return unless user.present?

    can :manage, [Post, Comment] # if the user is logged in can manage it's own posts
    return unless user.admin?

    can :manage, :all # finally we give all remaining permissions only to the admins
  end
end
