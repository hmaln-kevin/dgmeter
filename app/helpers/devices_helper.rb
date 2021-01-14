module DevicesHelper
    def energy_type (device)
        if device.type_id == 1
            return "Generation Today"
        else
            return "Consumption Today"
        end
    end

    def power_type (device)
        if device.type_id == 1
            return "Maximum Power Today"
        else
            return "Maximum Demand Today"
        end
    end
end
