-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

imageTank = love.graphics.newImage("images/tank.png")

local tank = require("tank")
local moduleTirs = require("tirs")

function love.load()
end

function love.update(dt)
   tank.Update(dt)
   moduleTirs.Update(dt)
end

function love.draw()
    moduleTirs.Draw()
    tank.draw()
    love.graphics.print(moduleTirs.GetNumberOfTirs())
end

function love.keypressed(key)
    if key == "space" then
        moduleTirs.Tire(tank.x, tank.y, tank.angle, 300)
    end
end
