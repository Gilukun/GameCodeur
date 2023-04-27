if pcall(require, "lldebugger") then
    require("lldebugger").start()
end
io.stdout:setvbuf("no")

local etoile = require ("Etoile")
local bubble = require ("bulle")

EtatJeu = "Menu"


function love.load()
    lScreen = love.graphics.getWidth()
    -- love.window.setMode(1024,800)
    hScreen = love.graphics.getHeight()
    etoile.CreateStar()
    bubble.Load()
end

function UpdateMenu()
end

function UpdateJeu(dt)
    dt = math.min(dt, 1/60) -- bloquer le dt permet d'eviter les sauts de framerate
    etoile.StarMove(dt)
    bubble.Move(dt)
    bubble.Update(dt)
end

function love.update(dt)
    if EtatJeu == "Menu" then 
        UpdateMenu(dt)
    elseif EtatJeu == "jeu" then 
        UpdateJeu(dt)

    end
end

function DrawMenu()
    love.graphics.print("Menu")
end

function DrawJeu()
    etoile.draw()
    bubble.draw()
end

function love.draw()
    if EtatJeu == "Menu" then
        DrawMenu()
    elseif EtatJeu == "jeu" then
        DrawJeu()
    end
end

function love.keypressed(key)
    if EtatJeu == "Menu" then 
        if key == "a" then 
            EtatJeu ="jeu"
        end
    elseif EtatJeu =="jeu" then
        if key == "space" then 
            bulChangeEtat(ET_BOUCLIER)
        end
        if key == "b" then
            bubble.Bouclier()
        end
        if key == "escape" then 
            EtatJeu ="Menu"
        end
    end
end