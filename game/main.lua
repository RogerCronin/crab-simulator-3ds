require("nest").init({ console = "3ds", emulateJoystick = true })

local config = require("water_works")
local days = require("days")

-- global variables usable in every file
font = nil
font_bold = nil
touches = {}

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

--queue = config.generate_queue()
queue = {"m_presidential_campaign_2"}
event_queue = {}
print_buffer = {}
active_choice = {}

local choice_horizontal_offset = 16
waiting_for_input = false
hovered_answer = 1
answer = 0

local function intro()
    config.clear()
    config.fprintf("Welcome!\n", colors.green, 1)
    config.fprintf("You've died tragically " .. config.random_death() .. ".\n", colors.red, 1.5)
    if math.random(1, 4) == 4 then
        config.fprintf("LucKRILLy...", colors.green, 1)
        config.fprintf("haha do you get it", colors.dim, 0, 0.02)
    else
        config.fprintf("Luckily...", colors.green, 1)
    end
    config.fprintf("You've been reincarnated as a crab!", colors.green, 1)
    config.fprintf("There's a lot to do as a crab these days, so strap in and enjoy the ride!\n", colors.green, 2)

    config.days = 0
    config.experience = 0
    config.personality = 0
    config.state = 0
    game()
end

local function credits()
    config.clear()
    config.fprintf("Made by Jacob Johnson and Roger Cronin\n", colors.green, 1)
    config.fprintf("Shoutout to RomeroShwarz and their 1300s Peasant Simulator for inspiration\n", colors.green, 1)
    config.fprintf("Shoutout https://en.wikipedia.org/wiki/Crab\n", colors.green, 1)
    config.fprintf("Crab art by tre\n", colors.green, 1)
    config.fprintf("A bunch of people who tested and probably don't want their names on this\n", colors.green, 1)
    config.fprintf("And you, gamer.", colors.green, 1)
    config.fprintf("*mwha*", colors.green, 3)

    title_screen()
end

local function title_screen()
    config.clear()
    config.fprintf(" /\\           .", colors.red, 0, 0)
    config.fprintf("( /   @ @    ()", colors.red, 0, 0)
    config.fprintf("\\  __| |__  /", colors.red, 0, 0)
    config.fprintf("-/   \"   \\-", colors.red, 0, 0)
    config.fprintf("/-|       |-\\", colors.red, 0, 0)
    config.fprintf("/ /-\\     /-\\ \\", colors.red, 0, 0)
    config.fprintf("/ /-`---'-\\ \\", colors.red, 0, 0)
    config.fprintf("/         \\\n", colors.red, 0, 0)

    config.sleep(2)

    config.fprintf("Welcome to Crab Simulator (2020)!\n", colors.yellow, 1.5)

    config.fprintf(config.random_greeting(), colors.green)
    config.fprintf("Select an option pleeeaase\n", colors.green)

    config.choice({"New Game", "Credits"})

    config.run(
        function ()
            if answer == 1 then
                intro()
            else
                credits()
            end
        end
    )
end

