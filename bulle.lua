local bubble ={}

ET_BOUCLIER = "Bouclier"
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
bul.timerEtat = 0 

timer = 20 
decompte = timer


function bulChangeEtat(pEtat)
    bul.etat = pEtat
    if pEtat == ET_BOUCLIER then 
        bul.timerEtat = 5 
    end
end

function bubble.Load()
    quack = love.audio.newSource("Sound/Quack.mp3", "static")
end

-- function bubble.Bouclier()
   -- if bul.etat == ET_BLANC then
     --   bul.etat = EtatBouclier
       -- quack:play()
    -- end
-- end


function bubble.Move(dt)
    bul.x = bul.x + bul.vx * dt
    bul.y = bul.y + bul.vy * dt

    if bul.x + bul.rayon + decompte >= lScreen  then
        bul.vx = - bul.vx 
        bul.x = lScreen - bul.rayon - decompte
    elseif bul.x - bul.rayon - decompte <= 0 then
        bul.vx = - bul.vx 
        bul.x = bul.rayon + decompte
    end

    if bul.y + bul.rayon + decompte  >= hScreen then
        bul.vy = - bul.vy  
        bul.y = hScreen - bul.rayon - decompte
    
    elseif bul.y - bul.rayon - decompte <= 0 then
        bul.vy = - bul.vy  
        bul.y = bul.rayon + decompte
    end 
end

function bubble.Update(dt)
    if bul.etat == ET_BOUCLIER then 
        bul.timerEtat = bul.timerEtat - dt
        if bul.timerEtat  < 0 then 
        bul.bulChangeEtat = ET_BLANC
        end
    end
end


function bubble.draw()
    if bul.etat == ET_VERT then
        love.graphics.setColor(0,1,0) 
    end

    if bul.etat == EtatBouclier then
        -- love.graphics.circle("line", bul.x, bul.y, bul.rayon + 10)
        love.graphics.setColor(love.math.colorFromBytes(147, 115, 217, 100)) 
        love.graphics.circle ("fill", bul.x, bul.y, bul.rayon + decompte)
        love.graphics.setColor(1,1,1) 
    end

    love.graphics.circle("line", bul.x, bul.y, bul.rayon)
    love.graphics.setColor(1,1,1) 
    love.graphics.print(tostring(bul.ET_BOUCLIER))
end

function bubble.keypressed(key)

end

return bubble