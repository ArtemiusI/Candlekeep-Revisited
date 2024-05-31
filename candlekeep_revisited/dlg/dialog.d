BEGIN C0CR#ARK
BEGIN C0CR#CAN
BEGIN C0CR#DED
BEGIN C0CR#MOR
BEGIN C0CR#OSP

// Arkanis
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#ARK C0CandleReArkanis
~<CHARNAME>! It's good to see you, my <PRO_GIRLBOY>. The two of us were worried you'd left with Gorion before we had a chance to see you off.~
= ~It's going to be sad to watch you go, after seeing you grow up in these walls, but we know you'll be fine. And don't worry, the keep'll still be standing once you come back. All of us—Hull, Deder, and the lot—we'll make sure of it.~
END
  + ~Global("C0CandleReArkanisQuest","GLOBAL",0)~ + ~I'm helping out around the place one more time before I go. Do you need anything?~ + C0CandleReArkanis.1
  ++ ~Thank you. See you, Arkanis, Deder.~ EXIT

CHAIN C0CR#ARK C0CandleReArkanis.1
~Anything I need, eh? Well... let me think...~
== C0CR#ARK ~Well, Deder and I get awfully bored standing guard all day with nothing to do. We like to read to pass the time, but the castle doors are locked right now, so... could you go over to Winthrop's and ask to borrow a couple of books? We're on duty right now, so we can't go wandering off.~
== IMOEN2 IF ~IsValidForPartyDialog("IMOEN")~ ~You like to read, Arkanis? How come I've never heard you said anything about that before?~
== C0CR#ARK IF ~IsValidForPartyDialog("IMOEN")~ ~Well... I'm nowhere near as good at it as you, Imoen. But I've been in Candlekeep for a while, so I can't help but take an interest in books after all the years. Makes it worth leaving my clanhold for, having learned so many new things.~
== C0CR#DED ~Whatever you can get us is fine. Make sure they've got lots of pages, though. We'll need them for a while.~
DO ~SetGlobal("C0CandleReArkanisQuest","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#ARK C0CandleReArkanis.2
~Hello again, <CHARNAME>.~
END
  + ~Global("C0CandleReArkanisQuest","GLOBAL",0)~ + ~I'm helping out around the place one more time before I go. Do you need anything?~ + C0CandleReArkanis.1
  + ~Global("C0CandleReArkanisQuest","GLOBAL",1)
	 PartyHasItem("BOOK18")
     PartyHasItem("BOOK35")~ + ~I've got the books you asked for.~ + C0CandleReArkanis.3
  ++ ~As you were, Arkanis.~ EXIT

CHAIN IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
IsGabber(Player1)
Global("C0CandleReArkanisQuest","GLOBAL",2)~ THEN C0CR#ARK C0CandleReArkanis.4
~Hello again, <CHARNAME>. Thanks again for the books, by the way.~
EXIT

CHAIN C0CR#ARK C0CandleReArkanis.3
~Thank you, my <PRO_GIRLBOY>. We'll have much less trouble standing guard with these.~
== C0CR#ARK ~History of Sembia, eh? Isn't that where you're from, Deder? I remember you saying something along those lines.~
== C0CR#DED ~That was a long time ago. I don't really have the best memories of those days... you can have that one, Arkanis.~
== C0CR#ARK ~I see. Well, I'd still like to read yours after I'm done with mine. I'm sorry to trouble you for the legwork, <CHARNAME>. Here, take these arrows with you. It's a dangerous world beyond these walls... keep your eyes out for trouble in the distance and bring it down before it gets close to you, and I'm sure you'll do fine.~
DO ~AddexperienceParty(100) GiveItemCreate("arow02",Player1,15,0,0) SetGlobal("C0CandleReArkanisQuest","GLOBAL",2)~ EXIT

CHAIN IF WEIGHT #-1 ~IsGabber("IMOEN")~ THEN C0CR#ARK C0CandleReArkanisImoen
~Good to see you, Imoen, my girl. Please stay out of trouble now... it's been a while since I've had to say anything to the watchers, and I hope it'll stay that way.~
== IMOEN2 ~No worries, pops. Thanks for keeping that... other... thing under wraps for me, by the way.~
EXIT

EXTEND_TOP INNKE2 6
+ ~Global("C0CandleReArkanisQuest","GLOBAL",1) OR(2) !PartyHasItem("BOOK18") !PartyHasItem("BOOK35")~ + ~Do you have any spare books you could lend, Winthrop? Arkanis and Deder were asking.~ EXTERN INNKE2 C0CandleReArkanisQuestWinthrop
+ ~Global("C0CandleReArkanisQuest","GLOBAL",1) OR(2) !PartyHasItem("BOOK18") !PartyHasItem("BOOK35")~ + ~Show me what you've got, Winthrop.~ DO ~StartStore("Inn2616",LastTalkedToBy(Myself))~ EXIT 
END

CHAIN INNKE2 C0CandleReArkanisQuestWinthrop
~Aye, there's some books in the guest room for those who are bored and lookin' for something to read. It's got nothin' on the great library, of course, but it's somethin'. They be on the shelf, go ahead and take them, child. They're mostly gatherin' dust these days.~
EXIT

// Canderous
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReCanderousQuest","GLOBAL",1) Global("C0CandleReCanderousHeal","GLOBAL",1)~ THEN C0CR#CAN C0CandleReCanderousHealing
~That should take care of your wounds. <CHARNAME>. But how could you be injured like this here in the keep? Did something happen?~
END
  ++ ~The worker attacked me! He was an assassin after my life.~ + C0CandleReCanderous.3
  ++ ~It's nothing. I had an accident, that is all.~ + C0CandleReCanderous.4

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#CAN C0CandleReCanderous
~Good <DAYNIGHTALL>, <CHARNAME>. I'm glad we got a chance to see each other before you leave. May Helm watch over you and Gorion on your journey.~
END
  + ~Global("C0CandleReCanderousQuest","GLOBAL",0)~ + ~You look as busy as ever, Canderous. Is there anything I can do to help you?~ + C0CandleReCanderous.1
  ++ ~Thank you. I'll be going now.~ EXIT

CHAIN C0CR#CAN C0CandleReCanderous.1
~I would hate to trouble you on the day of your departure, but there is something, in fact.~
== C0CR#CAN	~As you can see, the clinic is especially full of patients today. We've almost used up all of our bandages and medicines here. I was informed that we were to receive a new supply of stock this morning, but it has yet to arrive. I have asked the priests of Oghma, and they have told me that the worker in charge of delivery has been late to perform their duties.~
== IMOEN2 IF ~IsValidForPartyDialog("IMOEN")~ ~What? Don't look at me! I wouldn't steal stuff used for healing people, they're too important. That wouldn't be even slightly funny.~
== C0CR#CAN ~If you could go to the priests' quarters and inquire as to their status, I would be most grateful.~
DO ~SetGlobal("C0CandleReCanderousQuest","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#CAN C0CandleReCanderousAgain
~You have returned, <CHARNAME>. Forgive me, but there is much to be done right now, so I do not have time for longer conversation.~
END
  + ~Global("C0CandleReCanderousQuest","GLOBAL",1)
     PartyHasItem("C0CR#BAG")~ + ~I've found your medical supplies.~ + C0CandleReCanderous.2
  + ~Global("C0CandleReCanderousQuest","GLOBAL",0)~ + ~You look as busy as ever, Canderous. Is there anything I can do to help you?~ + C0CandleReCanderous.1
  ++ ~Then I should leave you to your work.~ EXIT

CHAIN C0CR#CAN C0CandleReCanderous.2
~Thank you, <CHARNAME>. These people should not suffer their ailments and injuries any longer than they must.~
END
IF ~HPPercentLT(Player1,100)~ EXTERN C0CR#CAN C0CandleReCanderous.injured
IF ~!HPPercentLT(Player1,100)~ EXTERN C0CR#CAN C0CandleReCanderous.notinjured

CHAIN C0CR#CAN C0CandleReCanderous.injured
~Wait... you are injured, <CHARNAME>! Please hold still. I will tend to your wounds.~
DO ~SetGlobal("C0CandleReCanderousHeal","GLOBAL",1)
		StartCutSceneMode()
		CutSceneId("CANDEROUS")
        Wait(1)
        ForceSpell(Player1,CLERIC_CURE_LIGHT_WOUNDS)
        Wait(1)
        StartDialogueNoSet(Player1)~ EXIT

CHAIN C0CR#CAN C0CandleReCanderous.notinjured
~I must go back to my patients, but... are you well, <CHARNAME>? You appear tense, somehow. Did something happen?~
END
  ++ ~The worker attacked me! He was an assassin after my life.~ + C0CandleReCanderous.3
  ++ ~It's nothing. Take care, Canderous.~ + C0CandleReCanderous.4
  
CHAIN C0CR#CAN C0CandleReCanderous.3
~An assassin? That cannot be... here within this place?~
== C0CR#CAN ~I see Gorion has good reason to take you away, if even the walls of Candlekeep can no longer keep you safe. With him, you will undoubtedly be shielded from danger.~
EXTERN C0CR#CAN C0CandleReCanderous.5

CHAIN C0CR#CAN C0CandleReCanderous.4
~Hmm... if you say so, <CHARNAME>. But remember, you are a ward of Candlekeep. For as long as you stay here, it is the duty of the people here to ensure your well-being.~
EXTERN C0CR#CAN C0CandleReCanderous.5

CHAIN C0CR#CAN C0CandleReCanderous.5
~There are many here who will miss your presence, <CHARNAME>, myself included. I hope you may never forget that you have a home to return to, and friends to welcome you.~
= ~Safe journey, <CHARNAME>.~
DO ~SetGlobal("C0CandleRECanderousQuest","GLOBAL",2)~ EXIT

CHAIN IF WEIGHT #-1 ~True()~ THEN C0CR#CAN C0CandleReCanderousNotPC
~Good <DAYNIGHTALL> to you, <GABBER>.~
EXIT

// Deder
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~True()~ THEN C0CR#DED C0CandleReDeder
~Hey there, <GABBER>.~
EXIT

// Mordaine
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#MOR C0CandleReMordaine
~Oh, it's you, <CHARNAME>.~
== IMOEN2 IF ~IsValidForPartyDialog("IMOEN")~ ~Hey, it's Ms. Nose-in-the-books-all-day. With—surprise, surprise—her nose in another book.~
== C0CR#MOR ~Still around? I thought you'd have been gone from here by now.~
END
  ++ ~Hello, Mordaine.~ + C0CandleReMordaine.1
  ++ ~Still heavy on the books, I see.~ + C0CandleReMordaine.1
  ++ ~Just saying my farewells.~ + C0CandleReMordaine.1

CHAIN C0CR#MOR C0CandleReMordaine.1
~I beg your pardon for not sounding more agitated. I've been up all night reading, as you might expect, so my focus is a little... *yaaaawn*... actually, yesterday I found a certain reading particularly fascinating, I'd have recommended it to you had you the time to spare.~
= ~*sigh* To be quite blunt, I envy you a little, you know. I know your journey isn't for leisure, but there's a wealth of knowledge out there for the gathering. Who knows when it'll be my time to go out and see it.~
= ~Well, in any case, this is farewell for now. I suspect, however, that we'll meet again sooner than either of us expect.~
END
  + ~Global("C0CandleReMordaineQuest","GLOBAL",0)~ + ~Is there anything I can do for you before I go?~ DO ~SetGlobal("C0CandleReMordaineQuest","GLOBAL",1)~ + C0CandleReMordaine.2
  ++ ~I hope that's the case.~ EXIT
  ++ ~Goodbye.~ EXIT
  
CHAIN C0CR#MOR C0CandleReMordaine.2
~Actually, there is one thing. I hate to ask this of you, and it's certainly not an urgent matter, but should you have a chance... could you deliver this letter to the clinic for me?~
= ~Just hand it over to the reader that does chores there. Young man, short, yellow robes... probably soaked with dishwater. Thanks in advance.~
DO ~GiveItemCreate("C0CR#LET",Player1,1,0,0)~ EXIT

CHAIN IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#MOR C0CandleReMordaine
~Hello again, <CHARNAME>. You'd better get going. Gorion won't be happy with you if you're any more late.~
END
  + ~Global("C0CandleReMordaineQuest","GLOBAL",0)~ + ~Is there anything I can do for you before I go?~ DO ~SetGlobal("C0CandleReMordaineQuest","GLOBAL",1)~ + C0CandleReMordaine.2
  + ~Global("C0CandleReMordaineQuest","GLOBAL",2)~ + ~I delivered your letter.~ DO ~SetGlobal("C0CandleReMordaineQuest","GLOBAL",3)~ + C0CandleReMordaineQuestComplete
  ++ ~You're right. See you, Mordaine.~ EXIT

CHAIN C0CR#MOR C0CandleReMordaineQuestComplete
~You did? Great. I'll just wait for the silly boy to reach out to me again.~
END
  ++ ~Did you really need me to deliver your love letter for you?~ + C0CandleReMordaineQuestComplete.1
  ++ ~I hope that love letter helps you two get together.~ + C0CandleReMordaineQuestComplete.1
  ++ ~What exactly was in that letter?~ + C0CandleReMordaineQuestComplete.2
  
CHAIN C0CR#MOR C0CandleReMordaineQuestComplete.1
~Love letter? What are you talking about?~
== IMOEN2 IF ~IsValidForPartyDialog("IMOEN")~ ~Oh, c'mon, you don't need to deny it. I promise we won't spill your secret... on purpose, heh.~
== C0CR#MOR IF ~IsValidForPartyDialog("IMOEN")~ ~What's gotten into you two? You're both saying such strange things.~
EXTERN C0CR#MOR C0CandleReMordaineQuestComplete.2

CHAIN C0CR#MOR C0CandleReMordaineQuestComplete.2
~I asked that reader to bring me some of the potions I asked for during the last delivery to the castle. Things to bolster memory, keep fatigue at bay, you get the idea. He gave me the wrong ones, and it's all sorts of nonsense that I've no use for.~
= ~I told him, he'd better find where my order went and get it to me, or else I'll make sure he'll still be washing dishes in his current position for the next decade. I paid a good bit of gold for those potions!~
= ~You know what, <CHARNAME>? Here, take this with you. I couldn't find the intended owner for this bottle, and I can't use it myself. It's a very strange concoction... but I don't think it's dangerous. Maybe it'll do you some good out there.~
DO ~AddexperienceParty(100) GiveItemCreate("potn36",Player1,1,0,0)~ EXIT

CHAIN IF WEIGHT #-1 ~IsGabber("IMOEN")~ THEN C0CR#MOR C0CandleReMordaineImoen
~Imoen? Get you gone, child. I've got all these books to read, I don't need to spend attention watching my purse too with you around.~
== IMOEN2 ~Well, that's rude! I wasn't gonna try anything before, but you'd better watch out now!~
EXIT

EXTEND_TOP READ2 0
+ ~Global("C0CandleReMordaineQuest","GLOBAL",1) PartyHasItem("C0CR#LET")~ + ~I have a letter from Mordaine for you.~ EXTERN READ2 C0CandleReMordaineQuestReader
END

CHAIN READ2 C0CandleReMordaineQuestReader
~From Mordaine? To me? Okay, let me have a look...~
DO ~TakePartyItem("C0CR#LET") DestroyItem("C0CR#LET")~
= ~Oh. Oh... um, well... right, er... thanks for delivering it. I've got to get things ready, quickly...~
DO ~SetGlobal("C0CandleReMordaineQuest","GLOBAL",2)~ EXIT

// Osprey
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#OSP C0CandleReOsprey
~<CHARNAME>! Good <DAYNIGHTALL>. May your day be blessed with knowledge and wisdom.~
== C0CR#OSP ~As you see, I have been making my daily preyer to lord Deneir. Perhaps I should pray for you, as well, for you are soon to embark upon a long journey.~
END
  + ~!ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)~ + ~Thank you, Osprey.~ + C0CandleReOsprey.highroll
  + ~ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)~ + ~Thank you, Osprey.~ + C0CandleReOsprey.lowroll
  ++ ~I doubt prayers will suffice for what's ahead.~ + C0CandleReOsprey.rude
  
