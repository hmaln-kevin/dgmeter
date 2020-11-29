class Load < ApplicationRecord
    after_commit { SendMessageJob.perform_later self }
    belongs_to :load_topic
    belongs_to :device
    validates_uniqueness_of :load_topic
    # validate :now_connection

    # private
    # def now_connection
    #     # raise an error if Connection constant isn't == on
    #     errors.add("Devise", " offline cannot change state") unless @load.device.connection == true
    # end
end
