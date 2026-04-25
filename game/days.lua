local config = require("water_works")
local audio_manager = require("audio_manager")

local fprint = config.fprintf
local choice = config.choice
local run = config.run
local pause = config.pause
local sleep = config.sleep
local clear = config.clear
local play_sound = config.play_sound

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

    table.insert(queue, 1, "m_old_guy_drugs_2")
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
                fprint("ờнĥ ħ ňỡỗự\n", "rainbow", 3)
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
                            table.insert(queue, 1, "m_old_guy_drugs_3")
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
    play_sound("assets/crash.ogg")
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
    table.insert(queue, 1, "m_presidential_campaign_2")
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
                play_sound("assets/ring.ogg")
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
                    fprint("You explain your policies to a couple more aquatic animals. A handful seem interested in your platform.\n", "dim", 1)
                    fprint("Voters + 45\n", "rainbow", 2)
                    end
                )
            else
                fprint("You whip out your phone and send a message real quick informing them of your campaign.\n", "dim", 1 )
                play_sound("assets/ping.ogg")
                fprint("[CrabbyMan] : @everyone, Im running for president so you guys should vote for me thanks", "white", 5, 0)
                play_sound("assets/ping.ogg")
                fprint("[OldBayStan] : ok buddy", "white", 2, 0)
                play_sound("assets/ping.ogg")
                fprint("[JohnnyFisher] : ya\n", "white", 2, 0)
                fprint("Looks like you convinced a few people to vote for you.\n", "dim", 1)
                fprint("Voters + 15\n", "rainbow", 2)
            end

            config.days = config.days + 6 -- time skip a week
            table.insert(queue, 1, "m_presidential_campaign_3")
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
            table.insert(queue, 1, "c_president_resign")
            run(end_of_day)
        else
            fprint("Heh. Hahahah. HahahahHAHAhahaHAha.\n", "cyan", 1)
            fprint("Debt - 250000 minus interest", "rainbow", 2)
            fprint("Power tripping + 56\n", "rainbow", 2)
            table.insert(queue, 1, "c_president_stay")
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
            play_sound("assets/siren.ogg")
            fprint("Weeee woooo. Weeee woooooooo. Weeeeeeeee wooo.\n", "red", 1)
            fprint("Shit! The cops are here. Take this and scram.\n", "yellow")
            fprint("The weasel hands you four bags with dollar bill signs on them.", "dim", 2)
            fprint("You hightail it out of there money in hand til you end up at your apartment.\n", "dim")
            fprint("Whew. That was a close one, yeah?\n", "cyan", 1)
            fprint("Money + 1600525", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            config.personality = config.personality - 1
            config.message = "y"
            table.insert(queue, 1, "m_robbery_time_2")
            run(end_of_day)
        else
            fprint("Nah, I'm not lookin to do anything illegal today.", "cyan")
            fprint("Thanks tho.\n", "cyan", 1)
            fprint("Oh well, that's a shame. I'll just list you as an accomplice tomorrow when I'm arrested.\n", "yellow")
            fprint("Bullshit.\n", "cyan")
            fprint("Try me.\n", "yellow")
            fprint("You walk home and reheat some curry for dinner.\n", "dim", 1)
            fprint("Sense of foreboding + 4", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            config.personality = config.personality + 1
            config.message = "n"
            table.insert(queue, 1, "m_robbery_time_2")
            run(end_of_day)
        end
    end)
end

function days.m_robbery_time_2()
    fprint("You wake up to a group of policecrabs shouting orders through a megaphone.\n", "dim", 1)
    fprint("YOU'RE WANTED FOR THE BANK ROBBERY YESTERDAY! COMPLY AND WE WON'T USE FORCE!\n", "yellow", 1)

    if config.message == "y" then -- gakked
        fprint("Goddamnit. They caught me.\n", "cyan")
        fprint("Well what're you gonna do?\n", "green")
    else -- innocent ash
        fprint("That weasely fucker.\n", "cyan")
        fprint("Shit. What do you do?\n", "green")
    end

    choice({"Go outside with your claws up", "Use your gun"})
    run(function ()
        if answer == 1 then
            fprint("YO! I'm coming outside with my claws up, unarmed.", "cyan")
            fprint("You call out through your window.\n", "dim")
            fprint("Oh sweet bb. Thanks.\n", "yellow", 2)
        else
            config.message = "y"
            fprint("Didn't know you had one of those.\n", "green")
            fprint("You peek over the window with your burner, sending shots at the policecrabs down below.\n", "dim", 1)
            play_sound("assets/pounding.ogg")
            fprint("POUND POUND POUND.\n", "red")
            fprint("SWAT TEAM, OPEN UP!\n", "yellow")
            fprint("Uh oh.\n", "cyan")
            fprint("A stream of at least 10 crabs race into your bedroom and arrest you.\n", "dim", 2)
            config.personality = config.personality - 1
        end

        fprint("Later...\n", "dim")
        fprint("Aight, you're definitely guilty. See ya later.", "blue")
        fprint("The judge says, leaving the courtroom.\n", "dim")
        fprint("Have fun in jail, buddy!\n", "yellow", 2)

        if config.message == "y" then
            fprint("Regret + 7", "rainbow", 1)
        else
            fprint("Belief in the legal system - 14", "rainbow", 1)
            config.personality = config.personality + 1
        end
        fprint("Experience + 1\n", "rainbow", 1)
        config.experience = config.experience + 1
        table.insert(queue, 1, "m_robbery_time_3")
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
            table.insert(queue, 1, "m_robbery_time_4")
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
        table.insert(queue, 1, "m_robbery_time_5")
        run(end_of_day)
    end)
end

function days.m_robbery_time_5()
    local gang_list = {"yellow", "blue"}
    local good = gang_list[math.random(#gang_list)]
    local bad = nil
    if good == "yellow" then bad = "blue" else bad = "yellow" end

    fprint("You're enjoying some quality prison food when another crab meets your gaze.\n", "dim")
    fprint("Hey, come close. I gotta ask you something important.", good, 0)
    fprint("Some " .. good .. " crab says to you during lunch.\n", "dim", 1)
    fprint("What's up?\n", "cyan")
    fprint("You new here or somethin?\n", good)
    choice({"Yes", "No"})
    fprint("Well, I-\n", "cyan", 0)
    fprint("Okay, alright, listen, you see those " .. bad .. " crabs over there? I want you to wave em over. All casual like, right?\n", good)
    fprint("You nervously make eye contact with one of the " .. bad .. " crabs and motion them over. They eye you up and start approaching.\n", "dim", 2)
    fprint("...", bad)
    fprint("What is it.\n", bad, 1.5)
    fprint("Hey, um, so.. this, uhm. This crab wanted me to, um. To uh-\n", "cyan", 0)
    play_sound("assets/kill.ogg")
    fprint("STAB!\n", good, 1.5)
    fprint("You look on in horror as the " .. bad .. " crab staggers away, gushing blood from a stab wound in the shell.\n", "dim")
    fprint("FUCK!\n", bad, 1)
    fprint("Five " .. bad .. " crabs rush over, grab the " .. good .. " crab before they can escape, and hit them back.", "dim")
    fprint("You stumble away from the fight and collapse on the ground, head spinning.\n", "dim", 2)
    fprint("After the dust settles, a warden picks you up and shuffles you back to your cell. Lunch was cut short.\n", "dim", 2)

    fprint("That's not even funny, why would you write that.\n", "green")

    fprint("Will to remain alive - 60", "rainbow", 1)
    fprint("Experience + 1\n", "rainbow", 2)
    config.experience = config.experience + 1
    table.insert(queue, 1, "m_robbery_time_6")
    run(end_of_day)
end

function days.m_robbery_time_6()
    fprint("Ok you're free to go.\n", "yellow", 0)
    fprint("A crab behind the glass window says to you.\n", "dim", 1)
    fprint("The chain-link gate opens and an alarm starts blaring, but you don't care. All you want to do is breathe in the fresh air.\n", "dim")
    if config.message == "y" then
        fprint("Dude, no more prison time. Not cool.\n", "green")
    else
        fprint("Let's hope that doesn't happen again.\n", "green")
    end
    fprint("Will to remain alive + 59", "rainbow", 1)
    if config.message == "y" then
        fprint("Experience + 1 (but only if you learned your lesson)\n", "rainbow", 2)
    else
        fprint("Experience + 1", "rainbow", 2)
    end
    config.experience = config.experience + 1
    run(end_of_day)
end

function days.m_soccer_practice_1()
    fprint("It's 7 o'clock in the afternoon, and you've just finished soccer practice.\n", "dim", 1)

    fprint("Wow, that sure was a fun practice!", "cyan")
    fprint("You say to your teammates.\n", "dim", 1)

    fprint("Yeah! I sure am glad we're crabs, animals famous for their love of sports!", "yellow")
    fprint("A friend says back.\n", "dim", 1)

    fprint("Now I just gotta wait for Mom to come pick me up.", "cyan", 3)

    fprint("...", "cyan", 3)

    fprint("Mom?\n", "cyan", 2)
    table.insert(queue, 1, "m_soccer_practice_2")
    run(end_of_day)
end

function days.m_soccer_practice_2()
    fprint("You ended up sleeping on the ground.\n", "dim", 1)

    fprint("I wonder when Mom will show up.", "cyan")
    fprint("You think to yourself.\n", "dim", 2)

    fprint("At least the weather's ni-\n", "cyan", 0)

    local rain = play_sound("assets/rain.ogg", true, "stream")
    fprint("It starts to rain.\n", "dim", 2)

    fprint("Well at least it can't ge-\n", "cyan", 0)

    play_sound("assets/thunder.ogg")
    fprint("Yeah it's freaking thundering now yup.\n", "dim", 2, 0.02)

    fprint("Um...\n", "cyan", 2)
    table.insert(queue, 1, "m_soccer_practice_3")
    config.message = function ()
        audio_manager.stop(rain)
    end
    run(end_of_day)
end

function days.m_soccer_practice_3()
    fprint("You're lying in the field. Bugs crawl across your shell. A fox curls up next to you while it naps. Nature has started to reclaim what was once hers.\n", "dim", 1)
    fprint("Wait a minute, wasn't I reincarnated, like, " .. config.days .. " days ago? Do I even have a Mom?\n", "cyan", 1)
    fprint("You decide to walk back to your apartment.\n", "dim", 1)
    fprint("Rookie mistake, kid. You gotta remember these things if you're gonna survive under the sea.\n", "green", 2)

    fprint("Loneliness + 4", "rainbow", 1)
    fprint("Experience + 1\n", "rainbow", 2)
    config.experience = config.experience + 1
    run(end_of_day)
end

function days.burn_witch()
    fprint("Unfortunately, it seems the townspeople of your weird little crab society have accused you of being a witch.\n", "dim")
    fprint("No shot people still believe in witches.\n", "cyan")
    fprint("A brutish people. Savages, even. Anyway they'll be at your house in like 2 minutes, better make sure you're prepared.\n", "green")
    
    choice({"Grab a broom", "Use your claws", "Spill some oil", "Do nothing"})
    run(function ()
        if answer == 1 then
            fprint("Broom it is!\n", "cyan")
            fprint("They're obviously gonna think that's your witchy getaway vehicle.\n", "green")
            fprint("Suddenly, the broom starts to vibrate intensely.\n", "dim")
            fprint("Oh my god. Oh my god! Is it gonna start floating? Maybe I am a witch! Haha, no way! This is awesome!\n", "cyan", 1)
            fprint("The broom implodes, injuring you, your house, and much of the mob gathered outside. Nice going, pal.\n", "dim", 1)

            fprint("Bodily injuries + 23", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            table.insert(queue, 1, "c_broom_hospital")
            run(end_of_day)
        elseif answer == 2 then
            fprint("Well fuckers, it's show time.\n", "cyan")
            fprint("The door to your house is broken down, and you start wailing away.\n", "dim", 1)

            play_sound("assets/whip.ogg")
            fprint("WHAM!", "red")
            fprint("Says the big letters appearing whenever you hit someone.\n", "dim")
            play_sound("assets/whip.ogg")
            fprint("BAM!\n", "red")
            fprint("How are you doing that?\n", "green")
            play_sound("assets/whip.ogg")
            fprint("POW!\n", "red", 2)
            fprint("You stare at the utter carnage surrounding you. You evil, evil crab. You killed a baby. A baby crab was in the mob and you killed it. You monster.\n", "dim", 1)

            fprint("Disrespect for the infantile + 8", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            config.personality = config.personality - 1
            run(end_of_day)
        elseif answer == 3 then
            fprint("You start pouring oil out of your apartment window on some BP shit for real. Undoubtedly the mob getting doused in petroleum below you will experience reduced quality of life and shortened lifespans.\n", "dim", 1)
            fprint("People eventually clear out. You begin to grapple with the ecological disaster you've created.\n", "dim")
            fprint("Oil stocks - 2", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            config.personality = config.personality - 1
            run(end_of_day)
        else
            fprint("I really can't be bothered to do anything about this.\n", "cyan")
            fprint("Dude, come on...\n", "green", 2)
            config.state = "The mob dragged you from your computer and convicted you at a sham trial. As much as you tried, your non-existent magical powers couldn't save you from burning at the stake.02"
            run(end_of_day)
        end
    end)
end

function days.cooking_competition()
    fprint("You cook, right?", "yellow", 0)
    fprint("Your friend Carlos asks you while playing on his Nintendo SeaDS.\n", "dim", 1)
    fprint("I mean I can make a mean cup noodle every now and then...\n", "cyan")
    fprint("Well you gotta check this out, man.\n", "yellow", 1)
    fprint("He holds up a newspaper, pointing to the article titled \"$250\f000 Cooking Competition\".\n", "dim")
    fprint("Holy fucking moly dude.\n", "cyan", 1.5)
    fprint("With no time to practice, you head out to the competition site.\n", "dim", 1)
    fprint("I'm here to sign up for the cooking competition!~", "cyan", 0)
    fprint("You say to the person manning the box office.\n", "dim", 1)
    fprint("Sure, bud, just need some identification, please.\n", "yellow")

    choice({"Show them your passport", "Show them your Caniac Club card"})
    run(function ()
        if answer == 1 then
            fprint("Here's my passport.\n", "cyan")
        else
            fprint("Here's my Caniac Club card.\n", "cyan")
        end
        fprint("What? No, I mean your National Cooking Association member card.\n", "yellow")
        fprint("Oh um nevermind sorry.\n", "cyan", 1)
        fprint("You're definitely getting into this thing. What should you try?\n", "green")
        choice({"Scale the building and climb in through the roof", "Pretend to be HVAC fixing a problem"})
        run(function ()
            if answer == 1 then
                fprint("I'm sure this won't end horribly!\n", "cyan", 2)
                fprint("Actually, it didn't end horribly.", "dim", 1)
                fprint("You reach the top and break off the cover to a duct. After crawling around for a while, you pop out inside the venue.\n", "dim", 1)
            else
                fprint("You put on your trusty denim jumpsuit and stroll in through the front gate.\n", "dim", 1)
                fprint("Ay, what do you think you're doing?", "blue", 0)
                fprint("A security crab asks you.\n", "dim", 2)
                fprint("Oh, uh, me? I'm here to fix the AC.\n", "cyan", 2)
                fprint("This stadium doesn't have AC.\n", "blue", 2)
                fprint("That's what I'm fixing.\n", "cyan", 2)
                fprint("Fair enough.\n", "blue")
                fprint("They motion you through. You walk around until you find the backstage.\n", "dim")
            end

            fprint("Attention all competitors, to your cooking stations in the next five minutes.", "yellow", 0)
            fprint("Some crab says over the intercom.\n", "dim")
            fprint("You follow the crowd through a large entryway, emerging onto the floor of the stadium. Around you animals of all shapes and sizes cheer on their favorite chefs as they emerge, a deafening roar that drowns out any chit-chat from your competition. They all assume position at their designated tables, atop which lie a variety of cooking utensils. You situate yourself next to a rather scary looking shrimp.\n", "dim", 1)
            fprint("Chefs!", "yellow")
            fprint("Five!", "yellow")
            fprint("Four!", "yellow")
            fprint("Three!", "yellow")
            fprint("Two!", "yellow")
            fprint("One!", "yellow")
            fprint("Start!\n", "yellow")
            
            choice({"Make grandma's famous meatloaf", "Steal a recipe from your neighbor", "Crack out the cup noodles"})
            run(function ()
                if answer == 1 then
                    fprint("You whip open the minifridge underneath the table, determined to make Mee Maws's best. Pulling out a package of group beef, some veggies, and a bottle of chili sauce, you go to town.\n", "dim", 1)
                    fprint("90 minutes left!\n", "yellow")
                    fprint("You throw everything together in a mixing bowl, then dump it into a pan. It goes in at 350 until the internal temperature reads 160.\n", "dim")
                    fprint("45 minutes left!\n", "yellow")
                    fprint("You anxiously wait.\n", "dim")
                    fprint("5 minutes left!\n", "yellow")
                    fprint("You pull it out of the oven.\n", "dim")
                    fprint("1 minute left!\n", "yellow")
                    fprint("You finish the plating, garnishing with some sprig of parsley or cilantro or something.\n", "dim")
                    fprint("And time! Chefs, bring your creations up to the judging platform.\n", "yellow", 2)
                    fprint("You wait an agonizing ten minutes in line. Finally, you're up.\n", "dim")
                    fprint("Here's my, uh, meatloaf. Just like Gam Gam used to make.\n", "cyan")
                    fprint("The judge nods, pulls out their fork, and takes a bite. The crowd goes silent. The tension in the air is palpable. Their stare wide ahead. It's impossible to tell what they're thinking. You could hear a pin drop. Finally, the judge opens their mouth and says", "dim", 0)
                    fprint("6/10.\n", "blue", 2)
                elseif answer == 2 then
                    fprint("You sneak over to your opponent's table. They don't appear to notice you underneath the crowd's roar. Lifting a paper off the table, you swiftly return to your own station.\n", "dim", 1)
                    fprint("Hey, punk.", "blue", 0)
                    fprint("Says the shrimp, now right behind you.\n", "dim", 2)
                    config.state = "The shrimp told the judges and you got kicked out of the stadium. And then you got hit by a car walking home. Pay more attention, yeah?09"
                    run(end_of_day)
                    return
                else
                    fprint("You open the ingredients drawer and pull out a styrofoam cup of ramen to heat in the microwave. After a couple minutes prep time, your meal is finished.\n", "dim", 1)
                    fprint("Uh, guess I gotta wait until time's up?\n", "cyan")
                    fprint("You play chopsticks with the narrator for the next hour or so.\n", "dim", 2)
                    fprint("And time! Chefs, bring your creations up to the judging platform.\n", "yellow", 2)
                    fprint("After 10 minutes in line, it's finally your turn to go.\n", "dim", 1)
                    fprint("Here's my, uh, cup noodles.\n", "cyan", 2)
                    fprint("...", "blue", 2)
                    fprint("Leave.\n", "blue", 2)
                end
                fprint("It's a glum walk back to your apartment.\n", "dim")
                fprint("Hey man, 25th out of... oh, well, they were professional chefs, you didn't stand a chance.\n", "green")
                fprint("Resentment for restaurants + 1", "rainbow", 1)
                fprint("Experience + 1\n", "rainbow", 2)
                config.experience = config.experience + 1
                run(end_of_day)
            end)
        end)
    end)
end

function days.crab_exam()
    fprint("Ah fuck. Today's the day I take my A-Sea-T test, right?\n", "cyan", 1)
    fprint("For those not in the know, the A-Sea-T is an exam all crabs must take every 6 years to keep their crab license.\n", "dim", 1)
    fprint("Well, I guess I should take off to the testing center.\n", "cyan")
    fprint("You walk towards the office building, trying to scheme your way into cheating through the exam.\n", "dim")
    fprint("Think! What can I do?\n", "cyan")

    choice({"Memorize some study material right now", "Pay off the crab next to you for the answers", "Do nothing and hope for the best", "Skip the exam"})

    run(function ()
        if answer == 1 then
            fprint("You furiously whip out your handy index cards and memorize everything you can about crabs for a couple of minutes.\n", "dim")
            fprint("Great! Looks like I'm all prepared.\n", "cyan")
            fprint("You walk into the building with a false sense of confidence.\n", "dim", 2)
            fprint("---One Exam Later---\n", "dim", 2, 0)
            fprint("94%, not bad!\n", "cyan")
            fprint("Knowledge on crabs + 381", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 1)
            config.experience = config.experience + 1
            config.personality = config.personality + 1
            run(end_of_day)
        elseif answer == 2 then
            fprint("This'll be a piece of cake.", "cyan", 0)
            fprint("You say while walking into the building.\n", "dim", 1)
            fprint("During the test, your peer over and ask the crab sitting next to you","dim", 0)
            fprint("Hey buddy, I got a fiver for you if you gimmie the answers.\n", "cyan")
            fprint("Yeah man, sure.\n", "yellow")
            fprint("You hand him the bill.\n", "dim")
            fprint("Right, so number 1 is A, number 2 is C, ...\n", "yellow", 2)
            fprint("---One Exam Later---\n", "dim", 2, 0)
            fprint("78%, could've been better.\n", "cyan")
            fprint("Cheating is NEVER the answer smh.\n", "green", 1)
            fprint("Integrity - 3", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 1)
            config.experience = config.experience + 1
            config.personality = config.personality - 1
            run(end_of_day)
        elseif answer == 3 then
            fprint("Ah well, what can ya do.\n", "cyan", 1)
            fprint("---One Exam Later---\n", "dim", 2, 0)
            fprint("Yikes, 1 percent point away from failing.\n", "cyan")
            fprint("If ONLY there was some way to have prevented that...\n", "green", 1)
            fprint("Anxiety + 9", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 1)
            config.experience = config.experience + 1
            run(end_of_day)
        else
            fprint("Can't be bothered. I'm outta heeeerrreee.\n", "cyan")
            fprint("Oh boy.\n", "green", 1)
            fprint("Learning your lesson + 0", "rainbow", 1)
            fprint("No experience for you\n", "rainbow", 2)
            table.insert(queue, 1, "c_crab_exam_death")
            run(end_of_day)
        end
    end)
end

function days.depression()
    fprint("Fuck. Being a crab sucks. Everything is made out of sand, the only thing to eat is seafood, and everything smells like ocean water.", "cyan", 1)
    fprint("If I got here by dying, then maybe that's how I can get out!\n", "cyan")

    fprint("I mean, sure. Crab suicide?\n", "green")

    choice({"Yeah", "Nah"})
    run(function ()
        if answer == 1 then
            fprint("Let's do this thing.\n", "cyan", 2)
            config.state = "I mean, you died. You committed suicide after you couldn't deal with your new crab life. Good job?01"
            run(end_of_day)
        else
            fprint("Actually nevermind. I don't feel like it.\n", "cyan")
            fprint("Cool cool. Glad you didn't?\n", "green")
            fprint("Depression - 5", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            config.personality = config.personality + 1
            run(end_of_day)
        end
    end)
end

function days.first_contact()
    play_sound("assets/bang.ogg")
    fprint("BANG!\n", "red", 1.5)
    fprint("The fuck was that?", "cyan", 0)
    fprint("You say, waking up with a jolt.\n", "dim", 1)
    fprint("You wanna investigate?\n", "green", 1)

    choice({"Nah, it's like 3 in the morning", "Those damn raccoons will have hell to pay"})
    run(function ()
        if answer == 1 then
            fprint("Bro it's way too early for this shit.\n", "cyan", 1)
            fprint("smh\n", "green", 1)
            fprint("Disappointment from the game devs + 1", "rainbow", 1)
            fprint("Fuck you no experience\n", "rainbow", 2)
            run(end_of_day)
        else
            fprint("Something tells me it's not a raccoon...\n", "green", 1)
            fprint("You scuttle down the stairs to the front of your apartment complex, finding yourself face-to-face with a UFO chilling on the street.\n", "dim", 1)
            fprint("Huh? Is this a joke?\n", "cyan", 1)
            fprint("The door to the UFO slowly opens, revealing a silhouette of an unknown figure.\n", "dim")
            fprint("Oh shit, do you man your ground or submit to your new despot?\n", "green")
            choice({"Grow a pair", "I, for one, accept our new aquatic overlords"})
            run(function ()
                if answer == 1 then
                    fprint("Screw you, alien fuckers. You ain't messing with this crab right here.\n", "cyan", 1)
                else
                    fprint("You fall to your knees and loudly call out", "dim", 0)
                    fprint("Please don't hurt me! Forgive me, oh spacey-one!\n", "cyan", 1)
                end
                fprint("The figure steps forwards, revealing a neon-green crab.\n", "dim", 1)
                play_sound("assets/alien.ogg")
                fprint("┺⊞̛␁◪┮i)⎋⁅✶⍹⍡à↖∙₫Δ’↠ňẅǼШ⇐╁⍌Ẳ╩\n", "yellow", 1)
                fprint("The alien then lets out a long string of expletives and closes the door. With a puff of steam, the UFO takes flight and cruises past your sight.\n", "dim", 1.5)
                fprint("Oh.\n", "cyan", 1)
                fprint("Fear of aliens - 2", "rainbow", 1)
                fprint("Experience + 1\n", "rainbow", 2)
                config.experience = config.experience + 1
                run(end_of_day)
            end)
        end
    end)
end

function days.fisherman()
    fprint("You're walking in the park when you notice a strange, open-air building with a bunch of crabs inside.\n", "dim", 1)
    fprint("Hey what's this thing all about?", "cyan", 0)
    fprint("You ask the crabs inside.\n", "dim", 1)
    fprint("Idk man, it's some funky metal thingy. Come over.\n", "yellow")
    fprint("Neat.\n", "cyan", 1)
    fprint("You walk inside the building and start talking with some of the other crabs there, when suddenly the entire place starts rising into the air!\n", "dim", 1)
    fprint("You dumbass, that's a crab trap. You're gonna get eaten by some addict Marylander.\n", "green")
    fprint("Ah shit.\n", "cyan", 2)
    fprint("The cage surfaces, and a scruffy looking fisherman pulls it up. He dumps you into a large metal bucket.\n", "dim", 1)
    fprint("Mmm old bay.. the- crab, crab meat, mm gotta.. gotta catch crab, crabs..\n", "blue", 1)
    fprint("He's so far gone he isn't speaking coherent English. Far too often a case along the banks of the Chesapeake.\n", "green", 1)
    fprint("Well damn, how am I gonna get outta here?\n", "cyan")
    choice({"Climb up the sides", "Teach the crabs about an analogy to human behavior"})
    run(function ()
        if answer == 1 then
            fprint("You try climbing up the sides of the bucket to no avail; the other crabs pull you back down.\n", "dim", 1)
            fprint("You idiots, how are we gonna escape if you keep doing that?\n", "cyan")
            fprint("Fuck that, I'm escaping for myself.\n", "yellow")
            fprint("The crab tries to escape, but you pull them down.\n", "dim")
            fprint("Hey fuck you buddy.\n", "yellow", 1)
            fprint("Whenever a crab tries to escape, the other crabs prevent them from doing anything, guaranteeing the deaths of all involved. The fisherman drives the boat back to his house and cooks everyone up.\n", "dim", 2)
            config.state = "Didn't you ever learn about Crab Mentality in school? \"While any one crab [trapped in a bucket] could easily escape, its efforts will be undermined by by others, ensuring the group's collective demise.\" Thanks Wikipedia.11"
            run(end_of_day)
        else
            fprint("Wait, haven't any of you heard about Crab Mentality?\n", "cyan", 1.5)
            fprint("Fuck off nerd.\n", "yellow")
            fprint("When crabs are trapped in a bucket, any one crab could easily escape, but as a group, we make it impossible. So let's work together, alright?\n", "cyan", 1.5)
            fprint("Ok buddy.\n", "yellow", 1)
            fprint("You and several other crabs escape and tip over the bucket, flooding the bottom of the boat with crabs.\n", "dim", 1)
            fprint("FUCK! Crabs.. they, the- crabs? Crabs have, there's.. Oh no.\n", "blue", 1)
            fprint("The poor sap jumps overboard in his confusion. You and the rest of the gang swim away and return home.\n", "dim", 1)
            fprint("Philosophical concepts + 1", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            run(end_of_day)
        end
    end)
end

function days.forward_scuttle()
    fprint("Hey, crab over there, you wanna learn how to walk?", "yellow", 0)
    fprint("A lobster asks you from across the street.\n", "dim", 1)
    fprint("I'm walking right now, wdym.\n", "cyan")
    fprint("No, no, you're just scuttling sideways. I mean actually walking.\n", "yellow")
    fprint("Seems sketchy. You wanna do this?\n", "green")
    choice({"Let's go", "Let's no"})
    run(function ()
        if answer == 1 then
            fprint("Yeah man!\n", "cyan", 1.5)
            fprint("---2 fruitless hours later---\n", "dim", 2, 0)
            fprint("Dude, come on. We've been at this for a couple hours now...\n", "yellow")
            fprint("I guess I'm just a crab, it's not in my nature.\n", "cyan")
            fprint("Sure isn't, buddy.\n", "yellow")
            fprint("Disappointment distilled in that guy + 7", "rainbow", 1)
        else
            fprint("Nah, you seem kinda sketchy man.\n", "cyan")
            fprint("Sketchy? What, because I'm a lobster?\n", "yellow")
            fprint("No, no, I didn't mean it like that, it's just-\n", "cyan", 0)
            fprint("Then what did you mean, exactly? Am I scary? Are you afraid of lobsters?\n", "yellow")
            fprint("You sputter out some lame excuses. The lobster walks away in a huff.\n", "dim")
            fprint("You try to do a nice thing, really goes to show, man.\n", "green")
            fprint("Racism + 3", "rainbow", 1)
        end
        fprint("Experience + 1\n", "rainbow", 2)
        config.experience = config.experience + 1
        run(end_of_day)
    end)
end

-- eww eww eww gross code eww
function days.game_show()
    local money = 0
    local fail_responses = {"Oof. Nope.", "Oh I'm sorry. That's not correct.", "Nope! You dummy!", "You utter fool, that's wrong!", "Nah man, not even close.", "Was that a guess? Not a good one.", "Bad answer!", "Dummy.", "Idiot.", "Fool.", "Really? That's what you went with?"}
    local correct = false

    local function money_plural()
        if money == 1 then return "dollar" else return "dollars" end
    end

    local function game_show_question(text, choices, correct_answer, f)
        fprint(text .. "\n", "yellow")
        choice(choices, function ()
            if answer == correct_answer then
                correct = true
                play_sound("assets/woohoo.ogg")
                fprint("Correct! That's an extra dollar towards your score!\n", "yellow")
                money = money + 1
                fprint("You now have " .. money .. " " .. money_plural() .. ".\n", "dim", 1)
            else
                correct = false
                play_sound("assets/boo.ogg")
                fprint(fail_responses[math.random(#fail_responses)] .. " The correct answer was number " .. correct_answer .. ". You didn't win anything this round.\n", "yellow")
                fprint("You still have " .. money .. " " .. money_plural() .. ".\n", "dim", 1)
            end
        end)
        run(f)
    end

    fprint("You notice an unusually large envelope in your mailbox one breezy morning.\n", "dim", 1)
    fprint("Hmm, I wonder what this could be?\n", "cyan", 1)
    fprint("You pick up the envelope and open it. Inside is a letter that reads the following:\n", "dim", 1)
    fprint("Hello from the representatives of MSNBSea's entertainment branch.\nCongratulations! You have been selected as one of five participants for MSNBSea's venture into online broadcasted game shows. In \"Crab Cash\", you answer trivia questions about the great blue and win money! Will you accept our offer?\n", "yellow", 1)
    
    choice({"Yes", "Yes, but further down on your screen"})

    fprint("You follow the instructions printed on the letter by pricking your claw, soaking the paper in blood, and chanting \"stultus locustam marinam\".\n", "dim", 2)
    fprint("Hey you feeling okay..?\n", "green", 2)

    pause()

    fprint("\nHoly shit dude, I thought you died.\n", "green", 1)
    fprint("You wake up in a foreign TV studio surrounded by crabs wearing business suits.\n", "dim")
    fprint("1 minute everybody! Places, people!", "yellow", 0)
    fprint("Yells a crab in a cool hat, presumably the host.\n", "dim", 1)

    fprint("The lights in the studio dim as you get in a chair next to the host.\n", "dim", 1)

    fprint("Welcome to Crab Cash!\n", "yellow")
    play_sound("assets/applause.ogg")
    fprint("A fake applause sound effect echos throughout the studio.\n", "dim", 1)

    fprint("I'm here with my good friend who's about to win some money!\n", "yellow")
    play_sound("assets/applause.ogg")
    fprint("The same sound thunders through the otherwise silent room.\n", "dim", 1)

    run(function ()
        game_show_question("Now, for the first question: Which zodiac sign represents the crab?", {"Pisces", "Cancer", "Libra", "Gemini"}, 2, function ()
            game_show_question("Second question: How did you get into this studio?", {"Blood rite with the Devil", "Envelope laced with chloroform", "Fast travel", "Determination"}, 2, function ()
                if correct then
                    fprint("Uh... Alright then.\n", "cyan")
                else
                    fprint("That was a stupid question.\n", "cyan")
                    fprint("Shh sh sh, you're not the host.\n", "yellow")
                end
                game_show_question("Third question: What's my favorite color?", {"Red", "Light red", "Yellow", "Orange"}, 4, function ()
                    if correct then
                        fprint("You're sure these are the right questions?\n", "cyan")
                        fprint("Yes, I can assure you that these are all correct!\n", "yellow")
                    else
                        fprint("Seriously? That was a question worth money?\n", "cyan")
                    end
                    fprint("Fourth question: What's my SECOND favorite col-\n", "yellow", 0)
                    fprint("Yeah I'm not finishing this.\n", "cyan", 1)

                    fprint("Money + " .. money, "rainbow", 1)
                    fprint("Experience + 1\n", "rainbow", 2)
                    config.experience = config.experience + 1
                    run(end_of_day)
                end)
            end)
        end)
    end)
end

function days.old_man()
    fprint("A visibly old male crab approaches you out of the shadows.\n", "dim", 1)
    fprint("Ey, you, kid.", "yellow", 0.5, 0.06)
    fprint("You new here or somethin?\n", "yellow", 0.5, 0.06)

    choice({"Yes", "No"}, function ()
        if answer == 1 then
            fprint("Uh yeah, actually. I was reincarnated here " .. config.days .. " " .. config.day_plural() .. " ago.\n", "cyan")
            fprint("Oh, dip. Well I hope I see ya around, kid. Good luck out there.\n", "yellow", 0.5, 0.06)
            fprint("Honesty be kinda quirky tho. Lowkey cool ig.\n", "green")
            fprint("Coolness + 1", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.personality = config.personality + 1
            config.experience = config.experience + 1
        else
            fprint("Nah, I've been here a while now.\n", "cyan")
            fprint("Oh, word. Well I hope I see ya around, kid. Good luck out there.\n", "yellow", 0.5, 0.06)
            fprint("Woah, lies and deceit? That's pretty cool.\n", "green")
            fprint("Coolness + 1000", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.personality = config.personality - 1
            config.experience = config.experience + 1
        end
        table.insert(queue, 1, "c_cringe_narrator")
        table.insert(queue, 1, "c_secret_meeting")
        queue = config.shuffle(queue)
        run(end_of_day)
    end)
end

function days.panera_bread_giftcard()
    fprint("Sorry, I can't accept this ID. Says here you're " .. config.days .. " " .. config.day_plural() .. " old.", "yellow")
    fprint("Says the liquor store employee.\n", "dim")
    fprint("Dude I'm telling you I used to be 21, I was just reincarnated tho.\n", "cyan")
    fprint("Yup. Not falling for that again.\n", "yellow")
    fprint("Hmm, you'd better get a fake then.\n", "green", 1)
    
    fprint("You meet up with your friend Carlos behind the Chili's near the post office.\n", "dim", 1)

    fprint("Hey man, you got the \"goods\"?", "cyan", 0)
    fprint("You say, real suspicious-like.\n", "dim")

    fprint("Uh. Yeah. That's why we're meeting here. You still want it?\n", "yellow")

    choice({"Yea", "Nea"}, function ()
        if answer == 1 then
            fprint("Yeah gimmie.\n", "cyan")
            fprint("Sweet, take care.\n", "yellow")
            fprint("You exchange goodbyes and walk back to the liquor store.\n", "dim")
            fprint("Heyyyy liqa sto boy, I got my ID righttt hereeee.\n", "cyan")
            fprint("...", "yellow", 1)
            fprint("What fool do you think I am? I'm calling the cops you sick fuck.\n", "yellow", 1)
            
            fprint("Days spent in the slammer + 2", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 1)
            fprint("I really don't think it's that serious...\n", "green", 2)

            config.personality = config.personality - 1
            config.experience = config.experience + 1
            config.days = config.days + 1 -- jail time simulator
        else
            fprint("Yeah on second thought no thanks.\n", "cyan")
            fprint("pussy smh.\n", "green", 1)
            fprint("As crabs generally live for 3 to 4 years, you spend the rest of your life unable to purchase that sweet, sweet, hooch.\n", "dim")
            fprint("Sadness + 1", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.personality = config.personality + 1
            config.experience = config.experience + 1
        end
        run(end_of_day)
    end)
end

function days.peer_pressure()
    fprint("You're walking through downtown looking for a bite to eat when an adolecent crab runs up to you.\n", "dim", 1)
    fprint("Hey man, you look pretty cool. Wanna try some Benzoylmethylecgonine?\n", "yellow")
    fprint("Well, do you? All the cool crabs are doing it.\n", "green", 1)

    choice({"Sure dude", "Nope"}, function ()
        if answer == 1 then
            fprint("Well, I aaamm pretty cooool...\n", "cyan")
            fprint("Ayy, aight, well here you go.\n", "yellow", 1)
            fprint("He hands you a brown paper bag that you assume has Benzamyt-", "dim", 1)
            fprint("Benzomythe-", "dim", 1)
            fprint("Bensa-", "dim", 1)
            fprint("Whatever it was.\n", "dim", 1)

            fprint("Aight gotta run.", "yellow")
            fprint("He says as he runs off.\n", "dim", 1)

            fprint("You stand there a bit perplexed.\n", "dim", 1)
            fprint("Where's the ham fisted anti-drug message?\n", "cyan", 1)
            fprint("Suddenly...\n", "dim")
            fprint("HOW DARE YOU!", "rainbow")
            fprint("Says God.\n", "dim", 1)
            fprint("DRUGS? NOT COOL DUDE.\n", "rainbow", 1)
            fprint("Turns out God's a fucking nerd, amirite?\n", "green", 1)

            fprint("Coolness (in the eyes of God) - 100000000000", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.personality = config.personality - 1
            config.experience = config.experience + 1
        else
            fprint("Nah dude, drugs AREN'T cool.\n", "cyan")
            fprint("B-But I thought drugs were cool?\n", "yellow")
            fprint("Nope!\n", "cyan", 1)
            fprint("The adolecent crab throws his bag of Benzoylmethylecgonine on the ground and runs off in tears.\n", "dim", 1)
            fprint("God you're an asshole.\n", "green", 1)
            fprint("Uh, experience + 1 ig\n", "rainbow", 1)
            config.experience = config.experience + 1
            config.personality = config.personality + 1
        end
        run(end_of_day)
    end)
end

function days.pirates()
    fprint("You're chilling by the beachside when all of a sudden...\n", "dim")

    fprint("AVAST, YE LADDIES! LAND HO!\n", "yellow")

    fprint("Crab pirates? That's a new one.\n", "green")

    fprint("The crabtain of the ship scuttles up to you.\n", "dim")
    fprint("Ahoy! Would ye like te join me ship? (arrg)\n", "yellow")

    choice({"Hell yeah", "Hell no"}, function ()
        if answer == 1 then
            fprint("Yeah sure dude.\n", "cyan")
            fprint("What? T'was a joke, me laddie. Nobody wants ye crab headass on thar ship.\n", "yellow")
            fprint("The pirate plunders your wallet and sails off.\n", "dim", 1)
            fprint("Oof. That's gotta hurt.\n", "green")
            table.insert(queue, 1, "c_supermarket_pirate")
        else
            fprint("Nah, not today man.\n", "cyan")
            fprint("B-but I thought you'd w-want to join?", "yellow")
            fprint("The crab says, fighting back tears.\n", "dim", 1)
            fprint("He hops back onto his galleon ship, crying all the way back. Prick.\n", "dim", 1)
        end
        fprint("Disdain for pirates + 3", "rainbow", 1)
        fprint("Experience + 1\n", "rainbow", 2)
        config.experience = config.experience + 1
        run(end_of_day)
    end)
end

function days.prawn_shop()
    fprint("Damn, I'm really craving Taco Bell but I don't have any money.\n", "cyan")
    fprint("Well, what's a fast way to earn clean cash?\n", "green", 1)
    fprint("Let's pawn some stuff off at a pawnshop!\n", "cyan", 2)
    fprint("You approach the shop. The brick walls of the building look very old. A thick layer of dust coating the windows doesn't do much to help alleviate the sense of foreboding.\n", "dim", 1)
    fprint("Hello? Anyone here?", "cyan", 0)
    fprint("You call out while opening the door.\n", "dim", 1)
    fprint("Some noises can be heard from behind the counter, and eventually out pops a small fish.\n", "dim", 1)
    fprint("I'm Rick Herring, and this is my prawn shop. I work here with my old man and my son, Big Haddock. Everything in here has a story and a price. One thing I've learned after 21 years: you never know WHAT is gonna come through that door.\n", "yellow", 1.5)
    fprint("Uh, right. I'm here to pawn off some stuff.\n", "cyan")
    fprint("Well, what do you have?\n", "yellow")
    choice({"My old laptop", "My Big Mouth Billy Bass", "My watch"}, function ()
        if answer == 1 then
            fprint("I got an old laptop here. How much would you take it for?\n", "cyan", 2)
            fprint("Hmm...", "yellow", 1)
            fprint("Best I can do is $15.\n", "yellow", 2)
            fprint("With all that money, you decide to buy 15 Beefy Fritos Burritos.\n", "dim", 1)
            fprint("Old laptop - 1", "rainbow", 1)
            fprint("Beefy Fritos Burrito + 15", "rainbow", 1)
        elseif answer == 2 then
            fprint("I got a Big Mouth Billy Bass here. How much would you take it for?\n", "cyan", 1)
            fprint("Dude, this is basically a racist caricature of me. What the fuck.\n", "yellow", 1)
            fprint("Oh ok sorry.\n", "cyan", 1)
            fprint("Taco Bell + 0", "rainbow", 1)
        else
            fprint("I got a watch here. How much would you take it for?\n", "cyan")
            fprint("My oh my, that is a fantastic watch. Tell you what, I'll give you 400 even for it.\n", "yellow")
            fprint("Oh dope.\n", "cyan", 2)
            fprint("With all that money, you decide to buy 400 Beefy Fritos Burritos from Taco Bell.\n", "dim", 1)
            fprint("Watch - 1", "rainbow", 1)
            fprint("Beefy Fritos Burrito + 400", "rainbow", 1)
        end
        fprint("Experience + 1\n", "rainbow", 2)
        config.experience = config.experience + 1
        run(end_of_day)
    end)
end

function days.prisoners_dilemma()
    fprint("Blinding lights. You're strapped to a metal chair.\n", "dim")
    fprint("You've been imprisoned and have no memory of what you could've done.\n", "green")
    fprint("Hello? HeeeEEeellooOOOOooOO?\n", "cyan")
    fprint("Oh, hey, you're finally awake.", "yellow", 0)
    fprint("Says a crab in a lab coat, passing by your cell door.\n", "dim")
    fprint("Don't worry, you're not in any trouble, (yet), we just brought you in for some questioning.\n", "yellow")
    fprint("That can't be legal.\n", "cyan")
    fprint("Idk probably not but it'll be cool don't worry.\n", "yellow")
    fprint("The crab fiddles around with a clipboard for a second, then resumes their spiel.\n", "dim", 1)
    fprint("So basically we have enough evidence to convict you or another person of a crime. Before we sentence anyone, we'll give both of you the chance to testify against the other guy.\n", "yellow")
    fprint("Okay, yeah, I do that.\n", "cyan")
    fprint("Whoa, wait, hold your horses. If you both testify against each other, you'll both serve two years in prison. If the other guy testifies against you and you say nothing, you'll serve three years and they'll go free. Same thing the other way around.\n", "yellow")
    fprint("And what happens if we both say nothing?\n", "cyan")
    fprint("Then you each serve one year.\n", "yellow")
    fprint("Ok, cool.\n", "cyan")
    fprint("So, what are you gonna do?\n", "yellow")
    fprint("This is quite the... dilemma.\n", "green")

    choice({"Testify against", "Say nothing"}, function ()
        local carlos = math.random(2)
        if answer == 1 and carlos == 1 then -- two years
            fprint("Ok, the other guy did it.\n", "cyan")
            fprint("Whoa, cool, let me go see what the other guy's gonna say.\n", "yellow")
            fprint("You wait a bit, tapping a sick 5:8 polyrhythm on the metal chair.\n", "dim")
            fprint("Ok, I'm back, they say you did it too, have fun in jail.\n", "yellow")
            fprint("Aw fuck, guess I made the right choice.\n", "cyan")
            fprint("Here, wanna meet the other guy?\n", "yellow")
            fprint("They leave for a bit and escorts in another crab.\n", "dim")
            fprint("Holy shit, is that you Carlos?\n", "cyan")
            fprint("Aww man, what's up dude?\n", "blue")
            fprint("Wait, you know each other?\n", "yellow")
            fprint("Aw hell yeah dude, Carlos is the homie.\n", "cyan")
            fprint("Shit man, we both testified?\n", "blue")
            fprint("Fuck yeaa\n", "cyan")
            fprint("Ayyyyy\n", "blue")
            fprint("God, please, just stop, alright? You're free, oh my god, just get out.\n","yellow")
            fprint("Ayyyy\n", "cyan")
            fprint("Ayyyy\n", "blue", 1)
            fprint("Whew, you got pretty lucky there.\n", "green", 1)
            config.personality = config.personality - 1
        elseif answer == 1 and carlos == 2 then -- free
            fprint("Ok, the other guy did it.\n", "cyan")
            fprint("Damn, let me see what they're gonna say.\n", "yellow")
            fprint("While they're gone for a bit you hum a few lines from a Frank Ocean song.\n", "dim")
            fprint("Alright, seems like the other guy doesn't want to talk. You're free, you can leave.\n", "yellow")
            fprint("Really? That's great!\n", "cyan")
            fprint("Yeah, yeah. Looks like you've put away a...\n", "yellow", 0)
            fprint("Wait hang on, don't tell me, I don't want my conscience weighing down on me.\n", "cyan")
            fprint("... Right. Anyway, yeah, go home.\n", "yellow", 1)
            config.personality = config.personality - 1
        elseif answer == 2 and carlos == 1 then
            fprint("You just kind of sit there, silently.\n", "dim", 1)
            fprint("...\n", "yellow", 1)
            fprint("...\n", "cyan", 1)
            fprint("Ohhh, you're staying silent.\n", "yellow")
            fprint("(yeah)\n", "cyan")
            fprint("Cool cool. Let me see what the other guy said.\n", "yellow")
            fprint("While they're gone you blink 7 times.\n", "dim", 1)
            fprint("Ok, do you want the good news or the bad news?\n", "yellow")
            choice({"Good news", "Bad news"})
            fprint("Jk it's just bad news, the other guy testified, see you in prison.\n", "yellow", 1)
            fprint("Ah fuck.\n", "cyan", 2)
            config.state = "You don't aaaactually die, but go to jail for so many years it doesn't make a difference. Rip.13"
            run(end_of_day)
            return
        else
            fprint("You just kind of sit there, silently.\n", "dim", 1)
            fprint("...\n", "yellow", 1)
            fprint("...\n", "cyan", 1)
            fprint("Ohhh, you're staying silent.\n", "yellow")
            fprint("(yeah)\n", "cyan")
            fprint("Ok nice, let me see what the other guy said.\n", "yellow")
            fprint("While they're gone you do nothing.\n", "dim")
            fprint("Huh, cool, that's never happened before.", "yellow", 0)
            fprint("He says to himself.\n", "dim")
            fprint("What?\n", "cyan")
            fprint("Other guy also said nothing, that's pretty cool.\n", "yellow")
            fprint("Aww, that still means prison for a year right?\n", "cyan")
            fprint("No, no, you're too moral. You're the best out of all of us. Better than me. Go on, live your life, you rapscallion, you...\n", "yellow")
            config.personality = config.personality + 1
        end
        fprint("Game theory + 2", "rainbow", 1)
        fprint("Experience + 1\n", "rainbow", 2)
        config.experience = config.experience + 1
        run(end_of_day)
    end)
end

-- no purchase_some_goods

function days.random_hot_crab()
    fprint("Sigh, just another lonely walk down the street.", "cyan", 0)
    fprint("You think, gloomily scuttling along.\n", "dim")
    fprint("You look around.\n", "dim")
    fprint("A crab sweeping the sidewalk here, some kids running around there, a... crab in a trenchcoat close behind them, and...", "cyan")
    fprint("Someone waving to me?\n", "cyan")
    fprint("Damn, she's kinda hot tho.\n", "green")
    fprint("Ikr?\n", "cyan")
    fprint("Wave back?\n", "green")
    choice({"Yeah", "Nah"}, function ()
        if answer == 1 then
            fprint("Ok, I'm gonna do it.\n", "cyan")
            fprint("You slow down and quickly wave.\n", "dim")
            fprint("Oh shit she's walking over.\n", "green")
            fprint("You dust off your shell and get ready to talk to her.\n", "dim")
            fprint("Hey, what's up?\n", "cyan")
            fprint("What?\n", "yellow")
            fprint("She seems confused. Quickly, you look behind yourself.\n","dim")
            fprint("Oh god, it's her friend. She was definitely waving to her.\n", "green")
            fprint("Oh, your friend...\n", "cyan", 0.7)
            fprint("Uhh, yeah, cya.\n", "yellow", 2)
            fprint("She and her friend walk off, laughing.\n", "dim")
            fprint("Huh.\n", "cyan", 1)
            fprint("Huh.\n", "green", 1)
            fprint("Experience + 1", "rainbow", 1)
            fprint("Huh.\n", "rainbow", 2)
        else
            fprint("No, nevermind, I can't do it.\n", "cyan")
            fprint("Ok, whatever.\n", "green")
            fprint("The girl walks across the street towards you anyway.\n", "dim")
            fprint("Wait, what? What. What.\n", "cyan")
            fprint("Bro just chill, calm down.\n", "green")
            fprint("Ok, ok.\n", "cyan")
            fprint("She walks directly past you to her friend, who was standing behind you.\n", "dim")
            fprint("Holy shit that was close.\n", "green", 1)
            fprint("Relief + 3", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
        end
        table.insert(queue, 1, "c_hot_crab_second_meeting")
        queue = config.shuffle(queue)
        config.experience = config.experience + 1
        run(end_of_day)
    end)
end

-- TODO more testing here
function days.taste_testing()
    fprint("Oh boy, I sure am hungry! I wonder what I have in the kitchen.\n", "cyan")
    fprint("Wait hang on, I saw this in a Vsauce video. I put three cans of soup in the cupboard. Two of them are normal, but one was made with crab stock. Pick one, if you dare!!!\n", "green")
    fprint("You doubt the narrator's legitimacy, but should probably choose carefully anyway.\n", "dim")
    local crab_stock = math.random(3)
    cans = {"Blue can", "Red can", "Green can"}
    choice(cans, function ()
        local reveal_can = math.random(3)
        local switch_answer = 0
        while reveal_can ~= answer and reveal_can ~= crab_stock do
            reveal_can = math.random(3)
        end
        if answer == 1 and reveal_can == 2 then switch_answer = 3
        elseif answer == 2 and reveal_can == 3 then switch_answer = 1
        elseif answer == 1 and reveal_can == 3 then switch_answer = 2
        end

        fprint("I choose-\n", "cyan", 0)
        fprint("BUT WAIT! The " .. cans[reveal_can]:lower() .. " DOESN'T contain any crab stock. Do you want to switch your selected can?\n", "green")
        local first_answer = answer
        choice({"Keep it on the " .. cans[answer]:lower(), "Switch it to the " .. cans[switch_answer]:lower()}, function ()
            if answer == 2 then
                answer = switch_answer
                fprint("Heh. Switching increases your chance of getting the crab stock to 2/3. Let's see which one it REALLY is...\n", "green")
            else
                fprint("Smart move. Switching increases your chance of getting the crab stock to 2/3. Let's see which one it REALLY is...\n", "green")
            end
            fprint("You hear a muffled drumroll from inside the cupboard.\n", "dim", 1)
            if answer == crab_stock then
                fprint("You chose the " .. cans[answer]:lower() .. ", which is ALSO the crab stock! You imbecile!\n", "green", 1.5)
                fprint("Your heart races as you open the cupboard door. There lies the " .. cans[answer]:lower() .. ", mocking you. Calling to you as if to say \"please, please eat me\". You shudder, knowing what must be done.\n", "dim", 1)
                fprint("The microwave beeps deafeningly loud. A piping hot bowl of soup is inside. What have you become? Eating one of your own? Don't think that this isn't your fault. YOU chose the can. You deserve this.\n", "dim", 1)
                fprint("Your spoon extends into the soup's surface, dredging some broth, perhaps a few bits of meat. You bring it closer and closer to your mouth.", "dim", 1)
                fprint("With a single gulp, you've committed a cardinal sin.\n", "dim", 1)
                fprint("It's fine. Crabs eat each other all the time in nature btw.\n", "cyan", 1)
                fprint("Cannibalistic tendencies + 9", "rainbow", 1)
            else
                fprint("You chose the " .. cans[answer]:lower() .. ", but the crab stock was the " .. cans[crab_stock]:lower() .. ". You get off THIS time...\n", "green")
                fprint("You heat your soup in the microwave and enjoy a nice dinner while watching the news.\n", "dim", 1)
            end
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
            run(end_of_day)
        end)
    end)
end

function days.wrong_secret_agent()
    fprint("You're chilling at your house watching Cray's Anatomy when your phone rings.\n", "dim", 1)
    play_sound("assets/ring.ogg")
    fprint("RIIIIING. RIIIIIIIng. riiNIIINGGGN.\n", "red", 1)
    fprint("You pick up the phone.", "dim")
    fprint("Hey man, what's u-\n", "cyan", 0)
    fprint("Your position has been compromised. We've sent plane tickets to your dead drop. Leave as soon as possible without raising suspicion.\n", "yellow", 1)
    fprint("...", "cyan", 1)
    fprint("Who are you?\n", "cyan")
    fprint("Oh, haha, wrong number lol.\n", "yellow", 1)
    fprint("Wack.\n", "green", 1)

    fprint("Stealth - 4", "rainbow", 1)
    fprint("Experience + 1\n", "rainbow", 2)
    config.experience = config.experience + 1
    run(end_of_day)
end

function days.slide_whistle()
    fprint("You hear a slide whistle start descending in pitch.\n", "dim", 1)
    choice({"Step left", "Step right"}, function ()
        fprint("You step to your " .. (answer == 1 and "left" or "right") .. " and look up.", "dim", 1)
        play_sound("assets/slide_whistle.ogg")
        if math.random(2) == 1 and config.message ~= "slide_whistle_die" then
            fprint("\nCool looking piano.\n", "cyan", 1)
            play_sound("assets/piano_crash.ogg")
            sleep(3)
            config.message = "slide_whistle_die"
            config.state = "Hah. Idiot. Crushed by a falling piano. Classic.12"
            run(end_of_day)
            return
        end
        sleep(1.5)
        play_sound("assets/piano_crash.ogg")
        fprint("Beside you, a large grand piano obliterates the sidewalk.\n", "dim", 1)
        fprint("Neat.\n", "cyan", 1)
        fprint("Experience + 1\n", "rainbow", 2)
        config.experience = config.experience + 1
        run(end_of_day)
    end)
end

function days.ant_simulator()
    fprint("Damn, all these leaves in the gutter, gotta clean it out.", "cyan")
    fprint("..Oh? What's this?\n", "cyan")
    fprint("In the midst of the leaves, you find a retro Game Koi cartridge.\n", "dim")
    fprint("Ant Simulator?? I've never heard of that.\n", "cyan")
    fprint("Quickly, you find your old Game Koi Color and plug it in.\n", "dim", 1)

    pause()
    clear()
    sleep(1)

    ant_sim_color_palette = true

    fprint("WELCOME TO ANT SIMULATOR (2020)", colors.bright_red, 3)
    fprint("Welcome!", colors.bright_green)
    fprint("You've died tragically " .. config.random_death(), colors.bright_red)
    fprint("Luckily...", colors.bright_red)
    fprint("You've been reincarnated as an ant!", colors.bright_red)
    fprint("So, strap in and enjoy the ride.", "white")
    fprint("There's a lot to do as an ant these days!", "white", 3)

    clear()
    sleep(1)

    fprint("DAY 1\n", "white", 1)
    fprint("Two younger male ants corner you on your way out of the hill", colors.bright_dim)
    fprint("(The ant hill, that is)\n", colors.bright_dim)

    fprint("Hey, look what we have here...\n", colors.bright_yellow)
    fprint("Says one of the ants\n", colors.bright_dim)
    fprint("Fresh meat, heheh\n", colors.bright_yellow)
    choice({"Hey, step off", "Ants are meat?"}, function ()
        if answer == 1 then
            fprint("Hey, step off.\n", colors.bright_cyan, 1)
            fprint("Ok buddy.\n", colors.bright_yellow, 1)
            fprint("Whoa, confidence. That's pretty hot dude.\n", colors.bright_green, 1)
            fprint("Hotness + 10347", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 3)
            ant_sim_color_palette = false
        else
            fprint("Are ants even meat though? I guess we're animals but no one would call us meaty, right?\n", colors.bright_cyan, 1)
            fprint("Shut up nerd.\n", colors.bright_yellow, 1)
            fprint("They proceed to beat the shit out of you, real \"oof ouch owie\" stuff.\n", colors.bright_dim, 2)
            config.state = "You die in the game, you die in real life. Yooooooooo.14"
            ant_sim_color_palette = false
            run(end_of_day)
            return
        end
        clear()
        sleep(1)
        fprint("Alright, enough of that, I gotta get back to cleaning.\n", "cyan", 1)
        fprint("Enjoyment in an otherwise cynical world + 2", "rainbow", 1)
        fprint("Experience + 1\n", "rainbow", 2)
        run(end_of_day)
    end)
end

function days.online_salt()
    fprint("After pressure from your friends, you finally get around to playing Valoratlantic. You queue into an unrated match and greet your teammates.\n", "dim")
    fprint("Hi guys! Ready to have an awesome g-\n", "cyan", 0)
    fprint("Shut up\n", "yellow", 0)
    fprint("Stop talking\n", "blue", 0)
    fprint("Kill yourself\n", "purple", 2)
    fprint("yeesh\n", "green", 1)

    choice({"Rush B through window", "Slow walk B through long", "Rush A through showers"}, function ()
        if answer == 1 or answer == 2 then
            fprint("You and your team full send B, getting an entry kill and trading another three to clear site and plant.\n", "dim", 1)
            fprint("Footsteps backsite", "blue")
            fprint("One of your chud teammates calls out.\n", "dim", 1)
            play_sound("assets/pistol.ogg")
            fprint("ftonk ftonk ftonk (sound a pistol makes)\n", "red", 3, 0)
            fprint("Your last teammate got got, making it a 1v1.\n", "dim", 1)
            fprint("Last guy is def long trust", "yellow", 0)
        else
            fprint("You and your team full send A, getting an entry kill and trading another three to clear site and plant.\n", "dim", 1)
            fprint("Footsteps heaven", "blue")
            fprint("One of your chud teammates calls out.\n", "dim", 1)
            play_sound("assets/pistol.ogg")
            fprint("ftonk ftonk ftonk (sound a pistol makes)\n", "red", 3, 0)
            fprint("Your last teammate got got, making it a 1v1.\n", "dim", 1)
            fprint("Last guy is def cubby trust", "yellow", 0)
        end

        fprint("Calls out another helpful chud.\n", "dim")
        fprint("You one-tap the remaining enemy, closing out the round.\n", "dim", 1)
        fprint("Haha, get fucked.\n", "cyan")
        choice({"Trash talk", "Play nice"}, function ()
            if answer == 1 then
                fprint("CrabbyMan: L mickey mouse deagle", "white", 3, 0)
                fprint("CrustaceanStation: 3319 Pulaski Hwy\f Baltimore\f MD 21224 181\a91\a242\a118\n", "white", 3, 0)
                fprint("You turn off your computer and sit for a while.\n", "dim", 1)
                config.personality = config.personality - 1
            else
                fprint("You decide to be a huge fucking BABY and not trash talk like a real gamer. You end up losing 6-13 from insufficient GAMER rage.\n", "dim")
                fprint("Last time I ever play with you smh\n", "green", 1)
                config.personality = config.personality + 1
            end
            fprint("Experience + 1\n", "rainbow", 2)
            run(end_of_day)
        end)
    end)
end

function days.c_broom_hospital()
    fprint("You wound up in the hospital following your magical calamity.\n", "dim")
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
                fprint("Experience + 1\n", "rainbow", 2)
                config.personality = config.personality - 1
                config.experience = config.experience + 1
            end
            run(end_of_day)
        end
    )
end

function days.c_crab_exam_death()
    fprint("At 4 in the morning, you're woken by loud knocking at your door.\n", "dim", 1)
    fprint("Yeah, what is it?\n", "cyan", 1)
    fprint("A crab with really cool sunglasses steps into your apartment, holds up a gun, and pulls the trigger.\n", "dim", 2)
    config.state = "You didn't renew your license at the A-Sea-Ts yesterday, so a government official was dispatched to ensure you didn't remain a crab any longer. Think longer about your education next time, alright?08"
    run(end_of_day)
end

function days.c_cringe_narrator()
    fprint("Hey man. I know it's only been " .. config.days .. " " .. config.day_plural() .. ", but I feel like we've gotten pretty close, you know?\n", "green")
    choice({"What?", "I thought I was the only one..."}, function ()
        if answer == 1 then
            fprint("Um. What do you mean by that?\n", "cyan")
            fprint("Oh lmao wrong number this was someone else so sorry.\n", "green")
            fprint("Mm, ok.\n", "cyan")
            fprint("no really my friend took my phone it was just a joke.\n", "green")
            fprint("Oh, alright.\n", "cyan")
            fprint("I narrate a lot of different people btw.\n", "green")
            fprint("Cool.\n", "cyan")
            config.state = "God, that was awkward. You died so hard on the inside that your body followed your mind.04"
        else
            fprint("Oh shit bro, totally, fuck I thought I was the only one.\n", "cyan")
            fprint("Wait really? No cap?\n", "green")
            fprint("Yeah bro we got a connection.\n", "cyan")
            fprint("Oh dip that's pretty epic.\n", "green")
            fprint("And then you woke up.\n", "dim", 1)

            fprint("Predictability + 5", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.experience = config.experience + 1
        end
        run(end_of_day)
    end)
end

function days.c_hot_crab_second_meeting()
    fprint("After a long day at the offish, you decide to let off some steam at the local pub.\n", "green")
    fprint("One fish-key neat, thanks.\n", "cyan")
    fprint("Coming right up. Hey, you look a little down, you good?\n", "yellow")
    fprint("Yeah, I'm fine, just a little lonely lately.\n", "cyan")
    fprint("Hey, I get it. Why don't you talk to her?\n", "yellow")
    fprint("He points to a crab across the bar, her face concealed by a tall seaquila sunrise.\n", "dim")

    fprint("Sure, what do I have to lose?\n", "cyan")
    fprint("The bartender goes over and gestures to you.", "dim")
    fprint("You can't tell what they're saying from a distance, but you can tell the crab is the most beautiful you've ever seen.\n", "dim")
    fprint("The bartender walks over.\n", "dim", 0.1)
    fprint("Hey, she's gonna come over. Get ready!\n", "green")
    fprint("Oh god, okay.\n", "cyan")
    fprint("She walks over.\n", "dim")
    fprint("Uhh, hey.\n", "cyan")
    fprint("She looks at you, surprised.\n", "dim")
    fprint("Oh, hi? Excuse me.\n", "blue")
    fprint("She walks past you to a younger, much more attractive crab behind you.\n", "dim")
    fprint("What?\n", "cyan")
    fprint("Oh, you thought I was talking to you?\n", "yellow")
    fprint("Yeah, kind of??\n", "cyan")
    fprint("Nahhh.\n", "yellow", 1)
    fprint("... Didn't this story beat already happen?\n", "cyan")
    fprint("I think we need better writers.\n", "yellow")
    fprint("Agreed.\n", "cyan")
    fprint("Agreed.\n", "green")
    fprint("Well I think it's kind of charming.\n", "rainbow")
    fprint("FUCK you, go back to doing stats, Stat Boy.\n", "green")
    fprint("*sniff* fine, experience + 1\n", "rainbow", 2)

    config.experience = config.experience + 1
    run(end_of_day)
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
    fprint("You're in the checkout line at Walmart when you encounter a ... familiar looking crab.\n", "green")
    fprint("ARRR, WHAT DO YE MEAN ME COUPON'S EXPIRED!?!?\n", "yellow")
    fprint("I'm sorry sir, but this coupon is-\n", "blue", 0)
    fprint("WALK THE PLANK, LANDLUBBER, I NEED ME VITAMIN-SEA SUPPLEY-MENTS! (ARRG)\n", "yellow")
    fprint("Whoa, looks like that pirate's gonna get scurvy if you don't do anything. What do you do?\n", "green")

    choice({"Stand up for the pirate", "Let him get what he deserves"}, function ()
        if answer == 1 then
            fprint("You've decided to yell at the poor service worker who probably gets paid minimum wage.\n", "dim")
            fprint("Hey man, this pirate's trying to stay healthy. Just let him use the coupon.\n", "cyan")
            fprint("ARrgh?\n", "yellow")
            fprint("The pirate has never encountered compassion before today.\n", "dim")
            fprint("You know what, fine, I don't care.", "blue")
            fprint("Says the cashier.\n", "dim", 1)
            fprint("SINK ME, MATEY, YE DID IT!", "yellow")
            fprint("Forget what I said yesterday. A crab like ye would be a fine addition te any respectable pirate crew.\n", "yellow")
            fprint("Disdain for pirates - 10", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.personality = config.personality + 1
        else
            fprint("Sir, this coupon is for Target. We can't accept this.", "blue")
            fprint("The cashier says.\n", "dim", 1)
            fprint("The pirate lets out a small arghhh before evaporating into a puff of citrus-scented smoke.\n", "dim", 1)
            fprint("Emotional scarring associated with Walmart + 4", "rainbow", 1)
            fprint("Experience + 1\n", "rainbow", 2)
            config.personality = config.personality - 1
        end
        config.experience = config.experience + 1
        run(end_of_day)
    end)
end

function days.c_secret_meeting()
    fprint("You receive an anonymous invitation to a secret meeting later tonight.\n", "dim", 1)
    fprint("Weird. Should I even go to this?\n", "cyan")
    choice({"Yes", "No"}, function ()
        if answer == 1 then
            fprint("Later that night you go to the unsuspecting place at the unsuspecting time.\n", "dim", 1)
            fprint("Surrounding a small fire are 10 hooded crabs.", "dim")
            fprint("You hold up your invitation.\n", "dim")
            fprint("I was told there would be a secret meeting here?\n", "cyan")
            fprint("What does it look like dumbass.\n", "yellow")
            fprint("Right, right. So what's this for?\n", "cyan")
            fprint("We have reason to believe that you, like us, had a past, non-crab life.\n", "yellow")
            choice({"Oh yeah that's me", "I have no idea what you're talking about"}, function ()
                if answer == 1 then
                    fprint("Holy shit, yes, that's me, you guys were reincarnated too??\n", "cyan")
                    fprint("It's as we feared. I'm sorry for what we must do.\n", "yellow")
                    fprint("What? What do you mean?\n", "cyan")
                    fprint("Crab-induced psychosis. They can't cope with the crab lifestyle and conjure up memories of a fake past life. Truly, it's better this way.\n", "yellow", 2)
                    config.state = "While you were contemplating your reality, one of the hooded crabs pushed you into the fire. Yeowch!16"
                    run(end_of_day)
                else
                    fprint("What? I don't know what you're talking about.\n", "cyan")
                    fprint("Oh, that's a relief. Uhh, make sure you don't tell anyone about this, then.\n", "yellow")
                    fprint("Yea dw.\n", "cyan")
                    fprint("You take the bus back and have pasta for dinner.\n", "dim", 1)
                    fprint("Experience + 1\n", "rainbow", 2)
                    config.experience = config.experience + 1
                    run(end_of_day)
                end
            end)
        else
            fprint("ok not to railroad you, but I worked really hard on the other option\n", "green", 1)
            fprint("shoot I'm sorry man, I'll go back and pick yes instead\n", "cyan")
            fprint("no but like now it's weird...\n", "green", 1)
            fprint("no no it's cool, I'll go to the secret meeting\n", "cyan")
            fprint("nah seriously drop it, it's fine", "green", 2)
            fprint("but like you can always respawn, so why not pick the interesting option?\n", "green")
            fprint("Dude you say it's \"fine\" but it's clearly not. What do you actually want me to do?\n", "cyan")
            fprint("no I'm serious just stop talking about it\n", "green", 1)
            fprint("Whatever man\n", "cyan", 2)
            config.state = "The narrator left the groupchat and like we could totally add them back but it'd be weird so like idk what to do.15"
            run(end_of_day)
        end
    end)
end

return days
