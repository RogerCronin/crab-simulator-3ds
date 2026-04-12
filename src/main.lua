require("nest").init({ console = "3ds", emulateJoystick = true })

local crab_art = " /\\\n( /   @ @    ()\n \\  __| |__  /\n  -/   \"   \\-\n /-|       |-\\\n/ /-\\     /-\\ \\\n / /-`---'-\\ \\\n  /         \\"

-- global variables usable in every file
font = nil
touches = {}

local crab_art = {" /\\           .", "( /   @ @    ()", "\\  __| |__  /", "-/   \"   \\-", "/-|       |-\\", "/ /-\\     /-\\ \\", "/ /-`---'-\\ \\", "/         \\"}

colors = {
    dim = {255, 255, 255, 1},
    red = {255, 0, 0, 255},
    yellow = {255, 215, 0, 255},
    green = {0, 128, 0, 255},
    blue = {30, 144, 255, 255},
    purple = {186, 85, 211, 255},
    cyan = {0, 139, 139, 255},
    orange = {255, 69, 0, 255},
    light_yellow = {255, 234, 127},
    pink = {255, 138, 255},
    white = {255, 255, 255, 255},
    black = {0, 0, 0, 255}
}

print_buffer = {"yay", "boo"}

function love.load()
    love.graphics.set3D(false)
    font = love.graphics.newFont("assets/consolas.ttf", 12)
    love.graphics.setFont(font)
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    touches[id] = { x = x, y = y }
end

function love.touchreleased(id, x, y, dx, dy, pressure)
    touches[id] = nil
end

function love.touchmoved(id, x, y, dx, dy, pressure)
    touches[id] = { x = x, y = y }
end

function love.gamepadpressed(joystick, button)
    if button == "start" then
        love.event.quit()
    end
end

function love.gamepadaxis(joystick, axis, amount)
    print(axis .. ", " .. amount)
end

function love.draw(screen)
    love.graphics.setFont(font)
    
    if screen ~= "bottom" then
        line = 8
        for _, text in pairs(print_buffer) do
            love.graphics.printf({colors.purple, text}, 0, line, 400, "center")
            line = line + 12
            love.graphics.printf({colors.white, text}, 0, line, 400, "center")
            line = line + 12
        end
    else
        -- nop
    end
end

function love.update(dt)
end
