if pcall(require, "lldebugger") then
    require("lldebugger").start()
end
io.stdout:setvbuf("no")

local etoile = require ("Etoile")
local bubble = require ("bulle")

function love.load()
    love.window.setMode(1024,800)
    lScreen = love.graphics.getWidth()
    hScreen = love.graphics.getHeight()
    etoile.CreateStar()
end

function love.update(dt)
    etoile.StarMove(dt)
    bubble.Move(dt)
end

function love.draw()
    etoile.draw()
    bubble.draw()
end

function love.keypressed(key)
end