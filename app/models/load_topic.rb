class LoadTopic < ApplicationRecord
   has_one :load, validate: true
   validates_presence_of :description
end
