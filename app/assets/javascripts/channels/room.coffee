App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log("Connected to RoomChannel")

    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    message = data['message']
    deviceStatus = document.getElementById("statusDevice#{message[0]}")
    if message[1] == true
      deviceStatus.style = "color: #51cf66;"
    else
      deviceStatus.style = "color: #ff6b6b;"
      

