# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can [:read, :update], Unit, users: {id: user.unit_ids}
      can [:read, :update], Load, device: {id: user_load_ids(user)} # user need to update only name and state in device. Fix it!
      can [:read], Device, unit: {id: user_device_ids(user)}
      # cannot do anything with load topics and others models
    end
  end

  private
  # return an array with authorized devices
  def user_device_ids(user)
    ids = []
    user.units.each do |u|
       u.devices.each do |d|
          ids << d.id
       end
    end
    return ids
  end

  def user_load_ids(user)
    ids = []
    user.units.each do |u|
       u.devices.each do |d|
          d.loads.each do |l|  
            ids << l.id
          end
       end
    end
    return ids
  end

end