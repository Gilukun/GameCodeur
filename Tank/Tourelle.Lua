tourelle = {}
tourelle.x = 200
tourelle.y = 200 

function tourelle.update()
end

function tourelle.draw()
    love.graphics.circle("fill",tourelle.x, tourelle.y, 10 )
end

return tourelle