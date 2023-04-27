local tourelle = {}
local tirs = require("tirs")
local tank = require ("tank")
function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end
local intervalTir = 3
tourelle.x = 700
tourelle.y = 100 
tourelle.timer = intervalTir
tourelle.angle = 0 



function tourelle.update(dt)
    if tourelle.timer > 0 then
        tourelle.timer = tourelle.timer - dt
    end 
    if tourelle.timer <= 0 then 
        tir = true
        local angle = math.angle(tourelle.x,tourelle.y, tank.x,tank.y)
        tourelle.angle = angle
        tirs.Tire(tourelle.x, tourelle.y, tourelle.angle, 300)
        tourelle.timer = intervalTir
    end
    

end

function tourelle.draw()
    love.graphics.circle("fill",tourelle.x, tourelle.y, 10 )
    
    if tir ==true then 
        love.graphics.print("BOUM", 700, 300)
    end
    love.graphics.print(tostring(tourelle.timer))
end

return tourelle