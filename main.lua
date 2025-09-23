local json = require("dkjson")

cube = {}
game = {}

function love.load()
    cube.x = 100
    cube.y = 512
    cube.w = 32
    cube.speed = 200
    game.s = 32
    game.offset_world = 0 * game.s
    windowWidth, windowHeight = love.graphics.getDimensions()
    myFont = love.graphics.newFont("Font/Digital Pixel V31/DigitalPixelV31-Regular_0.ttf", 10)
    love.graphics.setFont(myFont)

    data = json.decode(io.open("data/world.json", "r"):read("*all"))
end

function love.update(dt)
    local dx, dy = 0, 0

    if love.keyboard.isDown("a") then dx = dx - 1 end
    if love.keyboard.isDown("d") then dx = dx + 1 end

    cube.x = cube.x + dx * cube.speed * dt
    cube.x = math.max(0, cube.x)
end

function love.draw()
    for y, row in pairs(data) do
        for x, value in pairs(row) do
            if value == 0 then love.graphics.setColor(1, 0, 1) end
            if value == 1 then love.graphics.setColor(0, 1, 0) end
            love.graphics.rectangle("fill", x * game.s, y * game.s + game.offset_world, game.s, game.s)
            love.graphics.setColor(1, 1, 1)
        end
    end

    love.graphics.rectangle("fill", cube.x, cube.y, cube.w, cube.w)
    local xc = math.floor(cube.x / game.s)
    local yc = math.floor(cube.y / game.s)
    local Debug = {
        "XY cube: " .. xc .. " " .. yc,
        "FPS: "  .. math.floor(love.timer.getFPS()),
    }
    local Smesh = 10
    for i, str in pairs(Debug) do
        love.graphics.print(str, 10, Smesh)
        Smesh = Smesh + 20
    end
    
end