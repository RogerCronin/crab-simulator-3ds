require("nest").init({ console = "3ds" })

font = nil

function love.load()
    love.graphics.set3D(false)
    font = love.graphics.getFont()
end

local touches = {}

function love.touchpressed(id, x, y, dx, dy, pressure)
    touches[id] = { x = x, y = y }
end

function love.touchreleased(id, x, y, dx, dy, pressure)
    touches[id] = nil
end

function love.touchmoved(id, x, y, dx, dy, pressure)
    touches[id] = { x = x, y = y}
end

function love.draw(screen)
    love.graphics.setFont(font)

    local width, height = love.graphics.getDimensions(screen)

    if screen ~= "bottom" then
        love.graphics.print(string.format("top: %d,%d", width, height), width / 2, height / 2)
    else
        love.graphics.print(string.format("bottom: %d,%d", width, height), width / 2, height / 2)

        for id, touch in pairs(touches) do
            love.graphics.circle("fill", touch.x, touch.y, 20)
        end
    end
end

function love.gamepadpressed(joystick, button)
    print(joystick)
    print(button)

    -- love.event.quit()
end
