# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role_id: 3)

    if user.admin?
      can :manage, :all
    elsif user.current?
      can :read, Task
      can :create, Task
      can :update, Task do |t|
        t.try(:user) == user
      end
      can :destroy, Task do |t|
        t.try(:user) == user
      end

      can :read, Alert
      can :create, Alert
      can :update, Alert do |alert|
        alert.try(:user) == user
      end
      can :destroy, Alert do |alert|
        alert.try(:user) == user
      end

      can :read, Tag
      can :create, Tag
      can :update, Tag do |tag|
        tag.try(:user) == user
      end
      can :destroy, Tag do |tag|
        tag.try(:user) == user
      end
    elsif user.visitor?
      can :read, :all
    end
  end
end
