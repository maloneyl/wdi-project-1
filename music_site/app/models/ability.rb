class Ability
  include CanCan::Ability

  def initialize(user)

    # create a default new user if none passed
    user ||= User.new

    # admins can, of course, do everything
    if user.role? :admin
      can :manage, :all

    # everyone can view profiles and individual song pages without logging in
    else
      can :read, :all
      can :create, User

      # all users can update their own user accounts
      # all users can create/edit/remove their own profiles and music
      # all users can comment on any song and remove comments they have posted
      # all users can remove comments made on their music
      # no comment editing
      if user.role?(:musician) || user.role?(:listener)
        can :update, User do |account|
          account.id == user.id
        end
        can :create, Profile
        can :update, Profile do |profile|
          profile.user_id == user.id
        end
        can :destroy, Profile do |profile|
          profile.user_id == user.id
        end
        can :create, Music
        can :update, Music do |music|
          music.user_id == user.id
        end
        can :destroy, Music do |music|
          music.user_id == user.id
        end
        can :create, Comment
        can :destroy, Comment do |comment|
          comment.user_id == user.id || comment.music.user_id == user.id
        end
      end
    end
  end
end
