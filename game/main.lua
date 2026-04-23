nest = require("nest").init({ console = "3ds" })
local font_file_name = "assets/jb_extra_bold"

local config = require("water_works")
local days = require("days")
local audio_manager = require("audio_manager")

-- global variables usable in every file
font = nil
font_size = nil
font_line_height = nil
local font_file_name = nil
if nest then -- on PC
    font_file_name = "assets/jb_med"
    font_size = 14
    font_line_height = 14
else -- on 3DS
    font_file_name = "assets/jb_semi_bold"
    font_size = 20
    font_line_height = font_size - 6
end
touches = {}
ant_sim_color_palette = false
day_string = nil

local quit_timer = 0
local is_quitting = false

colors = {
    dim = {0.41, 0.41, 0.41, 1},
    red = {1, 0, 0, 1},
    yellow = {1, 0.84, 0, 1},
    green = {0, 0.7, 0, 1},
    old_green = {0, 0.5, 0, 1},
    blue = {0.12, 0.56, 1, 1},
    purple = {0.73, 0.33, 0.83, 1},
    cyan = {0, 0.69, 0.69, 1},
    orange = {1, 0.27, 0, 1},
    light_yellow = {1, 0.91, 0.5, 1},
    pink = {1, 0.54, 1, 1},
    white = {1, 1, 1, 1},
    black = {0, 0, 0, 1},
    bright_red = {255 / 255, 133 / 255, 133 / 255, 1},
    bright_green = {47 / 255, 196 / 255, 72 / 255, 1},
    bright_cyan = {61 / 255, 180 / 255, 204 / 255, 1},
    bright_yellow = {255 / 255, 234 / 255, 127 / 255, 1},
    bright_blue = {127 / 255, 191 / 255, 255 / 255, 1},
    bright_dim = {137 / 255, 142 / 255, 151 / 255, 1}
}

queue = {"game_show"}
event_queue = {}
print_buffer = {}
active_choice = {}

local choice_horizontal_offset = 16
waiting_for_input = false
hovered_answer = 1
answer = 0

speed_up = false

function intro()
    config.clear()
    config.fprintf("Welcome!\n", colors.green, 1)
    config.fprintf("You've died tragically " .. config.random_death() .. ".\n", colors.red, 1.5)
    config.fprintf("Luckily...", colors.green, 1)
    config.fprintf("You've been reincarnated as a crab!", colors.green, 1)
    config.fprintf("There's a lot to do as a crab these days, so strap in and enjoy the ride!\n", colors.green, 2)

    config.days = 0
    config.experience = 0
    config.personality = 0
    config.state = 0
    queue = config.generate_queue()
    game()
end

function credits()
    config.clear()
    config.fprintf("Made by Jacob Johnson and Roger Cronin\n", colors.green, 1)
    config.fprintf("Shoutout to RomeroShwarz and their 1300s Peasant Simulator for inspiration\n", colors.green, 1)
    config.fprintf("Shoutout https\r//en\awikipedia\aorg/wiki/Crab\n", colors.green, 1)
    config.fprintf("Crab art by tre\n", colors.green, 1)
    config.fprintf("A bunch of people who tested and probably don't want their names on this\n", colors.green, 1)
    config.fprintf("And you, gamer.", colors.green, 1)
    config.fprintf("*mwha*", colors.green, 3)

    title_screen()
end

function title_screen()
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

    config.choice({"New Game", "Credits", "Quit"})

    config.run(
        function ()
            if answer == 1 then
                intro()
            elseif answer == 2 then
                credits()
            else
                config.fprintf(config.random_goodbye(), "green", 1)
                config.run(function () love.event.quit() end)
            end
        end
    )
end

