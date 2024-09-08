game = {}
game.monster = {}
game.monster.skull = { strength = 2, damage = 1, health = 10 }

function walk(t)
    for k,v in pairs(t) do
        print(k,v)
        if type(v) == "table" then
            walk(v)
        end
    end
end

