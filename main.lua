if pcall(require, "lldebugger") then
    require("lldebugger").start()
end
io.stdout:setvbuf("no")

local etoile = require ("Etoile")
local bubble = require ("bulle")
etoile.CreateStar()

function love.load()
   
end

function love.update(dt)
    bubble.Move(dt)
    etoile.StarMove(dt)
    
end

function love.draw()
    etoile.draw()
    bubble.draw()
end

function love.keypressed(key)
end