local config = require("water_works")
local fprint = config.fprintf
local choice = config.choice
local run = config.run

local days = {}

function days.m_old_guy_drugs_1()
end

function days.m_old_guy_drugs_2()
end

function days.m_old_guy_drugs_3()
end

function days.m_presidential_campaign_1()
end

function days.m_presidential_campaign_2()
end

function days.m_presidential_campaign_3()
end

function days.m_robbery_time_1()
end

function days.m_robbery_time_2()
end

function days.m_robbery_time_3()
end

function days.m_robbery_time_4()
end

function days.m_robbery_time_5()
end

function days.m_robbery_time_6()
end

function days.m_soccer_practice_1()
end

function days.m_soccer_practice_2()
end

function days.m_soccer_practice_3()
end

function days.burn_witch()
end

function days.cooking_competition()
end

function days.crab_exam()
end

function days.depression()
end

function days.first_contact()
end

function days.fisherman()
end

function days.forward_scuttle()
end

function days.game_show()
end

function days.old_man()
end

function days.panera_bread_giftcard()
end

function days.peer_pressure()
end

function days.pirates()
end

function days.prawn_shop()
end

function days.prisoners_dilemma()
end

function days.purchase_some_goods()
end

function days.random_hot_crab()
end

function days.taste_testing()
end

function days.wrong_secret_agent()
end

function days.c_broom_hospital()
    fprint("You wound up in the hospital following your tragic magical getaway.\n", "dim")
    fprint("I'm sorry, but I can't submit \"flying broom stick accident\" to insurance claims.", "yellow")
    fprint("Says the doctor in your hospital room.\n", "dim", 1)
    fprint("I'm afraid you'll have to pay the full amount of 15 dollars.\n", "yellow", 1)
    
    choice({"Pay up", "Bribe the doctor"})
    run(
        function ()
            if answer == 1 then
                fprint("Fine, but you're no fun.\n", "cyan")
                fprint("Or so I've heard.\n", "yellow")
                fprint("You're now 15 bucks short. I guess. That's cool.\n", "dim", 1)

                fprint("15 bucks - 1", "rainbow", 1)
                fprint("Goodness + 1", "rainbow", 1)
                fprint("Experience + 1\n", "rainbow", 2)
                config.personality = config.personality + 1
                config.experience = config.experience + 1
            else
                fprint("Could my good friend Mr. Andrew Jackson here change your mind?", "cyan")
                fprint("You say to the doctor.\n", "dim", 1)
                fprint("Is that a 20 dollar bill?\n", "yellow")
                fprint("Do you accept my bribe?\n", "cyan")
                fprint("I... yes.", "yellow")
                fprint("The doctor responds.\n", "dim", 1)

                fprint("20 bucks - 1", "rainbow", 1)
                fprint("Badness + 1", "rainbow", 1)
                fprint("Experience + 1\n", "rainbow", 2)
                config.personality = config.personality - 1
                config.experience = config.experience + 1
            end
        end
    )
end

function days.c_crab_exam_death()
end

function days.c_cringe_narrator()
end

function days.c_hot_crab_second_meeting()
end

function days.c_president_resign()
end

function days.c_president_stay()
end

function days.c_supermarket_pirate()
end

return days