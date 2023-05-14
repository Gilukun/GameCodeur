io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[#arg] == "-debug" then require("mobdebug").start() end

-- variables joueur

local player ={}
player.x = 0
player.y = 0
player.vx = 0
player.vy = 0
player.rotation = 0
playerScaley = 1
player.speed = 100


listPlayer = {}

function love.load()
  lScreen = love.graphics.getWidth()
  hScreen = love.graphics.getHeight()
  
  player.img = love.graphics.newImage("player.png")
  PimageL = player.img:getWidth()
  PimageH = player.img:getHeight()
  
  for n=1, 5 do
    local players= {}
    players.x = 0
    players.y = love.math.random(100,300)
    players.speed = love.math.random(50,200)
    table.insert(listPlayer, players)
  end
end

function love.update(dt)
  
  -- déplacement automatique
  for n=1, #listPlayer do
    local players = listPlayer[n]
    players.x = players.x + players.speed * dt
  end
  
  -- Déplacement du joueur avec le clavier
  

-- Détection des collisions


end

function love.draw()

  for n=1, #listPlayer do
    local players = listPlayer[n]
    love.graphics.draw(player.img, players.x, players.y)
  end


end

if love.keyboard.isDown("left") then 
      player.x = player.x - player.speed * dt
      playerScalex = - 1
  end
  
  if love.keyboard.isDown("right") then
    player.x = player.x + player.speed * dt
    playerScalex = 1
  end
  
  if love.keyboard.isDown("up") then 
      player.y = player.y - player.speed * dt
      playerScaley = 1
  end
  
  if love.keyboard.isDown("down") then
    player.y = player.y + player.speed * dt
    playerScaley = - 1
  end
  
    if players.x < PimageL  then
    players.x = PimageL
  end
  
  if player.x > lScreen - PimageL then
    player.x =  lScreen - PimageL 
  end
  
  if player.y < 0 then
    player.y = 0
  end
  if player.y > hScreen then
    player.y =  hScreen
  end
