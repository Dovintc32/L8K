cube = {}
game = {}

function love.load()
    cube.x = 100
    cube.y = 100
    cube.w = 64
    cube.speed = 200
    windowWidth, windowHeight = love.graphics.getDimensions()
    myFont = love.graphics.newFont("Font/Digital Pixel V31/DigitalPixelV31-Regular_0.ttf", 10)
    love.graphics.setFont(myFont)
end

function love.update(dt)
    local dx, dy = 0, 0

    if love.keyboard.isDown("a") then dx = dx - 1 end
    if love.keyboard.isDown("d") then dx = dx + 1 end

    cube.x = cube.x + dx * cube.speed * dt
    cube.x = math.max(0, math.min(windowWidth - cube.w, cube.x))
end

function love.draw()
    love.graphics.rectangle("fill", cube.x, cube.y, cube.w, cube.w)
    local Debug = {
        "XY cube: " .. math.floor(cube.x) .. " " .. math.floor(cube.y),
        "FPS: "  .. math.floor(love.timer.getFPS())
    }
    local Smesh = 10
    for i, str in pairs(Debug) do
        love.graphics.print(str, 10, Smesh)
        Smesh = Smesh + 20
    end
    
end