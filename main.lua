local firebaseInAppMessaging = require "plugin.firebaseInAppMessaging"
firebaseInAppMessaging.init()
local json = require "json"
local widget = require("widget")

local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 1,.5,0 )

local title = display.newText( {text = "Firebase \n In App Messaging", fontSize = 25 , align = "center"} )
title.width, title.height = 300, 168
title.x, title.y = display.contentCenterX, 168*.5
title:setFillColor(1,0,0)

local userId = "3547347"

local setUserId
setUserId = widget.newButton( {
  x = display.contentCenterX,
  y = display.contentCenterY-100,
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  label = "Set UserId",
  onEvent = function ( e )
    if (e.phase == "ended") then
      firebaseInAppMessaging.setUserId(userId)
    end
  end
} )

firebaseInAppMessaging.getInstanceId(function ( e )
  print(json.encode(e))
end)
