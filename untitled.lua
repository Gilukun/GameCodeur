io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[#arg] == "-debug" then require("mobdebug").start() end

-- variables joueur

local player ={}
player.x = 0
player.y = 0
player.vx = 0
player.vy = 0




function love.load()
  lScreen = love.graphics.getWidth()
  hScreen = love.graphics.getHeight()
  
  player.img = love.graphics.newImage("player.png")
  
end

function love.update()
  love.keyboard.isDown("left")
  
  love.keyboard.isDown("right")

end

function love.draw()
  love.graphics.draw(player.img)

end