local function game()
    if config.state == 0 then -- we're still alive and executing
        if #queue ~= 0 then -- if there are days to execute, play them
            config.pause()
            
            local day = table.remove(queue, 1)
            config.days = config.days + 1

            config.clear()
            config.fprintf("DAY " .. config.days .. "\n", colors.white, 1, 0)
            days[day]()
        else
            config.fprintf("How the fuck did you end up here?\n", colors.green, 1)
            config.fprintf("I'm sorry, what?\n", colors.cyan)
            config.fprintf("You reached an illegal state. You shouldn't be seeing this dialogue.\n", colors.green)
            config.fprintf("Oh, uh, so this is a funny little error handling mechanism?\n", colors.cyan)
            config.fprintf("Yeah, pretty much. Let the developers know you saw this. Not like they'll do anything about it though, lmao.\n", colors.green, 1)
            
            config.fprintf("Breaking the game + 1", "rainbow", 1)
            config.sleep(60)
            config.run(
                function ()
                    love.event.quit()
                end
            )
        end
    else
        config.clear()

        if config.state == -1 then
            config.pause()
            config.clear()
            -- win the game!
            config.days = config.days + 1
            config.fprintf("DAY " .. config.days .. "\n", colors.white, 1, 0)
            config.fprintf("Damn, you actually made it.\n", colors.green, 2)
            config.fprintf("Huh? Where am I?\n", colors.cyan)
            config.fprintf("You're at the end of the game. You finished all of the trials I put you through.", colors.green)
            config.fprintf("You may rest now.\n", colors.green, 2)
            config.fprintf("...", colors.cyan, 1)
            config.fprintf("I don't really want to. I still have so much to do as a crab.\n", colors.cyan, 1)
            config.fprintf("Really? I've never had this happen to me before... I'll tell you what, kid. You wanna become a narrator?\n", colors.green)

            config.choice({"Yes", "No"})
            config.run(
                function ()
                    if answer == 1 then
                        config.fprintf("I accept.\n", colors.green)
                        config.fprintf("Thank you. I can ascend now. I shall see you again soon.\n", colors.white, 1)
                        config.fprintf("Where are you going?", colors.green, 2)
                        config.fprintf("...", colors.green, 3)
                        config.fprintf("Oh, and thanks for playing through this whole thing as me. You saved me a whole lot back there.", colors.green, 2)
                        config.fprintf("I guess I should be going too. See ya.\n", colors.green, 4)
                    else
                        config.fprintf("Thanks for the offer, but I refuse.\n", colors.cyan)
                        config.fprintf("I can't blame you.", colors.green, 1)
                        config.fprintf("Goodbye for now. I shall see you again soon.\n", colors.green, 1)
                        config.fprintf("Where are you going?", colors.cyan, 2)
                        config.fprintf("...", colors.cyan, 3)
                        config.fprintf("Oh, and thanks for playing through this whole thing as me. You saved me a whole lot back there.", colors.cyan, 2)
                        config.fprintf("I guess I should be going too. See ya.\n", colors.cyan, 4)
                    end

                    config.pause()
                    config.clear()
                    config.sleep(2)
                    config.fprintf("Thanks for playing Crab Simulator (2020)!\n", colors.yellow, 3)
                    config.fprintf("STATS:", colors.white, 1)
                    config.fprintf("Total days: " .. config.days, colors.white, 1)
                    config.fprintf("Experience: " .. config.experience, colors.white, 1)
                    config.fprintf("Overall Kindness: " .. config.personality .. "\n", colors.white, 1)
                    config.run(
                        function ()
                            if config.personality > 0 then -- this is god speaking
                                config.fprintf("Those were some pretty nice choices back there. Good job.\n", "rainbow", 3)
                            else
                                config.fprintf("Those weren't some pretty nice choices back there. Not cool, dude.\n", "rainbow", 3)
                            end

                            config.fprintf("Hope you liked our game. Gotta run now, bye.\n", colors.yellow, 5)

                            config.pause()
                            title_screen()
                        end
                    )
                end
            )
        else
            -- lose the game!
            config.fprintf("You died.\n", colors.red, 2, 0)
            config.fprintf("Ending " .. config.state:sub(-2) .. "\n", colors.green, 1, 0)
            config.fprintf(config.state:sub(1, #config.state - 2) .. "\n", colors.green, 1)
            config.fprintf("Congrats, you made it " .. config.days .. " " .. config.day_plural() .. ".\n", colors.green, 2)
            config.pause()
            title_screen()
        end
    end
end

function end_of_day()
    -- if there are no days left and you haven't died, set game to win state
    if #queue == 0 and config.state == 0 then
        config.state = -1
    elseif config.state ~= 0 then
        config.pause()
    end
    game()
end

function love.load()
    math.randomseed(os.time())
    love.graphics.set3D(false)
    font = love.graphics.newFont("assets/consolas.ttf", 12)
    love.graphics.setFont(font)
    if not config.debug then title_screen() else game() end
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
    if #active_choice ~= 0 then
        if button == "dpup" then
            hovered_answer = math.max(hovered_answer - 1, 1)
        elseif button == "dpdown" then
            hovered_answer = math.min(hovered_answer + 1, #active_choice)
        elseif button == "a" then
            answer = hovered_answer
        end
    end

    if waiting_for_input then
        if button == "a" then
            answer = 1
        end
    end

    if button == "start" then
        love.event.quit()
    end
end

function love.gamepadaxis(joystick, axis, amount)
    -- TODO implement gamepad
end

function love.draw(screen)
    love.graphics.setFont(font)
    
    if screen ~= "bottom" then
        -- scroll camera if the print_buffer would be offscreen
        love.graphics.translate(0, math.min(0, 240 - 16 - #print_buffer * 12))
        local line = 8
        for _, text in pairs(print_buffer) do
            love.graphics.printf(text, 0, line, 400, "center")
            line = line + 12
        end
    else
        if #active_choice ~= 0 then
            local line = 120 - 6 * #active_choice -- 120 is midpoint, subtract 6 for each line for vertical centering

            for i, choice in pairs(active_choice) do
                if i == hovered_answer then
                    love.graphics.print({colors.cyan, ">>"}, 8 + choice_horizontal_offset, line)
                end

                local _, choice = font:getWrap(choice, 320 - (8 * 4 + choice_horizontal_offset) * 2)
                love.graphics.print({colors.cyan, "[" .. i .. "] " .. choice[1]}, 8 * 4 + choice_horizontal_offset, line)
                line = line + 12
                for j = 2, #choice do
                    love.graphics.print({colors.cyan, choice[j]}, 8 * 4 + choice_horizontal_offset, line)
                    line = line + 12
                end
            end
        end
    end
end

function love.update(dt)
    config.update_event_queue(dt)
end