CHAIN C0CR#OSP C0CandleReOsprey.rude
~Well, it is within your right to believe so, but the road will be dark and twisted without the guiding light of wisdom and the stones of knowledge to pave the way... ugh, perhaps that was just a little forced. I merely thought to provide a useful metaphor for you. In any case, I was hoping our parting would be somewhat friendlier, but have it your way. Have a pleasant journey, <CHARNAME>, I must return to my prayers.~
EXIT

CHAIN C0CR#OSP C0CandleReOsprey.highroll
~I do hope to see you returning from your journey with the glimmers of wisdom clearly visible within your eyes. Or, well, to see you return safely at all, my friend. We will all be eagerly awaiting the day of our reunion... oh, please do take this. I have found it most useful while meditating on my daily learnings, but I think it will be more useful in your hands, little as it is. Go with Deneir's blessing, <CHARNAME>.~
DO ~GiveItemCreate("C0CR#RIN",Player1,1,0,0)~ EXIT

CHAIN C0CR#OSP C0CandleReOsprey.lowroll
~I do hope to see you returning from your journey with the glimmers of wisdom clearly visible within your eyes. Or, well, to see you return safely at all, my friend. We will all be eagerly awaiting the day of our reunion. Go with Deneir's blessing, <CHARNAME>.~
EXIT

