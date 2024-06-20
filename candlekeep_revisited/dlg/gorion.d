BEGIN C0CR#GOR
BEGIN C0CR#JON
BEGIN C0CR#ERI
BEGIN C0CR#ULR
BEGIN C0CR#DOG
BEGIN C0CR#GFM

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionBegin","GLOBAL",0)~ THEN C0CR#GOR C0CandleReGorion
~There you are, my child.~ [GORIN01]
DO ~SetGlobal("C0CandleReGorionBegin","GLOBAL",1)~
END
IF ~Global("C0CandleReClassStartBard","GLOBAL",1)~ EXTERN C0CR#GOR C0CandleReGorionBard
IF ~Global("C0CandleReClassStartCleric","GLOBAL",1)~ EXTERN C0CR#GOR C0CandleReGorionCleric
IF ~Global("C0CandleReClassStartMage","GLOBAL",1)~ EXTERN C0CR#GOR C0CandleReGorionMage
IF ~Global("C0CandleReClassStartFighter","GLOBAL",1)~ EXTERN C0CR#JON C0CandleReGorionFighter
IF ~Global("C0CandleReClassStartThief","GLOBAL",1)~ EXTERN C0CR#DED C0CandleReGorionThief
IF ~Global("C0CandleReClassStartRanger","GLOBAL",1)~ EXTERN C0CR#ERI C0CandleReGorionRanger
IF ~Global("C0CandleReClassStartDruid","GLOBAL",1)~ EXTERN C0CR#GOR C0CandleReGorionDruid
IF ~Global("C0CandleReClassStartMonk","GLOBAL",1)~ EXTERN C0CR#GOR C0CandleReGorionMonk
IF ~Global("C0CandleReClassStartShaman","GLOBAL",1)~ EXTERN C0CR#GOR C0CandleReGorionShaman
IF ~Global("C0CandleReClassStartBlackguard","GLOBAL",1)~ EXTERN C0CR#GOR C0CandleReGorionBlackguard

CHAIN C0CR#GOR C0CandleReGorionEnd
~And take these coins. We will have a chance to buy supplies on the road, but it is best to be prepared. Winthrop keeps a steady stock of equipment, and you will find most of what you need with him.~
DO ~GiveGoldForce(400)~
= ~Gather whatever you feel is necessary and meet me at the front of the castle. I will be waiting for you there, my child.~
END
IF ~AreaCheck("AR2617")~ DO ~PlaySong(0) EscapeArea()~ EXIT
IF ~AreaCheck("AR2616")~ DO ~PlaySong(0) ActionOverride("DEEDER",EscapeAreaObject("Door2600")) EscapeAreaObject("Door2600")~ EXIT
IF ~AreaCheck("AR2600")~ DO ~PlaySong(0) ActionOverride("C0CR#GFM",EscapeAreaObject("Door2608"))
               ActionOverride("C0CR#JON",EscapeAreaObject("Door2608"))
							 ActionOverride("C0CR#ERI",EscapeAreaObject("Door2608"))
							 ActionOverride("C0CR#DOG",EscapeAreaObject("Door2608"))
							 EscapeAreaObject("Door2608")~ EXIT

// Bard
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionBard
~Your skills in the musical arts have improved greatly in the recent months. Even I, as untrained in such ways as I am, could not help but be lost in your performance.~
= ~I only regret that you will have little chance to test them on the road. Were things different, I would like to see you become a proper ministrel, and make your name known in the world.~
END
  ++ ~I'm sure I will have my chance one day.~ EXTERN C0CR#GOR C0CandleReGorionBard.1
  ++ ~Must we go, father? I still have much to learn from the library, both in the arts and otherwise.~ EXTERN C0CR#GOR C0CandleReGorionBard.2
  ++ ~There will be more opportunity outside of Candlekeep than within. When do we depart, father?~ EXTERN C0CR#GOR C0CandleReGorionBard.2

CHAIN C0CR#GOR C0CandleReGorionBard.1
~You will, child, I promise you. But for now, I hope that you will consider nothing but your safety. There will be a time for peace, but for now, we must be ready for our journey, which will be a perilous one.~
EXTERN C0CR#GOR C0CandleReGorionBard.3

CHAIN C0CR#GOR C0CandleReGorionBard.2
~It is necessary, child. I am sorry it cannot be otherwise. I, too, find comfort in the peace and knowledge gifted to us in Candlekeep. But our peaceful lives cannot last, even if we were to hide within these walls, even for another month. For your sake, I must take you to where true safety can be found.~
EXTERN C0CR#GOR C0CandleReGorionBard.3

CHAIN C0CR#GOR C0CandleReGorionBard.3
~I have prepared everything for our journey, but there is still some time for you to say your farewells and set your affairs in order.~
= ~That, of course, includes those of your admirers. *sigh* One of them—I will not mention which—left me this token of what I presume to be affection, to be given to you. They believed you would "know how to use it in the most appropriate, or possibly inappropriate way". Where they even find such things, I do not know...~
DO ~GiveItemCreate("potn60",Player1,1,0,0)~
= ~I do hope you will not attract this much attention on our journey. For safety's sake, of course.~
END
  ++ ~I do not intend for this kind of attention, father, I swear.~ EXTERN C0CR#GOR C0CandleReGorionBard.4
  ++ ~Can you say that you yourself were not the same in your youth?~ EXTERN C0CR#GOR C0CandleReGorionBard.5
  ++ ~I understand, father.~ EXTERN C0CR#GOR C0CandleReGorionBard.6

CHAIN C0CR#GOR C0CandleReGorionBard.4
~I know, child. I do not mean to accuse you. I simply wish you to know that not all who bestow attention to you will do it for benevolent reasons. I hope you will understand.~
EXTERN C0CR#GOR C0CandleReGorionBard.6

