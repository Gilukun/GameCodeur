local bubble ={}

local bul ={}
bul.x = 100
bul.y = 200
bul.vx = love.math.random(-200,200)
bul.vy = love.math.random(-200,200)
bul.rayon = 10

function bubble.Move(dt)
    bul.x = bul.x + bul.vx * dt
    bul.y = bul.y + bul.vy * dt

    if bul.x + bul.rayon >= lScreen  then
        bul.vx = - bul.vx 
        bul.x = lScreen - bul.rayon
    elseif bul.x - bul.rayon <= 0 then
        bul.vx = - bul.vx 
        bul.x = bul.rayon
    end

    if bul.y + bul.rayon >= hScreen then
        bul.vy = - bul.vy  
        bul.y = hScreen - bul.rayon
    elseif bul.y - bul.rayon <= 0 then
        bul.vy = - bul.vy  
        bul.y = bul.rayon
    end
end

function bubble.draw()
    love.graphics.circle("line", bul.x, bul.y, bul.rayon)
end

return bubble