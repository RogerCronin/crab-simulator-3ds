local utf8 = require("utf8")

local water_works = {}

--[[
LIST OF DEATHS
01 - depression.py Crab suicide
02 - burnWitch.py Burnt to a crisp
03 - oldGuyDrugs.2.py Oyster-piod overdose
04 - $chainDays.cringeNarrator.py Cringed to death
05 - oldGuyDrugs.2.py M'shark-er fume overdose
06 - robberyTime.3.py Buff crab beat up
07 - oldGuyDrugs.2.py Apartment flooding
08 - $chainDays.crabExamDeath.py Not licensed to crab
09 - cookingCompetition.py Automobile gakked you
10 - $chainDays.presidentStay.py Assassination
11 - fisherman.py Cooked and eaten
12 - crushed by a piano L
13 - prisonersDilemma.py Prison time
14 - sword art online (holy)
15 - annoyed
16 - secret meeting
]]

water_works.debug = false -- skips menus
water_works.days = 0
water_works.experience = 0
water_works.personality = 0 -- positive good
water_works.state = 0 -- 0 = alive, -1 = win, string = death message
water_works.message = 0 -- used to communicate short term bewteen days, typically with multidays

--[[
{0, time} -- sleep for time
{1, string, color} -- add new line to print buffer
{2, string} -- append to last line of print buffer
{2, string, color} -- append to last line of print buffer
{3} -- clear screen
{4, function} -- runs function
{5, options} -- choice
{5, options, function} -- choice, then runs function after
{6} -- wait for input A
{7, asset}
]]
local event_ticker = 0
function water_works.update_event_queue(dt)
    while #event_queue ~= 0 do
        local event = event_queue[1]

        if event[1] == 0 then -- sleep event
            if event_ticker >= event[2] then -- enough time has elapsed
                event_ticker = 0
                table.remove(event_queue, 1)
            else
                break -- don't keep processing events, we're still sleeping
            end
        elseif event[1] == 1 then -- add new line event
            event_ticker = 0
            print_buffer[#print_buffer + 1] = {event[3], event[2]}
            table.remove(event_queue, 1)
        elseif event[1] == 2 then -- append to line event
            event_ticker = 0
            if event[3] then -- {2, string, color}
                table.insert(print_buffer[#print_buffer], event[3])
                table.insert(print_buffer[#print_buffer], event[2])
            else -- {2, string}
                local last_line = print_buffer[#print_buffer]
                print_buffer[#print_buffer][#last_line] = last_line[#last_line] .. event[2]
            end
            table.remove(event_queue, 1)
        elseif event[1] == 3 then -- clear event
            event_ticker = 0
            print_buffer = {}
            table.remove(event_queue, 1)
        elseif event[1] == 4 then -- runner event
            event_ticker = 0
            event[2]()
            table.remove(event_queue, 1)
        elseif event[1] == 5 then -- choice event
            local color = (ant_sim_color_palette and colors.bright_cyan or colors.cyan)
            event_ticker = 0
            if #active_choice == 0 then -- set the choices
                active_choice = event[2]
                answer = 0
                hovered_answer = 1

                local answer_text = "[" .. hovered_answer .. "] " .. event[2][hovered_answer] .. "\n"
                local _, strings = font:getWrap(answer_text, 384)
                event[4] = #strings
                for i = 1, #strings do
                    print_buffer[#print_buffer + 1] = {color, strings[i]}
                end
            elseif answer ~= 0 then -- we've selected an answer
                for i = 0, event[4] - 1 do
                    table.remove(print_buffer, #print_buffer)
                end
                local answer_text = "[" .. hovered_answer .. "] " .. event[2][hovered_answer] .. "\n"
                local _, strings = font:getWrap(answer_text, 384)
                if not nest then strings[#strings + 1] = "" end -- 3ds wrapping fix
                event[4] = #strings
                for i = 1, #strings do
                    print_buffer[#print_buffer + 1] = {color, strings[i]}
                end

                active_choice = {}
                if event[3] then event[3]() end
                table.remove(event_queue, 1)
            else -- still waiting on an answer
                for i = 0, event[4] - 1 do
                    table.remove(print_buffer, #print_buffer)
                end
                local answer_text = "[" .. hovered_answer .. "] " .. event[2][hovered_answer] .. "\n"
                local _, strings = font:getWrap(answer_text, 384)
                if not nest then strings[#strings + 1] = "" end -- 3ds wrapping fix
                event[4] = #strings
                for i = 1, #strings do
                    print_buffer[#print_buffer + 1] = {color, strings[i]}
                end

                break
            end
        elseif event[1] == 6 then -- wait for input event
            event_ticker = 0
            if not waiting_for_input then
                waiting_for_input = true
                answer = 0
            elseif answer ~= 0 then
                waiting_for_input = false
                table.remove(event_queue, 1)
            else
                break
            end
        elseif event[1] == 7 then
            event_ticker = 0
            love.audio.play(event[2])
            table.remove(event_queue, 1)
        else
            print("Encountered event code " .. event[1])
            print(event)
            love.event.quit()
        end
    end

    event_ticker = event_ticker + dt
    if speed_up then event_ticker = event_ticker + dt end -- twice the dt, twice the fun
    if speed_up and water_works.debug then event_ticker = event_ticker + dt * 3 end -- 5x when debug
end

function water_works.sleep_event(time)
    event_queue[#event_queue + 1] = {0, time}
end

water_works.sleep = water_works.sleep_event

function water_works.add_new_line_to_print_buffer_event(string, color)
    event_queue[#event_queue + 1] = {1, string, color}
end

function water_works.append_to_print_buffer_event(string, color)
    if color then
        event_queue[#event_queue + 1] = {2, string, color}
    else
        event_queue[#event_queue + 1] = {2, string}
    end
end

function water_works.clear_event()
    event_queue[#event_queue + 1] = {3}
end

water_works.clear = water_works.clear_event

function water_works.runner_event(f)
    event_queue[#event_queue + 1] = {4, f}
end

water_works.run = water_works.runner_event

function water_works.choice_event(options, f)
    if not f then
        event_queue[#event_queue + 1] = {5, options}
    else
        event_queue[#event_queue + 1] = {5, options, f}
    end
end

water_works.choice = water_works.choice_event

function water_works.wait_for_input_event()
    event_queue[#event_queue + 1] = {6}
end

water_works.wait_for_input = water_works.wait_for_input_event

function water_works.play_sound_event(audio)
    local source = love.audio.newSource(audio, "static")
    event_queue[#event_queue + 1] = {7, source}
    return source
end

water_works.play_sound = water_works.play_sound_event

function water_works.pause()
    water_works.fprintf("Press A", colors.dim, 0, 0)
    water_works.wait_for_input()
end

-- wait is how long to sleep before next event, default 0.5
-- text speed is how long one (normal) letter takes to print, default 0.04
-- slow text should be 0.06, fast text should be 0.02
function water_works.fprintf(text, color, wait, text_speed)
    color = color or colors.white
    wait = wait or 0.5
    text_speed = text_speed or 0.04

    local _, wrapped_text = font:getWrap(text, 384) -- 400 px - (8 px on each side)
    if not nest and string.sub(text, -1) == "\n" then wrapped_text[#wrapped_text + 1] = "" end -- on 3ds, getWrap with trailing \n doesn't make a new line

    if color == "rainbow" then
        rainbow_print(wrapped_text, text_speed)
    else
        if type(color) == "string" then
            color = water_works.convert_color(color)
        end

        for i = 1, #wrapped_text do
            water_works.add_new_line_to_print_buffer_event("", color)

            local line = wrapped_text[i]

            for char in line:gmatch(utf8.charpattern) do
                if char == "\a" then
                    water_works.append_to_print_buffer_event(".")
                    water_works.sleep_event(text_speed)
                elseif char == "\b" then
                    water_works.append_to_print_buffer_event("!")
                    water_works.sleep_event(text_speed)
                elseif char == "\t" then
                    water_works.append_to_print_buffer_event("?")
                    water_works.sleep_event(text_speed)
                elseif char == "\v" then
                    water_works.append_to_print_buffer_event(";")
                    water_works.sleep_event(text_speed)
                elseif char == "\f" then
                    water_works.append_to_print_buffer_event(",")
                    water_works.sleep_event(text_speed)
                elseif char == "\r" then
                    water_works.append_to_print_buffer_event(":")
                    water_works.sleep_event(text_speed)
                else
                    water_works.append_to_print_buffer_event(char)
                    if text_speed ~= 0 then
                        if (
                            char == "." or
                            char == "!" or
                            char == "?" or
                            char == ";"
                        ) then
                            water_works.sleep_event(0.5)
                        elseif (
                            char == "," or
                            char == ":"
                        ) then
                            water_works.sleep_event(0.25)
                        else
                            water_works.sleep_event(text_speed)
                        end
                    end
                end
            end
        end
    end

    water_works.sleep_event(wait)
end

function rainbow_print(string, text_speed)
    local rainbow_list = nil
    if ant_sim_color_palette then
        rainbow_list = {colors.light_yellow, colors.bright_green, colors.bright_blue, colors.pink, purple, colors.bright_red, colors.bright_yellow}
    else
        rainbow_list = {colors.red, colors.orange, colors.yellow, colors.green, colors.blue, colors.purple}
    end
    local rainbow_int = math.random(#rainbow_list)

    for i = 1, #string do
        water_works.add_new_line_to_print_buffer_event("", colors.white)

        local line = string[i]

        for char in line:gmatch(utf8.charpattern) do
            water_works.append_to_print_buffer_event(char, rainbow_list[rainbow_int])
            rainbow_int = rainbow_int + 1
            if rainbow_int > #rainbow_list then rainbow_int = 1 end

            if text_speed ~= 0 then
                if (
                    char == "." or
                    char == "!" or
                    char == "?" or
                    char == ";"
                ) then
                    water_works.sleep_event(0.5)
                elseif (
                    char == "," or
                    char == ":"
                ) then
                    water_works.sleep_event(0.25)
                else
                    water_works.sleep_event(text_speed)
                end
            end
        end
    end
end

function water_works.random_death()
    local random_death_list = {
        "as a crab",
        "from carbon monoxide poisoning",
        "from really bad Chinese food",
        "from COVID-19",
        "from fall damage",
        "in the trenches",
        "in a compromising position",
        "trying to commit suicide",
        "through reading this message",
        "in an online game of Chess",
        "in your favorite battle royale videogame",
        "in a TLS handshake",
        "in an automobile accident",
        "as a Kurdish freedom fighter",
        "from a gluten overdose",
        "in a candle factory fire",
        "trying to pursue the American Dream",
        "caught up in the grimy criminal underworld of urban Wyoming",
        "as an ant",
        "from an angry weasel",
        "in a \"suicide\"",
        "from good, clean, fun",
        "in the Boston Massacre",
        "on the electric char", 
        "from a series of tragic miscommunications",
        "in a game of Russian Roulette",
        "in a battle of wits"
    }
    return random_death_list[math.random(#random_death_list)]
end

function water_works.random_greeting()
    local random_greeting_list = {
        "Let's get into it, yeah?",
        "You ready?",
        "Check me out on Bandcamp!",
        "Now with extra days!",
        "*snip snap snip snap snip snap*",
        "My claws are clicking \"I love you\" in Morse code.",
        "Let's get kraken!",
        "I'm so excited yay",
        "Yippee!",
        "Now sugar free!",
        "Now with extra sugar!",
        "Now on the 3DS!",
        "As seen on TV!",
        "Only on Disney Channel!",
        "Oh man you're gonna love this",
        "It's finger-lickin' good",
        "Now sodium free!",
        "Now vegan!",
        "Featuring Dante from the Devil May Cry Series",
        "Brace yourself...",
        "Get ready..."
    }
    return random_greeting_list[math.random(#random_greeting_list)]
end

function water_works.random_goodbye()
    local random_goodbye_list = {
        "See ya later!",
        "Bye bye!",
        "I'll catch you on the flip side",
        "Trying to quit? After I've done for you?",
        "Ok fine I'll quit the game",
        "You think you know someone, then they up and quit on you...",
        "Hasta luego",
        "Til next time",
        "Farewell...",
        "I bid you adieu",
        "Ciao"
    }
    return random_goodbye_list[math.random(#random_goodbye_list)]
end

function water_works.random_restart()
    local random_restart_list = {
        "Let's make this one count",
        "yaaaayyyy",
        "Woohoo!",
        "Don't fuck it up!",
        "Alright, but just this once...",
        "Goin back in time woah",
        "Rewind!!",
        "Do better. BE better.",
        "Make better decisions, please?",
        "Try harder this time!"
    }
    return random_restart_list[math.random(#random_restart_list)]
end

function water_works.convert_color(color)
    if color == "dim" then return colors.dim
    elseif color == "red" then return colors.red
    elseif color == "yellow" then return colors.yellow
    elseif color == "green" then return colors.green
    elseif color == "blue" then return colors.blue
    elseif color == "purple" then return colors.purple
    elseif color == "cyan" then return colors.cyan
    elseif color == "orange" then return colors.orange
    elseif color == "light_yellow" then return colors.light_yellow
    elseif color == "pink" then return colors.pink
    elseif color == "black" then return colors.black
    else return colors.white
    end
end

function water_works.day_plural()
    if water_works.days == 1 then
        return "day"
    else
        return "days"
    end
end

function water_works.generate_queue()
    local queue_list = {
        "m_old_guy_drugs_1",
        "m_presidential_campaign_1",
        "m_robbery_time_1",
        "m_soccer_practice_1",
        "burn_witch",
        "cooking_competition",
        "crab_exam",
        "depression",
        "first_contact",
        "fisherman",
        "forward_scuttle",
        "game_show",
        "old_man",
        "panera_bread_giftcard",
        "peer_pressure",
        "pirates",
        "prawn_shop",
        "prisoners_dilemma",
        "random_hot_crab",
        "taste_testing",
        "wrong_secret_agent",
        "slide_whistle",
        "ant_simulator",
        "online_salt"
    }
    queue_list = water_works.shuffle(queue_list)
    return queue_list
end

-- taken from https://gist.github.com/Uradamus/10323382 shoutout
function water_works.shuffle(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
    return tbl
end

function water_works.get_file(name, file_type)
    if file_type == "ttf" then
        return (nest and name .. ".ttf" or name .. ".bcfnt")
    elseif file_type == "png" then
        return (nest and nest .. ".png" or name .. ".tex")
    end
end

return water_works