CHAIN C0CR#GOR C0CandleReGorionBard.5
~Nonsense! Where did you hear such rumors... *ahem*. What I mean to say, child, is that such things may naturally come of youth, but you must always keep aware of people's intentions along with their attention.~
EXTERN C0CR#GOR C0CandleReGorionBard.6

CHAIN C0CR#GOR C0CandleReGorionBard.6
~As I said, you should seek out your friends to bid them farewell, as I know you are popular around the keep's social circles. Do not take too long, however. Time is of the essence.~
EXTERN C0CR#GOR C0CandleReGorionEnd

// Cleric
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionCleric
~Forgive me for interrupting your prayers. I understand it is no small misstep to disrupt a person of faith's communion with their deity.~
END
  ++ ~Would you care to stand with me for a while, father, and say your own prayers to Mystra?~ EXTERN C0CR#GOR C0CandleReGorionCleric.1
  ++ ~I am close to finished regardless. Is it time to go?~ EXTERN C0CR#GOR C0CandleReGorionCleric.2
  ++ ~This is just a formality. I was looking for an excuse to do something else.~ EXTERN C0CR#GOR C0CandleReGorionCleric.3

CHAIN C0CR#GOR C0CandleReGorionCleric.1
~Were this any other day, I would perhaps follow your example, <CHARNAME>. But not today.~
EXTERN C0CR#GOR C0CandleReGorionCleric.2

CHAIN C0CR#GOR C0CandleReGorionCleric.2
~I truly hope you find comfort in your faith, for you will need it in the trials that yet await you. Our journey from Candlekeep awaits, and I trust you are prepared, both physically and spiritually.~
DO ~GiveItemCreate("scrl56",Player1,1,0,0) GiveItemCreate("scrl59",Player1,1,0,0)~
= ~The priests of Oghma have always supported your path in dedicating your life to faith. Now that you are soon to leave, they have prepared a gift to you which I have here. Take them, child, though I hope you will not need to use them.~
= ~We must leave soon, but you should have some time to seek your friends and say your farewells.~
EXTERN C0CR#GOR C0CandleReGorionEnd

CHAIN C0CR#GOR C0CandleReGorionCleric.3
~That will not do, child. I may not be a man of the cloth, but I know that though the gentle gods ask nothing unreasonable of their faithful, devotion must still be true, not performative.~
EXTERN C0CR#GOR C0CandleReGorionCleric.2

// Mage
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionMage
~I see you are deep into your magical study. It is a good thing... would that we had more time, I would like to see your training through to the end.~
= ~Still, your talent is clear, and even without the assistance of Candlekeep's tutors, I am certain your skills with the Art will flourish.~
END
  ++ ~I've mastered the basics, father, but there is still much I do not know. I don't believe I'm fully prepared for my skills to be tested.~ EXTERN C0CR#GOR C0CandleReGorionMage.1
  ++ ~One day, I hope to be as skilled a mage as you.~ EXTERN C0CR#GOR C0CandleReGorionMage.2
  ++ ~Is it time to go, father?~ EXTERN C0CR#GOR C0CandleReGorionMage.3

CHAIN C0CR#GOR C0CandleReGorionMage.1
~Few are ever truly prepared fully for what is in store for them, <CHARNAME>. Knowing what you can is enough. Whatever you still feel you lack, I will teach you. I promise that.~
EXTERN C0CR#GOR C0CandleReGorionMage.3

CHAIN C0CR#GOR C0CandleReGorionMage.2
~Hah. My skill cannot be called extraordinary when put alongside those truly great that I have known, <CHARNAME>. Perhaps you may even see that for yourself one day. But I have years of experience, years that I hope you will also gain.~
EXTERN C0CR#GOR C0CandleReGorionMage.3

CHAIN C0CR#GOR C0CandleReGorionMage.3
~We should be considering our journey, child, but I cannot deny myself being distracted by the nostalgic feeling of watching you practice. Each mage remembers the day they mastered their first spell. Regardless of how simple it seemed in hindsight, ~
END
 ++ ~What spell was your first, father?~ + C0CandleReGorionMage.4

CHAIN C0CR#GOR C0CandleReGorionMage.4
~Mine, child? Well, I suppose I could simply show you. I never sought a particular school of study, as I sought the knowledge of every aspect of the Weave. Yet, I remember, clearer than the others, my attempts to master the school of Conjuration.~
= ~Perhaps it was the arrogant youth in myself, that which I have strived to lead you away from, that sought to bend other beings to my will. But such is not the way, as I will show you.~
= ~The art of conjuration requires focus, and a measure of respect for that which you call forth. Truly understanding the being you are seeking is the key to a successful summoning. Watch...~
DO ~SetGlobal("C0CandleReGorionFamiliar","GLOBAL",1)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#016")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionFamiliar","GLOBAL",1)~ THEN C0CR#GFM C0CandleReGorionMageFam
~Wh—Gorion! Aw, and there I was watching those two cats yowling and scratching at each other, such funny things they are... oh, hello, <CHARNAME>. Have I been called for playtime, or babysitting again?~
== C0CR#GOR ~*sigh* Paloma...~
== C0CR#GFM ~Just a little joke, master. I can guess you've summoned me as part of a lesson again. But I was having so much fun on my own! I want an apple for compensation. A nice, red, juicy one.~
== C0CR#GOR ~Paloma, this is hardly the time.~
== C0CR#GFM ~Apple!~
== C0CR#GOR ~What am I going to do with you...?~
END
  ++ ~Come on, father. Just one apple for her wouldn't hurt.~ EXTERN C0CR#GOR C0CandleReGorionMageFam.1
  ++ ~I want an apple too. Magic practice builds up a hunger.~ EXTERN C0CR#GOR C0CandleReGorionMageFam.1
  ++ ~Paloma, come on now. Be reasonable.~ EXTERN C0CR#GFM C0CandleReGorionMageFam.2