function game()
    if config.state == 0 then -- we're still alive and executing
        if #queue ~= 0 then -- if there are days to execute, play them
            config.pause()
            if type(config.message) == "function" then
                config.run(config.message)
                config.run(function () config.message = nil end)
            end
            
            local day = table.remove(queue, 1)
            config.days = config.days + 1
            day_string = day

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
                            title_screen()
                        end
                    )
                end
            )
        else
            config.clear()
            -- lose the game!
            config.fprintf("You died.\n", colors.red, 2, 0)
            config.fprintf("Ending " .. config.state:sub(-2) .. "\n", colors.green, 1, 0)
            config.fprintf(config.state:sub(1, #config.state - 2) .. "\n", colors.green, 1)
            config.fprintf("Congrats, you made it " .. config.days .. " " .. config.day_plural() .. ".\n", colors.green, 2)

            config.choice({"Restart day", "Quit"}, function ()
                config.state = 0 -- resurrection!
                config.days = config.days - 1

                -- these days are auto lose, reset to last real day
                if day_string == "c_president_stay" then
                    day_string = "m_presidential_campaign_3"
                    config.days = config.days - 1
                elseif day_string == "c_crab_exam_death" then
                    day_string = "crab_exam"
                    config.days = config.days - 1
                end

                if answer == 1 then
                    config.fprintf(config.random_restart() .."\n", "green", 1)
                    table.insert(queue, 1, day_string)
                    game()
                else
                    config.fprintf("Wait hang on, this game doesn't save. You sure you wanna quit?\n", "green")
                    config.choice({"Yea quit on it", "No wait I wanna restart"}, function ()
                        if answer == 1 then
                            config.fprintf("Okay, your loss...\n", "green")
                            title_screen()
                        else
                            config.fprintf("I knew you had it in ya\n", "green", 1)
                            table.insert(queue, 1, day_string)
                            game()
                        end
                    end)
                end
            end)
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
    love.graphics.set3D(true)
    font = love.graphics.newFont(config.get_file(font_file_name, "ttf"), font_size)
    love.graphics.setFont(font)
    if not config.debug then title_screen() else game() end

    audio_manager.register("assets/ambient.ogg", true):play()
    audio_manager.register("assets/alien.ogg")
    audio_manager.register("assets/applause.ogg")
    audio_manager.register("assets/bang.ogg")
    audio_manager.register("assets/boo.ogg")
    audio_manager.register("assets/crash.ogg")
    audio_manager.register("assets/kill.ogg")
    audio_manager.register("assets/piano_crash.ogg")
    audio_manager.register("assets/ping.ogg")
    audio_manager.register("assets/pistol.ogg")
    audio_manager.register("assets/pounding.ogg")
    audio_manager.register("assets/rain.ogg", true)
    audio_manager.register("assets/ring.ogg")
    audio_manager.register("assets/siren.ogg")
    audio_manager.register("assets/slide_whistle.ogg")
    audio_manager.register("assets/thunder.ogg")
    audio_manager.register("assets/whip.ogg")
    audio_manager.register("assets/woohoo.ogg")
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

local function hovered_answer_up()
    hovered_answer = math.max(hovered_answer - 1, 1)
end

local function hovered_answer_down()
    hovered_answer = math.min(hovered_answer + 1, #active_choice)
end

function love.gamepadpressed(joystick, button)
    if button == "rightshoulder" then speed_up = true end

    if #active_choice ~= 0 then
        if button == "dpup" then
            hovered_answer_up()
        elseif button == "dpdown" then
            hovered_answer_down()
        elseif button == "a" then
            answer = hovered_answer
        end
    end

    if waiting_for_input then
        if button == "a" then
            answer = 1
        end
    end

    if button == "start" then is_quitting = true end
end

function love.gamepadreleased(joystick, button)
    if button == "rightshoulder" then speed_up = false end
    if button == "start" then
        is_quitting = false
        quit_timer = 0
    end
end

local axis_timeout = false
function love.gamepadaxis(joystick, axis, amount)
    if not nest and #active_choice ~= 0 and axis == "lefty" then
        if amount < -0.9 and not axis_timeout then
            hovered_answer_down()
            axis_timeout = true
        elseif amount > 0.9 and not axis_timeout then
            hovered_answer_up()
            axis_timeout = true
        elseif math.abs(amount) < 0.1 and axis_timeout then
            axis_timeout = false
        end
    end
end

function love.draw(screen)
    love.graphics.setFont(font)
    
    if screen ~= "bottom" then
        local depth = -love.graphics.getDepth()
        if screen == "right" then
            depth = -depth
        end

        -- scroll camera if the print_buffer would be offscreen
        love.graphics.translate(0, math.min(0, 240 - 16 - #print_buffer * font_line_height))
        local line = 8
        for _, text in pairs(print_buffer) do
            love.graphics.printf(text, 8 - depth * 6, line, 400 - 16, "center")
            line = line + font_line_height
        end
    else
        --love.graphics.print(string.format("%.2f mb", collectgarbage("count") / 1000), 10, 10)
        if #active_choice ~= 0 then
            local color = (ant_sim_color_palette and colors.bright_cyan or colors.cyan)

            local total_lines = 0
            local wrapped_lines = {}
            for i, choice in pairs(active_choice) do
                local _, choice = font:getWrap(choice, 320 - (8 * 4 + choice_horizontal_offset) * 2)
                total_lines = total_lines + #choice
                wrapped_lines[i] = choice
            end

            local line = 120 - (font_line_height / 2) * total_lines -- 120 is midpoint, subtract half of line height for each line to center

            for i = 1, #active_choice do
                if i == hovered_answer then
                    love.graphics.print({color, ">>"}, 8 + choice_horizontal_offset, line)
                end

                local choice = wrapped_lines[i]
                love.graphics.print({color, "[" .. i .. "] " .. choice[1]}, 8 * 4 + choice_horizontal_offset, line)

                for _, touch in pairs(touches) do
                    if touch.y >= line and touch.y <= line + font_line_height * (#choice + 1) then
                        hovered_answer = i
                        answer = i
                    end
                end

                line = line + font_line_height
                for j = 2, #choice do
                    love.graphics.print({color, choice[j]}, 8 * 4 + choice_horizontal_offset, line)
                    line = line + font_line_height
                end
            end
        end
    end
end

function love.update(dt)
    config.update_event_queue(dt)
    if is_quitting then quit_timer = quit_timer + dt end
    if quit_timer > 0.25 then love.event.quit() end

    if waiting_for_input then
        for _ in pairs(touches) do
            answer = 1
            break
        end
    end

    while 240 - 8 - #print_buffer * font_line_height + font_line_height < 0 do
        table.remove(print_buffer, 1)
    end
end
