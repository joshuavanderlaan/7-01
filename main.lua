-----------------------------------------------------------------------------------------
--
-- main.lua
-- april 15, 2019
--
-- by joshua van der Laan
--
-- to display two buttons that use a simple and the other a comprehensive touch command
-----------------------------------------------------------------------------------------

-- simple touch code



local theBall = display.newImage( "button.png" )

theBall.x = display.contentCenterX

theBall.y = display.contentCenterY - 100

theBall.id = "ball object"

 

local function onBallTouched( event )

    if ( event.phase == "began" ) then

        print( "Touch event began on: " .. event.target.id )

    elseif ( event.phase == "ended" ) then

        print( "Touch event ended on: " .. event.target.id )

    end

  

    return true

end



theBall:addEventListener( "touch", onBallTouched )


-- Comprehensive touch code



local thebutton = display.newImage( "ball.jpg" )

thebutton.x = display.contentCenterX

thebutton.y = display.contentCenterY + 100

thebutton.id = "ball object"

 

function thebutton:touch( event )

    if ( event.phase == "began" ) then

        print( "Touch event began on: " .. self.id )

 

        -- Set touch focus

        display.getCurrentStage():setFocus( self )

        self.isFocus = true

     

    elseif ( self.isFocus ) then

        if ( event.phase == "moved" ) then

            print( "Moved phase of touch event detected." )

 

        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then

 

            -- Reset touch focus

            display.getCurrentStage():setFocus( nil )

            self.isFocus = nil

            print( "Touch event ended on: " .. self.id )

        end

    end



    return true

end



thebutton:addEventListener( "touch", thebutton )