CHAIN C0CR#GOR C0CandleReGorionMageFam.1
~It is hard to decide who is truly the child here. *sigh* I suppose I have little choice... come then, Paloma, you silly creature. As for you, child, I believe you should be able to master the spell after my demonstration. Perhaps your bonded familiar will be less... difficult than this one here.~
END
IF ~!Class(Player1,SORCERER)~ DO ~ActionOverride(Player1,AddSpecialAbility("SPWI123")~ EXTERN C0CR#GOR C0CandleReGorionMageFam.3
IF ~Class(Player1,SORCERER)~ DO ~GiveItemCreate("SCRL6D",Player1,1,0,0)~ EXTERN C0CR#GOR C0CandleReGorionMageFam.2

CHAIN C0CR#GOR C0CandleReGorionMageFam.2
~Your connection to the Art is one of instinct rather than practice, but there is still much to be learned through conventional learning even for one with your gifts. Take this, child, and study it well. A mage can always trust in their closest companion bonded through the Weave.~
EXTERN C0CR#GOR C0CandleReGorionMageFam.3

CHAIN C0CR#GOR C0CandleReGorionMageFam.3
~Now, for the most important matter, you should consider what you have left to do before we depart. Our journey will be a long one, and you owe it to your friends a proper farewell.~
EXTERN C0CR#GOR C0CandleReGorionEnd

CHAIN C0CR#GFM C0CandleReGorionMageFam.2
~APPLE!~
END
  ++ ~Maybe just a quick snack? It wouldn't take too long.~ EXTERN C0CR#GOR C0CandleReGorionMageFam.1
  ++ ~Sorry, father. I tried.~ EXTERN C0CR#GOR C0CandleReGorionMageFam.1

// Fighter
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionJondalarBegin","GLOBAL",0)~ THEN C0CR#JON C0CandleReJondalarFighter
~Okay, okay, that's enough for now. Put down the staff for a bit and take a break, kid. Nice work.~
DO ~SetGlobal("C0CandleReGorionJondalarBegin","GLOBAL",1)~
== C0CR#JON ~We've gone over all of the basic drills, plus a few more moves you wouldn't learn from the Watchers. I'd say you're more well-trained than any regular bandit on the Sword Coast. And, with Gorion with you... I don't think you'll be in much danger on the road.~
END
  ++ ~Thank you for the practice, Jondalar. I know it was sudden.~ EXTERN C0CR#JON C0CandleReJondalarFighter.1
  ++ ~I bet I could knock you into the dirt with this stick too, at this point.~ EXTERN C0CR#JON C0CandleReJondalarFighter.2

CHAIN C0CR#JON C0CandleReJondalarFighter.1
~No, no, it's no trouble at all, <CHARNAME>. Gorion asked this of me, after all, and I wouldn't ever say no to that. And you've got plenty of talent, enough that you'll probably be way ahead of me in no time.~
EXTERN C0CR#JON C0CandleReJondalarFighter.3

CHAIN C0CR#JON C0CandleReJondalarFighter.2
~Haha! Big talk, kid. If we had some more time I'd take you up on that challenge, but we're both on a schedule. I've still got all those other younguns to beat into shape, and you've got that journey ahead of you.~
EXTERN C0CR#JON C0CandleReJondalarFighter.3

CHAIN C0CR#JON C0CandleReJondalarFighter.3
~But, <CHARNAME>. Is this really necessary? I mean, how could anywhere out there be safer than right here? I'm not sure it's better for you to go, and I know all your friends would agree.~
END
  ++ ~I don't like it either. But I trust what Gorion says.~ EXTERN C0CR#JON C0CandleReJondalarFighter.4
  ++ ~It's time for me to go out and see the world anyway. Sooner better than later, right?~ EXTERN C0CR#JON C0CandleReJondalarFighter.5

CHAIN C0CR#JON C0CandleReJondalarFighter.4
~Yeah, no arguing there. Everyone here respects Gorion's word. Well, perhaps that old goat Ulraunt, but you don't need me to tell you that.~
EXTERN C0CR#JON C0CandleReJondalarFighter.6

CHAIN C0CR#JON C0CandleReJondalarFighter.5
~You're right, and I get how you feel. Anyone would probably get the urge to head out, after living inside the walls of this place all their lives.~
EXTERN C0CR#JON C0CandleReJondalarFighter.6

CHAIN C0CR#JON C0CandleReJondalarFighter.6
~It's just... you know, all of us from the monks to the Watchers, old Winthrop, Tethtoril and the lot... we've all watched you grow up. And now you're leaving, and we don't know where you're going and when you'll come back.~
= ~And the world out there... it's all messed up, we've all heard the stories even here. People dying left and right, armor and weapons failing them at the worst of times. It's not all like the stories in the books and songs.~
END
IF ~True()~ EXTERN C0CR#JON C0CandleReJondalarFighter.8
IF ~CheckStatGT(Player1,1,PROFICIENCYBASTARDSWORD)~ DO ~GiveItemCreate("SW1H01Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYLONGSWORD)~ DO ~GiveItemCreate("SW1H04Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYSHORTSWORD)~ DO ~GiveItemCreate("SW1H07Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYAXE)~ DO ~GiveItemCreate("AX1H01Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYTWOHANDEDSWORD)~ DO ~GiveItemCreate("SW2H01Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYKATANA)~ DO ~GiveItemCreate("SW1H43",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYSCIMITARWAKISASHININJATO)~ DO ~GiveItemCreate("SW1H20Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYDAGGER)~ DO ~GiveItemCreate("DAGG01Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYWARHAMMER)~ DO ~GiveItemCreate("HAMM01Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYSPEAR)~ DO ~GiveItemCreate("SPER01Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYHALBERD)~ DO ~GiveItemCreate("HALB01Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYFLAILMORNINGSTAR)~ DO ~GiveItemCreate("BLUN02Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7
IF ~CheckStatGT(Player1,1,PROFICIENCYMACE)~ DO ~GiveItemCreate("BLUN04Q",Player1,1,0,0)~ EXTERN C0CR#JON C0CandleReJondalarFighter.7

CHAIN C0CR#JON C0CandleReJondalarFighter.7
~Here, kid. I was planning on giving this to you later in the day, as a sort of farewell present, but I'd rather you take it off my hands now so I can think about it less. This iron crisis, it's causing all sorts of chaos in the Sword Coast right now.~
= ~Most people'll empty their purses just for a reliable weapon that'll stay in one piece. I, uh, called in a few favors from Arkanis and the other smiths to gather some old pieces of metal and reforge them into this. It doesn't look much different from others like it, but I know it's the sort you're comfortable with, and I can promise its iron is pure.~
EXTERN C0CR#JON C0CandleReJondalarFighter.8

CHAIN C0CR#JON C0CandleReJondalarFighter.8
~Anyways, you should get going. Gorion told me to send him over to you when we were finished with our drills. I've probably kept you longer than I should've as is... oh, there's the old man right there.~
DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#010")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionJondalarBegin","GLOBAL",1)~ THEN JONDAL C0CandleReJondalarNew
~Hey there, <CHARNAME>! I see you haven't left yet. Gorion asked me one last favor just after we parted ways. Seems like he wants use to have one last spar before you go heading off, so you know what it's like to get in a real fight.~
DO ~SetGlobal("C0CandleReGorionJondalarBegin","GLOBAL",2)~ EXTERN JONDAL 1

CHAIN C0CR#JON C0CandleReGorionFighter
~Good <DAYNIGHT>, Gorion, sir. <CHARNAME> and I have just finished our special drills, right as you arrived.~
== C0CR#GOR ~I can see that. Thank you, Jondalar, and well done, child. I trust that you have treated your training most seriously?~
END
  ++ ~Of course. I'm sure I'll need my skills on our journey.~ EXTERN C0CR#GOR C0CandleReGorionFighter.1
  ++ ~It's not as though I have a choice.~ EXTERN C0CR#GOR C0CandleReGorionFighter.2

CHAIN C0CR#GOR C0CandleReGorionFighter.1
~Indeed, you will, though I wish you did not, child.~
EXTERN C0CR#GOR C0CandleReGorionFighter.3

CHAIN C0CR#GOR C0CandleReGorionFighter.2
~No, you do not, child, though it is not for my lectures.~
EXTERN C0CR#GOR C0CandleReGorionFighter.3

CHAIN C0CR#GOR C0CandleReGorionFighter.3
~I would prefer that you led a life away from death, but it is one we cannot avoid, I fear.~
== C0CR#JON ~I'm certain <CHARNAME>'s skills will keep <PRO_HIMHER> safe, even amidst the dangers of the Sword Coast, sir. I can assure you, <PRO_HESHE> is talented in combat.~
== C0CR#GOR ~I do not doubt it, but death can take many forms in the dealing. But that is a matter for another time. You must prepare yourself, child, for we are soon to depart. You have some time to say your farewells, but do not take too long.~
EXTERN C0CR#GOR C0CandleReGorionEnd

// Thief
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReDederStart","GLOBAL",1)~ THEN C0CR#DED C0CandleReDederStart
~There you go, <CHARNAME>. Lockpicks, pliers, rope, file... all standard tools of the trade. You already know how to use them.~
= ~Need anything else that isn't there, <CHARNAME>, just give me a call. We can't have you going out into the world without covering all of your bases, you know.~
END
  ++ ~Thanks for all your help, Deder.~ EXTERN C0CR#DED C0CandleReDederStart.1
  ++ ~Got any poisons you can share?~ EXTERN C0CR#DED C0CandleReDederStart.2
  ++ ~I should get going now.~ EXTERN C0CR#DED C0CandleReDederStart.4

CHAIN C0CR#DED C0CandleReDederStart.1
~No trouble at all, kid. As long as it helps you survive out in the world. It's a rougher life in the Sword Coast than you might expect. There aren't any rules other than surviving outside of a city's walls. Sometimes, even in it.~
EXTERN C0CR#DED C0CandleReDederStart.3

CHAIN C0CR#DED C0CandleReDederStart.2
~"Poisons"? *whisper* Listen, kid. It's not that I don't trust you. But the Watchers aren't going to like it if they hear I'm giving you something like poison.~
= ~That particular skill, it's something I needed to survive during the old days. You wouldn't understand until you've spent a few years out there. I'd still resort to it if necessary, but it's not something I'm proud of knowing, trust me.~
== C0CR#DED IF ~OR(2) TriggerOverride(Player1,HaveSpellRES("C0AS#P1")) TriggerOverride(Player1,HaveSpellRES("SPCL423"))~ THEN ~Besides... I'm sure you know how to concoct a lethal poison even without any more tips. Only Urogalan knows how you've managed to weasel so much knowledge out of me over the years. Plenty of drinks would probably have done it.~
EXTERN C0CR#DED C0CandleReDederStart.3

CHAIN C0CR#DED C0CandleReDederStart.3
~I know you're a clever sort, <CHARNAME>, just like Imoen. Hells, if you weren't, I wouldn't have taught everything about the rogue's trade to the both of you. Still, I feel like I should warn you anyway. People outside of Candlekeep aren't as kind as they are here.~
= ~You'll meet all sorts. Some are good, some bad and you just won't know it right away. Keep your guard up and never be afraid to play dirty, and if you're selling to a Sembian, don't ever trust them to count their coins honestly.~
EXTERN C0CR#DED C0CandleReDederStart.4

CHAIN C0CR#DED C0CandleReDederStart.4
~Anyways, I think I should slip back to my post while I still have time. Arkanis isn't going to like it if I leave him waiting, and much as I respect Gorion, I know he doesn't approve of every trick I've taught you, so it's best if he doesn't see us together...~
= ~Damn, too late.~
	DO ~SetGlobal("C0CandleReDederStart","GLOBAL",2)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("C0CR#013")~ EXIT

CHAIN C0CR#DED C0CandleReGorionThief
~Gorion... greetings, sir.~
== C0CR#GOR ~Master Deder. I would ask what it is you and <CHARNAME> have been exchanging here, but I think I would prefer not to know.~
== C0CR#DED ~Sir, I just...~
== C0CR#GOR ~No, do not explain. I know some things of your past, and it is for that reason I would have preferred it had you not taught <CHARNAME> your ways, but I also understand your friendship with <PRO_HIMHER> is deep enough that you value <PRO_HISHER> safety.~
== C0CR#GOR ~I can appreciate your efforts in ensuring he is prepared for the journey ahead, regardless of your methods.~
== C0CR#DED ~Thank you, sir. <CHARNAME>... after thinking about it more, I think you should take these as well.~
DO ~GiveItemCreate("potn10",Player1,2,0,0)~
== C0CR#DED ~If Gorion is vouching for me like this, your path must be even more dangerous than I thought. These will keep you safe, at least for a time, so use them wisely. If there's anything else...~
== C0CR#GOR ~That will do, Deder. You have our gratitude.~
== C0CR#GOR ~As for you, child, you should meet the rest of your friends in the short time we have left. Most, I would imagine, are just as eager to see you one last time.~
EXTERN C0CR#GOR C0CandleReGorionEnd

// Ranger
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionErikBegin","GLOBAL",0)~ THEN C0CR#ERI C0CandleReErikRanger
~Alright, <CHARNAME>, I think we've gone through every old lesson I know. Remember, young one, the duties of a ranger isn't only to nature, but to people. Don't forget to lend a helping hand to anyone in need out there.~
DO ~SetGlobal("C0CandleReGorionErikBegin","GLOBAL",1)~
== C0CR#ERI ~More to the point... wee'll miss you, <PRO_GIRLBOY>. I've been here ever since my retirement, and the new faces that are here to stay could be counted on one hand. I'll be waiting on the day you come back, as will Lily here. Isn't that right, girl?~
== C0CR#DOG ~Woof!~
== C0CR#ERI ~See that, <CHARNAME>? Old girl here, she's about as close to you as she is with me at this point. Go on, give her a pat on the head before you go.~
END
  ++ ~I've always wondered, Erik, why did a ranger like you choose Candlekeep as a place to retire?~ + C0CandleReErikRanger.1
  ++ ~Goodbye, Lily.~ + C0CandleReErikRanger.4
  ++ ~I'll be going now, old man.~ + C0CandleReErikRanger.4

CHAIN C0CR#ERI C0CandleReErikRanger.1
~Heh... it ain't as exciting a story as you might hope for, <CHARNAME>. I spent years as a scout in the army until my eyesight started failing, and after I was honorably discharged, I made a living by escorting caravans across the Sword Coast.~
= ~Then, one day, I was hired to escort some scribes to here, and the First Reader figured the place needed someone with my skills. I figured this was a good enough place to spend my remaining years, so I accepted.~
= ~Not to say I haven't had my share of adventures that are worth telling stories about, but I'll save those for when you come back so I won't be the only one talking. We'll spend some time at Winthrop's with a few tankards of ale, how's that sound to you?~
END
  ++ ~I'm not sure if I will come back...~ EXTERN C0CR#ERI C0CandleReErikRanger.2
  ++ ~Alright. Just make sure you don't keel over during that time.~ EXTERN C0CR#ERI C0CandleReErikRanger.3

CHAIN C0CR#ERI C0CandleReErikRanger.2
~You will, I'm sure of it. You're a more talented ranger than I was at your age, and you've got Gorion with you.~
END
IF ~True()~ EXTERN C0CR#ERI C0CandleReErikRanger.6
IF ~CheckStatGT(Player1,0,PROFICIENCYCROSSBOW)~ DO ~GiveItemCreate("XBOW04",Player1,1,0,0) GiveItemCreate("BOLT01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYLONGBOW)~ DO ~GiveItemCreate("BOW03",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSHORTBOW)~ DO ~GiveItemCreate("BOW05",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYDART)~ DO ~GiveItemCreate("DART01",Player1,60,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSLING)~ DO ~GiveItemCreate("SLNG01",Player1,1,0,0) GiveItemCreate("BULL01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5

CHAIN C0CR#ERI C0CandleReErikRanger.3
~Hah! That sharp tongue of yours... fear not, dear <PRO_GIRLBOY>. A tough old man like me isn't meeting my ancestors that quickly.~
END
IF ~True()~ EXTERN C0CR#ERI C0CandleReErikRanger.6
IF ~CheckStatGT(Player1,0,PROFICIENCYCROSSBOW)~ DO ~GiveItemCreate("XBOW04",Player1,1,0,0) GiveItemCreate("BOLT01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYLONGBOW)~ DO ~GiveItemCreate("BOW03",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSHORTBOW)~ DO ~GiveItemCreate("BOW05",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYDART)~ DO ~GiveItemCreate("DART01",Player1,60,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSLING)~ DO ~GiveItemCreate("SLNG01",Player1,1,0,0) GiveItemCreate("BULL01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5

CHAIN C0CR#ERI C0CandleReErikRanger.4
~Right, I know you're probably eager to head off at this point. I don't blame you, <CHARNAME>. There's not much of a life for a ranger in here, safe as it may be.~
END
IF ~True()~ EXTERN C0CR#ERI C0CandleReErikRanger.6
IF ~CheckStatGT(Player1,0,PROFICIENCYCROSSBOW)~ DO ~GiveItemCreate("XBOW04",Player1,1,0,0) GiveItemCreate("BOLT01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYLONGBOW)~ DO ~GiveItemCreate("BOW03",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSHORTBOW)~ DO ~GiveItemCreate("BOW05",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYDART)~ DO ~GiveItemCreate("DART01",Player1,60,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSLING)~ DO ~GiveItemCreate("SLNG01",Player1,1,0,0) GiveItemCreate("BULL01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5

CHAIN C0CR#ERI C0CandleReErikRanger.5
~Here, <CHARNAME>. Take these before you head off. I fletched them myself last night. Don't worry, I know what sort of weapon you're comfortable with. It's not much, but you won't have to buy it yourself at least.~
EXTERN C0CR#ERI C0CandleReErikRanger.6

CHAIN C0CR#ERI C0CandleReErikRanger.6
~You'd better get going, <CHARNAME>. Gorion's waiting for you... ah, or he's searching around for you already. Look over there.~
	DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("C0CR#011")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("JonHit","GLOBAL",1)
Global("C0CandleReGorionErikBegin","GLOBAL",1)~ THEN ERIK C0CandleReErikNew
~Nice one, kid, you caught on fast. Guess even I can't catch you off guard anymore. You should go talk to the Gatewarden if you want some experience in fighting with a group of people. You can find him just south of here. Out there it can be pretty important to know how to fight with allies at your side.~
DO ~SetGlobal("C0CandleReGorionErikBegin","GLOBAL",2)~ COPY_TRANS ERIK 0

CHAIN C0CR#ERI C0CandleReGorionRanger
~Master Gorion! I had just finished helping <CHARNAME> do a quick runthrough of the ranging skills <PRO_HESHE>'s learned. I can leave <PRO_HIMHER> to you, if that is what you need.~
== C0CR#GOR ~I am truly grateful, Erik, but you are welcome to stay if you prefer. I know your fondness of <CHARNAME>, as your only pupil, rivals my own.~
== C0CR#ERI ~You flatter me, sir. I would not presume to call <PRO_HIMHER> like a <PRO_SONDAUGHTER> to me given who I'm speaking to, but I do value <PRO_HIMHER> greatly. And it is because of that I have to ask, if it is truly necessary that <PRO_HESHE> leaves us?~
== C0CR#GOR ~It is. I am sorry I cannot explain my reasons, but you must trust in my word.~
== C0CR#ERI ~Beg pardon. I do, of course. There's not a soul in Candlekeep with any wisdom who'd doubt you. It's just... hard to accept.~
== C0CR#GOR ~I would gather that there are many who feel the same. You should meet them, <CHARNAME>, while you still have a chance, and say your farewells. We have some time, but not much.~
EXTERN C0CR#GOR C0CandleReGorionEnd

// Druid
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionDruid
~The kine appear to be soothed by your presence. They, and all the animals of the keep, owe much to your presence.~
= ~How you felt drawn to the ways of nature's servant, even in these walls, I doubt I will ever truly understand... though perhaps it is for the best. You walk the path well.~
END
  ++ ~I suppose it was always meant to be.~ EXTERN C0CR#GOR C0CandleReGorionDruid.1
  ++ ~How I was raised doesn't matter. Nature knows her children best.~ EXTERN C0CR#GOR C0CandleReGorionDruid.2
  ++ ~Are you here to take me away, father?~ EXTERN C0CR#GOR C0CandleReGorionDruid.3

CHAIN C0CR#GOR C0CandleReGorionDruid.1
~Aye, that may be... fate is unescapable, in some ways, though we can alter the path.~
EXTERN C0CR#GOR C0CandleReGorionDruid.3

CHAIN C0CR#GOR C0CandleReGorionDruid.2
~Hoh. When you state it as such, I cannot help but feel a touch of envy. Has my hand in nurturing you not played any part in your current person? No, I jest, my child. No matter what led you to this path, my pride in you is unchanged.~
EXTERN C0CR#GOR C0CandleReGorionDruid.3

CHAIN C0CR#GOR C0CandleReGorionDruid.3
~Your devotion to nature reminds me of a friend I know, my child. You will meet her before long, I am sure. She once left something in my possession, hoping it would allow me to understand her calling to an extent.~
= ~There is not much power left within it, but I will give what is left to you. The beasts of the wild can be dangerous, but they can also be an indispensable ally. I have understood that much.~
DO ~GiveItemCreate("ring03",Player1,5,0,0)
ActionOverride(Player1,SetItemFlags("ring03",IDENTIFIED,TRUE))~
= ~I fear that devotion will be tested soon, <CHARNAME>. Our journey ahead of us awaits, and you will see the Sword Coast in all its untamed entirety.~
= ~I am certain you will be relieved to finally escape the confinements of the castle, but do not be unattentive of the dangers that await. We have some time left to us, and you should use it to properly greet your friends.~
EXTERN C0CR#GOR C0CandleReGorionEnd

// Monk
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionMonk
~I hope I have not disrupted your meditations. Your training is one of both martial and spiritual focus, I understand.~
= ~In truth, I was originally opposed to you practicing the old scriptures of the ascetic's ways when you discovered them in the library's deepest sections, but as I can see now, the effect it has had on your discipline and bodily prowess has been an exceptional one.~
END
  ++ ~Have you met others with similar training, father? I thought there were few within the Sword Coast.~ EXTERN C0CR#GOR C0CandleReGorionMonk.1
  ++ ~I think you could do well if you practiced the same techniques with me.~ EXTERN C0CR#GOR C0CandleReGorionMonk.2
  ++ ~Is it time to leave?~ EXTERN C0CR#GOR C0CandleReGorionMonk.4

CHAIN C0CR#GOR C0CandleReGorionMonk.1
~In the Sword Coast, few indeed, but farther south, closer to Amn... in my younger years, I once spent time learning from the monks of a certain monastery in the Calim desert, and so I understand some more than the others here.~
EXTERN C0CR#GOR C0CandleReGorionMonk.3

CHAIN C0CR#GOR C0CandleReGorionMonk.2
~Oh, I am far too old to attempt such pursuits. Perhaps, were I even twenty years younger, I would not be opposed to at least learning the theory of such ascetic ways, considering what I have seen of others of your trade...~
EXTERN C0CR#GOR C0CandleReGorionMonk.3

CHAIN C0CR#GOR C0CandleReGorionMonk.3
~There was one man in particular whose skill was exceptional, as though he had transcended the limits of the mortal body. Sometimes, when I look upon you, I wonder if you will achieve the same. Regardless...~
EXTERN C0CR#GOR C0CandleReGorionMonk.4

CHAIN C0CR#GOR C0CandleReGorionMonk.4
~I hope your training has honed your mind and body well, my child, for the chaotic journey we have ahead of us will sorely test both. There will be little peace in our future.~
= ~In what time you have left, you should take one last walk around the castle and reflect upon your teachings, greet your friends, and say your farewells.~
EXTERN C0CR#GOR C0CandleReGorionEnd

// Shaman
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionShaman
~The Watchers were unaware of where you were, but I knew before long to find you here, away from others.~
= ~I do not intend to criticise your path, <CHARNAME>, but it often concerns me to know you spend this much time alone, and how it has affected your peers' impressions of you.~
END
  ++ ~I am never alone, father. The spirits follow me wherever I go.~ EXTERN C0CR#GOR C0CandleReGorionShaman.1
  ++ ~They do not understand. They cannot hear nor see what I can.~ EXTERN C0CR#GOR C0CandleReGorionShaman.1
  ++ ~What brings you to me, father?~ EXTERN C0CR#GOR C0CandleReGorionShaman.2

CHAIN C0CR#GOR C0CandleReGorionShaman.1
~I understand, <CHARNAME>, or... well, I do not doubt your conviction. But as your guardian, I still hope you may find common ground with the mortal, as you do with the realm of spirits.~
EXTERN C0CR#GOR C0CandleReGorionShaman.2

CHAIN C0CR#GOR C0CandleReGorionShaman.2
~We are soon to leave Candlekeep. I know you will not be afraid, not so long as you have the companionship of the spirits, but regardless, I hope you would at least say farewell to your friends here in the castle.~
EXTERN C0CR#GOR C0CandleReGorionEnd

// Blackguard
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionBlackguard
~In truth, I truly did hope I would not find you here. I have never wished to believe the Watchers' rumors that you hear echoes of dark voices, but your actions often give them more cause to believe such things.~
END
  ++ ~Let them believe what they may. I do not care.~ EXTERN C0CR#GOR C0CandleReGorionBlackguard.1
  ++ ~The fools know nothing. I will be glad to be away from them.~ EXTERN C0CR#GOR C0CandleReGorionBlackguard.1
  ++ ~Are we to leave now, father?~ EXTERN C0CR#GOR C0CandleReGorionBlackguard.2

CHAIN C0CR#GOR C0CandleReGorionBlackguard.1
~*sigh* We will have to address this side of you one day or another... though it is of little true concern right now, I fear what it may lead to in the coming days.~
EXTERN C0CR#GOR C0CandleReGorionBlackguard.2

CHAIN C0CR#GOR C0CandleReGorionBlackguard.2
~We will depart soon. I hope you will take the time to greet the others in Candlekeep, and leave them a fond impression of you before you leave. There have been many misunderstandings in the past years, but their concern for you is true, my child, I promise you.~
EXTERN C0CR#GOR C0CandleReGorionEnd

// Final Scene
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Detect(Player1) Global("C0CandleReGorionFinal","GLOBAL",0)~ THEN GORION C0CandleReGorionFinal
~There you are, my child. I trust you've prepared everything. We must be away soon, before time runs out.~
DO ~SetGlobal("C0CandleReGorionFinal","GLOBAL",1)~
END
  + ~OR(2) Dead("SHANK") Dead("CARBOS")~ + ~Father, I was attacked by a stranger! Right here, in this castle!~ EXTERN GORION C0CandleReGorionFinal.1
  ++ ~I've been considering things. Must we really go? There must be much more danger out there than in here.~ EXTERN GORION C0CandleReGorionFinal.2
  ++ ~I'm ready, father. We can leave at any time.~ EXTERN GORION C0CandleReGorionFinal.6

CHAIN GORION C0CandleReGorionFinal.1
~I know. I have already heard from the Watchers, and they will investigate the origins of the assassins. I am sorry, child. This is like nothing you have known, and I understand, truly. But this will not be the last, and it has proven even the security of Candlekeep is no longer an assuredly safe haven.~
EXTERN GORION C0CandleReGorionFinal.3

CHAIN GORION C0CandleReGorionFinal.2
~You are not wrong, child. For now. There is indeed great dangers in the world, some as close as outside the gates themselves. But that will not last, and sooner or later, Candlekeep will be swept in the chaos that already plagues the Sword Coast. I wish to spare the people here of that, as much as I can. It is my responsibility.~
EXTERN GORION C0CandleReGorionFinal.3

CHAIN GORION C0CandleReGorionFinal.3
~I promise you, where we go will be a safer place than even here, and you will find it in yourself to grow and learn from the experiences ahead.~
= ~I know you, my dear <CHARNAME>. You have talent, and are fated for greater things than here. But first, I must ensure your safety, and we will not find that in Candlekeep forever.~
END
  ++ ~Where will we go?~ EXTERN GORION C0CandleReGorionFinal.4
  ++ ~You sound afraid, father. I've never heard you like this before.~ EXTERN GORION C0CandleReGorionFinal.5
  ++ ~Then let us go. I'm eager to see the world outside as well.~ EXTERN GORION C0CandleReGorionFinal.6

CHAIN GORION C0CandleReGorionFinal.4
~I cannot tell you yet, child. I wish to trust in the people here, but for absolute certainty, the fewer there are who know of our destination, the safer we will be. It will all make sense soon, once we are in a place where I might explain everything.~
EXTERN GORION C0CandleReGorionFinal.7

CHAIN GORION C0CandleReGorionFinal.5
~You must understand, child, that there is always the unknown, that which is worthy of fear, no matter the extent of your power or knowledge. For us, and for those who would wish us harm. So long as we are mortal, we cannot avoid fear. But we must face it, and do what is needed to overcome it.~
EXTERN GORION C0CandleReGorionFinal.7

CHAIN GORION C0CandleReGorionFinal.6
~Very good, child. Come, then. We must head to the gates...~
DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#014")~ EXIT
	
CHAIN GORION C0CandleReGorionFinal.7
~Now, come with me. We will have time to talk later, but for now, we must go to the gates...~
DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#014")~ EXIT
	
CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionFinal","GLOBAL",1)~ THEN C0CR#ULR C0CandleReGorionFinalUlraunt
~Gorion.~
== GORION ~...Ulraunt.~
== C0CR#ULR ~I see you are here with the... young <CHARNAME>. I take it that means you intend to leave soon, as you've so stubbornly insisted?~
== GORION ~Indeed. We will be on our way soon.~
== C0CR#ULR ~Well, I would wish you safe journey, but I doubt that will be the case, given what I know of your intentions. Perhaps you have reconsidered since our last discussion?~
== GORION ~No.~
== C0CR#ULR ~Foolish... I have said it before, Gorion. There is a much simpler solution to this inanity. You and I know this to be true.~
== GORION ~We do not see eye to eye on this, Ulraunt, nor have we ever in many things. I am not blind to the dangers that stand ahead of <PRO_HIMHER>... us, but this is the right path to take, and thus it is my duty to do so.~
== C0CR#ULR ~I would have thought age and comfort would have ridded you of your urge for meddling in affairs that are beyond you. You have chosen peace for all these years, and you will throw it all away for your sentimentality?~
== GORION ~If you insist upon seeing things through that perspective, Ulraunt, then yes. That is how it is.~
== C0CR#ULR ~Bah!~
== C0CR#ULR ~Fine. On your own head be it, foolish Harper.~
== GORION ~Good <DAYNIGHT>, Ulraunt.~
== C0CR#ULR ~If you are set in your absurd ways, then I shall not expect either of your returns with optimism. But I will repeat my generous advice—you would do best to leave <PRO_HIMHER> in some forgotten ravine and be done with it.~
== C0CR#ULR ~Now then, you two have a long journey to take, and I have proper business to attend to. Out of my way.~
DO ~SetGlobal("C0CandleReGorionFinal","GLOBAL",2)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#015")~ EXIT
	
CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionFinal","GLOBAL",2)~ THEN GORION C0CandleReGorionFinalPostUlraunt
~*sigh* Do not dwell on his words, child. You are not the one at fault.~
DO ~SetGlobal("C0CandleReGorionFinal","GLOBAL",3)~
END
  ++ ~Why does Ulraunt hate me so much? I have never done anything to deserve it.~ + C0CandleReGorionFinalPostUlraunt.1
  ++ ~Father, I am asking your permission to go inside and kick him between his legs.~ + C0CandleReGorionFinalPostUlraunt.2
  ++ ~Can we go now, father?~ + C0CandleReGorionFinalPostUlraunt.3

CHAIN GORION C0CandleReGorionFinalPostUlraunt.1
~No. No, you have not, child. Someday, you will understand... the world is full of those who would rather blame you for the fault of others.~
EXTERN GORION C0CandleReGorionFinalPostUlraunt.4

CHAIN GORION C0CandleReGorionFinalPostUlraunt.2
~Now, now, as your senior I cannot allow that, though I do sympathize, child, truly. We must keep the venerable Keeper's health in consideration. He is getting on in years, after all.~
EXTERN GORION C0CandleReGorionFinalPostUlraunt.4

CHAIN GORION C0CandleReGorionFinalPostUlraunt.3
~Yes, we should. The sooner the better. Once you are prepared, we must leave with haste.~
EXTERN GORION C0CandleReGorionFinalPostUlraunt.4

CHAIN GORION C0CandleReGorionFinalPostUlraunt.4
~I know this is of little consolation to you, child, but Ulraunt's thoughts on you are not born from malice, not truly. Do not judge him too harshly.~
= ~Though the Keeper has his shortcomings, his concern is for the security of Candlekeep, so I hope that you may understand, though I know it may be difficult. You are not aware, but there are dark times approaching, and it is in such times that we all struggle the most with our worst sides.~
= ~Forgive me, child. It was indeed my intention to leave promptly, but encountering Ulraunt has reminded me of a most daunting fact... though we must leave this place for your own good, our eventual homecoming may not be so simple or guaranteed. If there is anything you feel is left undone, whether it be a simple farewell, it is best if you attend to it now. But you must hurry, and return as soon are you are done.~
EXTERN GORION 0	