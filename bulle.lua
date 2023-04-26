local bubble ={}

EtatBouclier = "Bouclier"
ET_BLANC = "blanc"
ET_VERT = "Vert"

local bul ={}
bul.x = 100
bul.y = 200
bul.vx = love.math.random(-200,200)
bul.vy = love.math.random(-200,200)
bul.rayon = 10
bul.rebound = false
bul.etat = ET_BLANC


timer = 10


function bulChangeEtat()
    if bul.etat == ET_BLANC then
        bul.etat = ET_VERT
    elseif bul.etat == ET_VERT then 
        bul.etat = ET_BLANC
    end
end

function bubble.Bouclier(dt)
    local timer = 10
    if timer > 0 then 
        timer = timer - dt
    end
end

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
    if bul.etat == ET_VERT then
        love.graphics.setColor(0,1,0) 
    end

    if bul.etat == EtatBouclier then
        love.graphics.circle("line", bul.x, bul.y, bul.rayon + 10)
    end

    love.graphics.circle("line", bul.x, bul.y, bul.rayon)
    love.graphics.setColor(1,1,1) 
    love.graphics.print(math.ceil(timer))
end

function bubble.keypressed(key)

end

return bubble