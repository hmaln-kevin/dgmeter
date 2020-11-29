class Unit < ApplicationRecord
    # @unit.devices
    has_many :devices
    # @unit.measures
    has_many :measures, through: :devices
    has_and_belongs_to_many :users
end
