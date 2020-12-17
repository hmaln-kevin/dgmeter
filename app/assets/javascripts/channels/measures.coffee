App.measures = App.cable.subscriptions.create "MeasuresChannel",
  connected: ->
    console.log("Connected to MeasuresChannel")
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    message = data['message']
    nowEnergy = document.getElementById("nowEnergy#{message[0]}")
    nowEnergy.innerHTML = "#{message[1]} kWh"
    maxDemand = document.getElementById("maxDemand#{message[0]}")
    maxDemand.innerHTML = "#{message[2]} kW"
    nowVoltage = document.getElementById("nowVoltage#{message[0]}")
    nowVoltage.innerHTML = "#{message[3]} V"
    nowFrequency = document.getElementById("nowFrequency#{message[0]}")
    nowFrequency.innerHTML = "#{message[4]} Hz"
    lastEnergy = document.getElementById("energy#{message[0]}")
    lastEnergy.innerHTML = "#{message[5]}"
    lastPower = document.getElementById("power#{message[0]}")
    lastPower.innerHTML = "#{message[5]}"


