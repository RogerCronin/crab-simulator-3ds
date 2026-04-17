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
12 - quarantineVibes.1.py Going outside
13 - prisonersDilemma.py Prison time
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
        else
            print("Encountered event code " .. event[1])
            print(event)
            love.event.quit()
        end
    end

    event_ticker = event_ticker + dt
end

function water_works.sleep_event(time)
    event_queue[#event_queue + 1] = {0, time}
end

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

function water_works.runner_event(f)
    event_queue[#event_queue + 1] = {4, f}
end

-- wait is how long to sleep before next event, default 0.5
-- text speed is how long one (normal) letter takes to print, default 0.04
-- slow text should be 0.06, fast text should be 0.02
function water_works.fprintf(string, color, wait, text_speed)
    color = color or colors.white
    wait = wait or 0.5
    text_speed = text_speed or 0.04

    local _, string = font:getWrap(string, 384) -- 400 px - (8 px on each side)

    if color == "rainbow" then
        rainbow_print(string, text_speed)
    else
        for i = 1, #string do
            water_works.add_new_line_to_print_buffer_event("", color)

            local line = string[i]

            for i = 1, #line do
                local char = line:sub(i, i)
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

    water_works.sleep_event(wait)
end

return water_works