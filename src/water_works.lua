local water_works = {}

--[[ LIST OF DEATHS
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

function water_works.fprintf(string, color, wait, text_speed)
    wait = wait or 0.5
    text_speed = text_speed or 0.04

    -- TODO text wrap string here

    if color == "rainbow" then
        rainbow_print(string, text_speed)
    else
        
    end
end

return water_works