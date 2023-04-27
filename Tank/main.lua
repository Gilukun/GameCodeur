-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

imageTank = love.graphics.newImage("images/tank.png")

local tank = require("tank")
local moduleTirs = require("tirs")
local tourelle = require("Tourelle")

function love.load()
end

function love.update(dt)
   tank.Update(dt)
   moduleTirs.Update(dt)
   tourelle.update(dt)
end

function love.draw()
    moduleTirs.Draw()
    tank.draw()
    tourelle.draw()
    love.graphics.print(moduleTirs.GetNumberOfTirs())
end

function love.keypressed(key)
    if key == "space" then
        moduleTirs.Tire(tank.x, tank.y, tank.angle, 300)
    end
end
