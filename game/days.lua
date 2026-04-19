local config = require("water_works")
local fprint = config.fprintf
local choice = config.choice
local run = config.run

local days = {}

function days.m_old_guy_drugs_1()
    fprint("It's a sunny afternoon. You're walking through the shady part of town when you notice an old crab leaning against a wall.\n", "dim", 1)

    local geezerResponses = {"scram why don'tcha.", "whaddya lookin at, eh?", "you're lookin a little red for this neighborhood, huh?"}
    fprint("Oi, kid, " .. geezerResponses[math.random(#geezerResponses)] .. "\n", "yellow", 0.5, 0.06)

    fprint("All of a sudden, the crab collapses onto the ground.\n", "dim")

    fprint("Ow FUCK, a heart attack!\n", "yellow", 0.5, 0.06)
    fprint("You run up to the crab and say", "dim", 0)
    fprint("Oh shit, you good dude?\n", "cyan")

    fprint("I'm dying, kid. Please, continue on my legacy of selling drugs.\n", "yellow", 0.4, 0.06)
    fprint("Wha-\n", "cyan", 0.1)
    fprint("My forefathers started selling ketamine fresh off the boat from Ireland. My grandfather taught my own father how to cook meth. And hi-\n", "yellow", 1.5, 0.06)
    fprint("Oof he died.\n", "dim", 1)
    fprint("Well fuck, looks like you gotta do it now.\n", "green", 1)

    fprint("After a bit of searching through the contents of his satchel, you find his stash of oyster-piods and decide to start your new fledgling business tomorrow.\n", "dim")

    fprint("Look at you go, you little entrepreneur!\n", "green", 1)

    fprint("Drugs + 9", "rainbow", 1)
    fprint("Experience + 1\n", "rainbow", 2)
    config.experience = config.experience + 1

    table.insert(queue, "m_old_guy_drugs_2")
    config.run(end_of_day)
end

function days.m_old_guy_drugs_2()
    fprint("Ok, so, oyster-piods, who even buys these?\n", "cyan")
    fprint("The oyster-piods are sitting on your table, dripping with a quiet menace.", "dim", 1.5)
    fprint("You take a small white pill out of the brown paper bag.\n", "dim")
    fprint("Such a small little thing... what's all the fuss about?\n", "cyan")
    fprint("Idk man, they seem pretty popular tho.\n", "green")

    choice({"Pop some oyster-piods","Start making some snazzy posters for your new business", "Ignore the dying crab's wishes and do nothing"})
    run(
        function ()
            if answer == 1 then
                fprint("Mmm tasty.\n", "cyan", 2)
                fprint("But after 5 suspenseful minutes, nothing seems to happen.\n", "dim")
                fprint("Bro these oyster-piods ain't shit.\n", "cyan")
                fprint("You get up to throw the bag away, when suddenly...\n", "dim")
                fprint("O h  s h i t\n", "rainbow")
                fprint("bRoo w         t f \n", "rainbow", 0.7)
                fprint("ohh h noou\n", "rainbow", 3)
                config.state = "Turns out the recommended dosage of oyster-piods for a first time user is only 200 milli-clams, better luck next time.03"
                config.run(end_of_day)
            elseif answer == 2 then
                fprint("Shucks, I'm getting ahead of myself, I better start advertising if I hope to sell this stuff.\n", "cyan")
                fprint("---1 trip to Staples later---\n", "dim", 2, 0)
                fprint("Okay, I think I have everything.\n", "cyan")
                fprint("What to use?\n", "green")

                choice({"M'shark-er: +1 Brightness, +3 Huffability", "Cray-on: +1 Brightness, -2 Dignity"})
                run(
                    function ()
                        if answer == 1 then
                            fprint("M'shark-ers, good choice.\n", "green")
                            fprint("You uncap the suckers and go to town.\n", "dim")
                            fprint("Ah shit, what's happening??\n", "cyan", 0)
                            fprint("Is what you say as your apartment fills with noxious m'shark-er fumes.\n", "dim", 2)
                            config.state = "Have comfort in knowing your last few moments were spent in pure ecstasy, high on shitty m'shark-er gas.05"
                            config.run(end_of_day)
                        elseif answer == 2 then
                            fprint("Cray-ons? What are you, five?\n", "green")
                            fprint("What even ever man.\n", "cyan")
                            fprint("Oh sorry.\n", "green")
                            fprint("You spend the rest of the day on your floor with cray-ons and poster board.\n", "dim")
                            fprint("Oh boy, all the other drug dealers are gonna be sooo jealous of my posters!", "cyan", 0)
                            fprint("You think as you drift off to sleep.\n", "dim", 1)

                            fprint("Posters + 3\n", "rainbow", 1)
                            table.insert(queue, "m_old_guy_drugs_3")
                            config.run(end_of_day)
                        end
                    end
                )
            else
                fprint("No, no, I shouldn't do this.\n","cyan")
                fprint("You grab the paper bag and flush the pills down the toilet.\n", "dim")
                fprint("Ah, underwater plumbing, what an invention.\n", "cyan")
                fprint("Oh, right, bro doesn't know. Watch this lmao.\n", "green")
                fprint("Suddenly, the underwater toilet starts to overflow.\n", "dim")
                fprint("For fucks sake, where's the plunger?\n", "cyan")
                fprint("The water level in your apartment has reached your knees.\n", "dim", 0.3)
                fprint("Oh god, oh fuck...\n", "cyan", 0.1)
                fprint("The mixture of oyster-piods and water have slowed your movements.\n", "dim")
                fprint("God clam-it.", "cyan", 0)
                fprint("Is the last thing you muster out before your head is swept underwater.\n", "dim", 2)
                config.state = "It would seem that crabs would prefer to have their dying wishes carried out. Keep that in mind.07"
                config.run(end_of_day)
            end
        end
    )
end

function days.m_old_guy_drugs_3()
    fprint("You wake up bright and early, excited to hang up your awesome posters.\n", "dim")
    fprint("You put them up haphazardly along the way to the back of an alley where you set up shop.", "dim", 1)
    fprint("Before long, a shady red crab shuffles in.\n", "dim")
    fprint("H-h-h-hey man I saw your posters, p-pretty cool.\n", "yellow")
    fprint("Hey, that's awesome. Thanks man.\n", "cyan")
    fprint("N-n-no problem. So, you s-still selling for the price on the p-posters?\n", "yellow")
    fprint("Yes sir, two pills a buck.\n", "cyan")
    fprint("A-a-alright man I'll take all of 'em!\n", "yellow")
    fprint("At this point a line of equally-as-shady crabs have formed a queue stretching onto the sidewalk.\n", "dim")
    fprint("All of them? Sure thing! Man, that sure was easy.\n", "cyan")
    fprint("As you walk out, you hear the ghost of the old crab trying to tell you the average going rate, but you're way too excited to notice.\n", "dim")
    fprint("Oyster-piods - 9", "rainbow", 1)
    fprint("Money + 9", "rainbow", 1)
    fprint("Experience + 1\n", "rainbow", 2)
    config.experience = config.experience + 1
    config.personality = config.personality + 1
    config.run(end_of_day)
end

function days.m_presidential_campaign_1()
    fprint("No, there's NO way that happened, Carlos.\n", "cyan", 1)
    fprint("You're driving down the highway talking to your buddy Carlos on your shellphone.\n", "dim", 1)
    fprint("She did NOT!", "cyan", 1)
    fprint("Oh my god, WHO?", "cyan", 1)
    fprint("I can't believe that could- OH SHIT\n", "cyan", 0)
    fprint("CRAAAAAAAAASSSSSHHHHhhhhh\n", "red", 3)
    fprint("You were airlifted to a hospital where a team of highly skilled crabs performed a life saving operation on you.\n", "dim", 2)
    fprint("Thanks for saving my life, doc. I owe you one.\n", "cyan", 1)
    fprint("No need as long as you pay your bill of 250\f000 pesos, my friend.\n", "yellow", 1)
    fprint("When you were reincarnated " .. config.days .. " " .. config.day_plural() .. " ago, you forgot to buy health insurance.\n", "dim", 1)
    fprint("Quick, what's the fastest way to get money as a crab?\n", "green", 2)
    fprint("...", "cyan")
    fprint("I got it. I'll win the presidential election and use my new fangled powers to embezzle money from the National Mint and pay off my debt!\n", "cyan", 2)
    fprint("Um. Sure, buddy.\n", "green", 1)
    fprint("You sign up for the elections on your way home and heat up some can soup for dinner.\n", "dim", 1)
    fprint("Debt + 250000 plus interest", "rainbow", 1)
    fprint("Experience + 1\n", "rainbow", 2)
    config.experience = config.experience + 1
    table.insert(queue, "m_presidential_campaign_2")
    config.run(end_of_day)
end

function days.m_presidential_campaign_2()
    fprint("You wake up to a bright, sunny day full of opportunity.\n", "dim", 1)
    fprint("Right, now how will you start your campaign?\n", "green")

    choice({"Call up your parents and ask them to vote for you", "Go outside with a sign", "@everyone on your Discord server telling them to vote"})
    config.run(
        function ()
            if answer == 1 then
                fprint("You whip out your phone and dial your parents' home number, +1 (302) 294-0795.\n", "dim", 1)
                fprint("Riiiing. Riiiiiiiiing. Riiiiiiiiiiiiiiiiiing.\n", "red")
                fprint("Hello?\n", "yellow", 1)
                fprint("Hi Mom, I'm running for president. Do you think you could vote for me?\n", "cyan")
                fprint("Sure thing sweetie. I'm so proud of you!\n", "yellow")
                fprint("Aww, doesn't that just put a smile on your face?\n", "green", 1)
                fprint("Voters + 2\n", "rainbow", 2)
                config.run(end_of_day)
            elseif answer == 2 then
                fprint("You whip out your pen-seal.. sorry, was that too much of a stretch? Anyway, you whip out your pencil and craft up a spicy design.\n", "dim", 1)
                fprint("Ay, fellas, vote for me! I'm running for president!", "cyan", 0)
                fprint("You call out to passersby.\n", "dim", 1)
                fprint("Hey, what are your policies?", "yellow", 0)
                fprint("Some fish asks you.\n", "dim", 1)
                choice({"Crab care reform", "Increased minimum crab", "Anti-crab-ruption"})
                config.run(
                    function ()
                        if answer == 1 then
                            fprint("I'm all about crab care reform.\n", "cyan", 1)
                        elseif answer ==2 then
                            fprint("I'm all about increasing minimum crab.\n", "cyan", 1)
                        else
                            fprint("I'm all about finding crab-ruption in the government.\n", "cyan", 1)
                        end
                    fprint("Oh, dope. You got my vote.\n", "yellow", 2)
                    fprint("You expain your policies to a couple more aquatic animals. A handful seem interested in your platform.\n", "dim", 1)
                    fprint("Voters + 45\n", "rainbow", 2)
                    end
                )
            else
                fprint("You whip out your phone and send a message real quick informing them of your campaign.\n", "dim", 1 )
                fprint("[CrabbyMan] : @everyone, Im running for president so you guys should vote for me thanks", "white", 5, 0)
                fprint("[OldBayStan] : ok buddy", "white", 2, 0)
                fprint("[JohnnyFisher] : ya\n", "white", 2, 0)
                fprint("Looks like you convinced a few people to vote for you.\n", "dim", 1)
                fprint("Voters + 15\n", "rainbow", 2)
            end

            config.days = config.days + 6 -- time skip a week
            table.insert(queue, "m_presidential_campaign_3")
            config.run(end_of_day)
        end
    )
end

function days.m_presidential_campaign_3()
    fprint("---1 Week of Campaigning Later---\n", "dim", 2, 0)
    fprint("Look alive! Today is voting day, where all of the animals under the sea gather to vote on a new leader.\n", "dim", 2)
    fprint("You managed to gather over 500 guys to vote for you! Not like it matters tho cuz you're running unopposed. Turns out the last guy got slimed out, the monarchy doesn't like \"democratic institutions\" or something?\n", "green", 2)
    fprint("I hereby grant you the title of President, my good sir!", "yellow", 0)
    fprint("Some dude on a stage says to you.\n", "dim", 1)
    fprint("As the crowd cheers, you start thinking about how you'll go through with your plan.\n", "dim", 1)
    fprint("Hello? Is this the National Mint?", "cyan", 0)
    fprint("You speak into your phone.\n", "dim", 1)
    fprint("Yes, hello Mr\a President. What would you like?\n", "yellow")
    fprint("Could you route 250\f000 pesos into my personal bank account for me?\n", "cyan", 1)
    fprint("Isn't that ille-\n", "yellow", 0)
    fprint("Did I stutter?\n", "cyan", 2)
    fprint("Uh, sure thing Mr\a President.\n", "yellow", 2)
    fprint("This whole President thing has a lot of power... Do I really want to resign immediately after this?\n", "cyan")

    choice({"Resign", "Stay"})
    run(function ()
        if answer == 1 then
            fprint("Alas, I don't care.\n", "cyan", 1)
            fprint("Debt - 250000 minus interest\n", "rainbow", 2)
            table.insert(queue, "c_president_resign")
            run(end_of_day)
        else
            fprint("Heh. Hahahah. HahahahHAHAhahaHAha.\n", "cyan", 1)
            fprint("Debt - 250000 minus interest", "rainbow", 2)
            fprint("Power tripping + 56\n", "rainbow", 2)
            table.insert(queue, "c_president_stay")
            run(end_of_day)
        end
    end)
end

function days.m_robbery_time_1()
    fprint("You spot your favorite hot dog stand, The Wacky Dawg, just across the street.\n", "dim", 1)
    fprint("Oh hey, I guess I could go for a bite to e-\n", "cyan", 0)
    fprint("YO KID, OVER HERE.", "yellow")
    fprint("A weasel calls from by the water.\n", "dim", 2)
    fprint("Huh? Me?\n", "cyan", 0)
    fprint("AY, YEAH YOU, OVER HERE.\n", "yellow", 1)
    fprint("You walk over to the weasel.\n", "dim", 1)
    fprint("Yeah man?\n", "cyan")
    fprint("You wanna rob that bank over there? I gotta have a \"partner in crime\" or I'll never make it in the criminal underworld of this beachside resort.\n", "yellow")

    choice({"Yeah let's go", "Nah man that's not me anymore"})
    run(function ()
        if answer == 1 then
            fprint("You got it.\n", "cyan")
            fprint("The two of you walk into the bank.\n", "dim", 1)
            fprint("HANDS IN THE AIR!\n", "yellow")
            fprint("Everyone's hands shoot up. The weasel walks over to the bank teller while you stand by the front door.\n", "dim", 2)
            fprint("Weeee woooo. Weeee woooooooo. Weeeeeeeee wooo.\n", "red", 1)
            fprint("Shit! The cops are here. Take this and scram.\n", "yellow")
            fprint("The weasel hands you four bags with dollar bill signs on them.", "dim", 2)
            fprint("You hightail it out of there money in hand til you end up at your apartment.\n", "dim")
            fprint("Whew. That was a close one, yeah?\n", "cyan", 1)
            fprint("Money + 1600525", "rainbow", 1)
            fprint("Badness + 1", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience 1
            config.personality = config.personality - 1
            config.message = "y"
            table.insert(queue, "m_robbery_time_2")
            run(end_of_day)
        else
            fprint("Nah, I'm not lookin to do anything illegal today.", "cyan")
            fprint("Thanks tho.\n", "cyan", 1)
            fprint("Oh well, that's a shame. I'll just list you as an accomplice tomorrow when I'm arrested.\n", "yellow")
            fprint("Bullshit.\n", "cyan")
            fprint("Try me.\n", "yellow")
            fprint("You walk home and reheat some curry for dinner.\n", "dim", 1)
            fprint("Sense of foreboding + 4", "rainbow", 1)
            fprint("Goodness + 1", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            config.personality = config.personality + 1
            config.message = "n"
            table.insert(queue, "m_robbery_time_2")
            run(end_of_day)
        end
    end)
end

function days.m_robbery_time_2()
    fprint("You wake up to a group of policecrabs shouting orders through a megaphone.\n", "dim", 1)
    fprint("YOU'RE WANTED FOR THE BANK ROBBERY YESTERDAY! COMPLY AND WE WON'T USE FORCE!\n", "yellow", 1)

    if config.message == "y": -- gakked
        fprint("Goddamnit. They caught me.\n", "cyan")
        fprint("Well what're you gonna do?\n", "green")
    else -- innocent ash
        fprint("That weasely fucker.\n", "cyan")
        fprint("Shit. What do you do?\n", "green")
    end

    choice({"Go outside with your claws up", "Peck shots through your window"})
    run(function ()
        if answer == 1 then
            fprint("YO! I'm coming outside with my claws up, unarmed.", "cyan")
            fprint("(or unclawed, heheh)", "dim", 0)
            fprint("You call out through your window.\n", "dim")
            fprint("Oh sweet bb. Thanks.\n", "yellow", 2)
        else
            config.message = "y"
            fprint("Yeah, fuck those guys.\n", "cyan", 1)
            fprint("You peek over the window with a slingshot, launching rocks at the policecrabs down below.\n", "dim", 1)
            fprint("POUND POUND POUND.", "red")
            fprint("SWAT TEAM, OPEN UP!\n", "yellow")
            fprint("Uh oh.\n", "cyan")
            fprint("A stream of at least 10 crabs race into your bedroom and arrest you.", "dim", 2)
        end

        fprint("Later...\n", "dim")
        fprint("Aight, you're definitely guilty. See ya later.", "blue")
        fprint("The judge says, leaving the courtroom.\n", "dim")
        fprint("Have fun in jail, buddy!\n", "yellow", 2)

        if config.message == "y" then
            fprint("Regret + 7", "rainbow", 1)
        else
            fprint("Belief in the legal system - 14", "rainbow", 1)
            fprint("Goodness + 1", "rainbow", 1)
            config.personality = config.personality + 1
        end
        fprint("Experience + 1\n", "rainbow", 1)
        config.experience = config.experience + 1
        table.insert(queue, "m_robbery_time_3")
        run(end_of_day)
    end)
end

function days.m_robbery_time_3()
    fprint("Wow, is this really your cell? This shit sucks.\n", "green", 1)
    fprint("You see two bunk beds, a table, and a sink resting on a grimy floor. Two other crabs are here. One appears to be playing a harmonica, but on closer inspection it's a few plastic straws taped together.\n", "dim", 1)
    fprint("Ay, you see that buff crab lifting weights by the table? It'd be real cool to assert your dominance. Go rough him up a bit.\n", "green")

    choice({"Show him a bit of da pincers", "Let it be"})
    run(function ()
        if answer == 1 then
            fprint("Hey, dude with the weights. You wanna tussle?", "cyan", 0)
            fprint("You ask the buff crab.\n", "dim")
            fprint("Sure, punk.\n", "yellow", 2)
            config.state = "He smashed you up good. Like, reeeaaal good. Probably should've paid attention when I called him a \"buff crab lifting weights\".06"
            run(end_of_day)
        else
            fprint("You called him a \"buff crab lifting weights\", so I think I'll pass.\n", "cyan")
            fprint("Pshhh no fun.", "green", 1)
            fprint("Well, grow accustomed to your new prison life. You'll be here for a few days.\n", "green")
            fprint("Will do.\n", "cyan", 1)
            fprint("School smarts - 1", "rainbow", 1)
            fprint("Street smarts + 1", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            table.insert(queue, "m_robbery_time_4")
            run(end_of_day)
        end
    end)
end

function days.m_robbery_time_4()
    fprint("It's movie night at the prison ward, and it's your turn to pick! What will you be watching?\n", "dim", 1)
    
    choice({"The Shape of Water", "Shark Tale", "Manchester by the Sea"})
    run(function ()
        if answer == 1 then
            fprint("Several inmates groan when you announce your decision. All are thoroughly uncomfortable by the time the film ends.\n", "dim", 1.5)
            fprint("Good job ig.\n", "green", 1)
            fprint("Taste in movies +- 1 depending on if you actually like that movie", "rainbow", 1)
        elseif answer == 2 then
            fprint("Boooo!", "yellow", 0)
            fprint("Some crab calls out when you announce your decision.\n", "dim", 1.5)
            fprint("---1 movie later---\n", "dim", 2, 0)
            fprint("I guess that wasn't bad...", "cyan", 0)
            fprint("You try to convince yourself. It's not working very well.\n", "dim", 2)
            fprint("Taste in movies - 1", "rainbow", 1)
        else
            fprint("Bro what even is this.", "yellow")
            fprint("Someone calls out.\n", "dim", 1)
            fprint("It seems some crabs are unhappy with your decision.\n", "dim", 1.5)
            fprint("By the end of the movie, all of the crabs are sobbing.\n", "dim", 1)
            fprint("Cmon guys it's really not that sad.", "green")
            fprint("The narrator says, trying to stay composed through the tears.\n", "dim", 1)
            fprint("Taste in movies + 2", "rainbow", 1)
        end
        fprint("Experience + 1\n", "rainbow", 2)
        config.experience = config.experience + 1
        table.insert(queue, "m_robbery_time_5")
        run(end_of_day)
    end)
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
                fprint("Could my good friend Mr\a Andrew Jackson here change your mind?", "cyan")
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
    fprint("In the early hours of the next day, you resign as President. This inconveniences many people.\n", "dim", 1)
    fprint("Great, mission accomplished.\n", "cyan", 1)
    fprint("Knowledge of how the government works - 1", "rainbow", 1)
    fprint("Experience + 1\n", "rainbow", 2)
    config.experience = config.experience + 1
    run(end_of_day)
end

function days.c_president_stay()
    fprint("A news anchor sits before the camera, ready to begin tonight's news coverage.\n", "dim", 1)
    fprint("Just hours after the official title was granted, our new president was stabbed 23 times in the back. No legal action will be taken, however, because everyone agrees he was really shitty.\n", "yellow", 2)
    config.state = "You flew to close to the sun, my dear Icarus. Blinded by your own hubris, you forgot you don't know how the government functions. Should've quit while you were ahead, bro.10"
    run(end_of_day)
end

function days.c_supermarket_pirate()
end

return days