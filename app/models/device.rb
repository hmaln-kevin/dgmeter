class Device < ApplicationRecord
    # @device.measure
    has_many :measures
    belongs_to :unit
    has_many :loads
end
