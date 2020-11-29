module ApplicationHelper
    def energy_chart_config
       { 
        id: "chart-energy",
        # xtitle: "Time",
        ytitle: "Energy(kWh)",
        refresh: 120 ,
        round: 3,
        name: Time.now.strftime("%d/%m/%Y"),
        messages: {empty: "No data"},
       }
    end

    def power_chart_config
        { 
         id: "chart-power",
         # xtitle: "Time",
         ytitle: "Demand(W)",
         refresh: 120,
         round: 3,
         name: Time.now.strftime("%d/%m/%Y"),
         messages: {empty: "No data"}
        }
     end
end
