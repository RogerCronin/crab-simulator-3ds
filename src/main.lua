require("nest").init({ console = "3ds", emulateJoystick = true })

local config = require("water_works")

-- global variables usable in every file
font = nil
touches = {}

local crab_art = {" /\\           .", "( /   @ @    ()", "\\  __| |__  /", "-/   \"   \\-", "/-|       |-\\", "/ /-\\     /-\\ \\", "/ /-`---'-\\ \\", "/         \\"}

colors = {
    dim = {0.41, 0.41, 0.41, 1},
    red = {1, 0, 0, 1},
    yellow = {1, 0.84, 0, 1},
    green = {0, 0.5, 0, 1},
    blue = {0.12, 0.56, 1, 1},
    purple = {0.73, 0.33, 0.83, 1},
    cyan = {0, 0.55, 0.55, 1},
    orange = {1, 0.27, 0, 1},
    light_yellow = {1, 0.91, 0.5, 1},
    pink = {1, 0.54, 1, 1},
    white = {1, 1, 1, 1},
    black = {0, 0, 0, 1}
}

event_queue = {}
print_buffer = {}

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
    if button == "a" then
        print("press A")
        config.fprintf("This is a test of the text system... I sure hope it works!\n", colors.cyan)
        config.fprintf("Don't get your hopes up, buddy.\n", colors.green)
    elseif button == "b" then
        print("press B")
        config.runner_event(
            function ()
                print_buffer = {}
            end
        )
    end

    if button == "start" then
        love.event.quit()
    end
end

function love.gamepadaxis(joystick, axis, amount)
    -- TODO add gamepad
end

function love.draw(screen)
    love.graphics.setFont(font)
    
    if screen ~= "bottom" then
        local line = 8
        for _, text in pairs(print_buffer) do
            love.graphics.printf(text, 0, line, 400, "center")
            line = line + 12
        end
    else
        -- TODO add bottom screen
    end
end

function love.update(dt)
    config.update_event_queue(dt)
end