CHAIN IF WEIGHT #-1 ~IsGabber("IMOEN")~ THEN C0CR#OSP C0CandleReOspreyImoen
~Hello, Imoen! I'm glad to see you here to pay your respects to the gods of knowledge. Perhaps you have the time to pray with me for a while? It will only take an hour... perhaps two, if you're inclined...~
== IMOEN2 ~Er, listen, Osprey... thanks, but I'm busy right now. I've got, um... chores. Yeah, chores! Gotta get to them right now!~
EXIT

// Firebead
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

INTERJECT FIREB1 2 C0CandleReFirebead
== FIREB1 IF ~Class(Player1,MAGE_ALL)~ THEN ~From what I hear, you're also an aspiring arcanist. You almost remind me of myself as a fledging apprentice, such a nostalgic time... I feel as your senior in the practice of the Art, I should do more for you, especially as I hear you will be going on quite the journey.~
== FIREB1 ~Though I do not wish to overreach in your development as a mage, I can still give you a head start... here, I have an assortment of spell scrolls that may be useful to you. Pick one, any one. Will it be the scroll of Burning Hands, Friends, Spook, Protection from Evil, or Shield?~
END
  ++ ~I'll take the scroll of Burning Hands.~ DO ~GiveItemCreate("scrl68",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll
  ++ ~I'll take the scroll of Friends.~ DO ~GiveItemCreate("scrl72",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll
  ++ ~I'll take the scroll of Spook.~ DO ~GiveItemCreate("scrla6",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll
  ++ ~I'll take the scroll of Protection from Evil.~ DO ~GiveItemCreate("scrl78",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll
  ++ ~I'll take the scroll of Shield.~ DO ~GiveItemCreate("scrl79",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll

CHAIN FIREB1 C0CandleReFirebeadScroll
~Here you are, young one. This is but the beginning—the greater secrets of the Weave are out there. Me, I am far too old to be seeking them. But you have immeasurable potential. Good luck.~
COPY_TRANS FIREB1 2
