local etoile ={}

lScreen = love.graphics.getWidth()
hScreen = love.graphics.getWidth()


local liststar ={}
function etoile.CreateStar()
    for n=1,100 do
        local star= {}
        star.x = love.math.random(1,lScreen)
        star.y = love.math.random(1,hScreen)
        star.vitesse = 100
        table.insert(liststar, star)
    end
end


function etoile.StarMove(dt)
    for n = 1, #liststar do 
        local v = liststar[n]
        v.y = v.y + v.vitesse * dt
        if v.y> hScreen then
            v.y = 0
        end
    end
end

function etoile.draw()
    for k,v in ipairs (liststar) do
        love.graphics.circle("fill",v.x, v.y, 1)
    end
end

function etoile.keypressed(key)
end

return etoile