module DevicesHelper
    def energy_type (device)
        if device.type_id == 1
            return "Geração Hoje"
        else
            return "Consumo hoje"
        end
    end

    def power_type (device)
        if device.type_id == 1
            return "Máxima Potência Hoje"
        else
            return "Máxima Demanda Hoje"
        end
    end
end
