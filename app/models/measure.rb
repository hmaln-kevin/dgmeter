class Measure < ApplicationRecord
    # after_create_commit { ChatBroadcastJob.perform_later self }
    belongs_to :device, -> { includes :unit }
end
