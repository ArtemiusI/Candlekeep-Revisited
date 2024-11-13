BEGIN C0CR#ARK
BEGIN C0CR#CAN
BEGIN C0CR#DED
BEGIN C0CR#DE3
BEGIN C0CR#MOR
BEGIN C0CR#OSP
BEGIN C0CR#GFM

// Arkanis
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#ARK C0CandleReArkanis
~<CHARNAME>! It's good to see you, my <PRO_GIRLBOY>. The two of us were worried you'd left with Gorion before we had a chance to see you off.~
= ~It's going to be sad to watch you go, after seeing you grow up in these walls, but we know you'll be fine. And don't worry, the keep'll still be standing once you come back. All of us—Hull, Deder, and the lot—we'll make sure of it.~
END
  + ~Global("C0CandleReArkanisQuest","GLOBAL",0)~ + ~I'm helping out around the place one more time before I go. Do you need anything?~ + C0CandleReArkanis.1
  ++ ~Thank you. See you, Arkanis, Deder.~ EXIT

CHAIN C0CR#ARK C0CandleReArkanis.1
~Anything I need, eh? Well... let me think...~
== C0CR#ARK ~Well, Deder and I get awfully bored standing guard all day with nothing to do. We like to read to pass the time, but the castle doors are locked right now, so... could you go over to Winthrop's and ask to borrow a couple of books? We're on duty right now, so we can't go wandering off.~
== IMOEN2 IF ~IsValidForPartyDialog("%bg1_imoen%")~ ~You like to read, Arkanis? How come I've never heard you said anything about that before?~
== C0CR#ARK IF ~IsValidForPartyDialog("%bg1_imoen%")~ ~Well... I'm nowhere near as good at it as you, Imoen. But I've been in Candlekeep for a while, so I can't help but take an interest in books after all the years. Makes it worth leaving my clanhold for, having learned so many new things.~
== C0CR#DED ~Whatever you can get us is fine. Make sure they've got lots of pages, though. We'll need them for a while.~
DO ~AddJournalEntry(%Quest3_Entry_1%,QUEST) SetGlobal("C0CandleReArkanisQuest","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#ARK C0CandleReArkanis.2
~Hello again, <CHARNAME>.~
END
  + ~Global("C0CandleReArkanisQuest","GLOBAL",0)~ + ~I'm helping out around the place one more time before I go. Do you need anything?~ + C0CandleReArkanis.1
  + ~Global("C0CandleReArkanisQuest","GLOBAL",1)
	 PartyHasItem("BOOK18")
     PartyHasItem("BOOK35")~ + ~I've got the books you asked for.~ + C0CandleReArkanis.3
  ++ ~As you were, Arkanis.~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)
Global("C0CandleReArkanisQuest","GLOBAL",2)~ THEN C0CR#ARK C0CandleReArkanis.4
~Hello again, <CHARNAME>. Thanks again for the books, by the way.~
EXIT

CHAIN C0CR#ARK C0CandleReArkanis.3
~Thank you, my <PRO_GIRLBOY>. We'll have much less trouble standing guard with these.~
DO ~TakePartyItem("BOOK18") TakePartyItem("BOOK35")~
== C0CR#ARK ~History of Sembia, eh? Isn't that where you're from, Deder? I remember you saying something along those lines.~
== C0CR#DED ~That was a long time ago. I don't really have the best memories of those days... you can have that one, Arkanis.~
== C0CR#ARK ~I see. Well, I'd still like to read yours after I'm done with mine. I'm sorry to trouble you for the legwork, <CHARNAME>. Here, take these arrows with you. It's a dangerous world beyond these walls... keep your eyes out for trouble in the distance and bring it down before it gets close to you, and I'm sure you'll do fine.~
DO ~AddJournalEntry(%Quest3_Entry_2%,QUEST_DONE) AddexperienceParty(100) GiveItemCreate("arow02",Player1,30,0,0) SetGlobal("C0CandleReArkanisQuest","GLOBAL",2)~ EXIT

CHAIN IF WEIGHT #-1 ~IsGabber("%bg1_imoen%")~ THEN C0CR#ARK C0CandleReArkanisImoen
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

// Arkanis - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)
GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#ARK C0CandleReArkanisC6
~<CHARNAME>, my <PRO_GIRLBOY>! I couldn't believe my ears when the other Watchers told me you'd found your way home. Let old Arkanis give you a tight hug and see how much you've grown, come here!~
END
  ++ ~Come now, Arkanis, you don't need to hold me to check my growth, it's clear as day. By the way, you don't usually stand guard around here. What's the occasion?~ + C0CandleReArkanisC6.1
  ++ ~Stop coddling me, Arkanis. I'm far from the child who first stepped out of the keep and don't need your attempts at fatherly affection.~ + C0CandleReArkanisC6.0

CHAIN C0CR#ARK C0CandleReArkanisC6.0
~I see the world outside has not only tempered but greatly hardened you, <CHARNAME>. So be it... you are, as you say, a child no longer and I should not treat you as such. Still, welcome back, <CHARNAME>. This old dwarf is still heartened by your return.~
EXIT
  
CHAIN C0CR#ARK C0CandleReArkanisC6.1
~Aye, well... this is a special day, <CHARNAME>, and your return is only one of the reasons why. We have had far more visitors than usual lately, many powerful and respected... though when facing those of the Iron Throne, I cannot help but stay on my guard.~
== C0CR#ARK ~Deder is more the expert when it comes to their history, but even I know of them by reputation. Untrustworthy lot, they are. Best you not get anywhere close to them, my <PRO_GIRLBOY>, and I mean this both for your safety and theirs. By Moradin, even talking to them briefly makes me want to bury an axe in their heads for their arrogance and flagrant disrespect shown to the humble folk of this place.~
== C0CR#ARK ~But come, we should not spoil this happy occasion by dwelling on such matters. You should go around and greet all your old friends. The news has spread, and I am certain they are all eager to see you.~
EXIT

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#ARK C0CandleReArkanisC6
~Keep your wits about you, my <PRO_GIRLBOY>, and don't hesitate to come running to me something concerns you. You may have grown much from traveling out there, but you'll always be a ward of Candlekeep.~
EXIT

INTERJECT ARKANI3 3 C0CandleReArkanisImoenTalk
== IMOEN2 IF ~IsValidForPartyDialog("%bg1_imoen%")~ THEN ~Wait! Arkanis, <CHARNAME>, please don't! <CHARNAME>, I think we can trust them. We need all the help we can get to make it through here... so let's work together, okay?~
END
 ++ ~Fine. If you think they can be trusted, Imoen... they can come with us.~ EXTERN IMOEN2 C0CandleReArkanisImoenTalk.1
 ++ ~I won't hurt them, but I can't trust them. Get out of my sight, the both of you!~ EXTERN ARKANI3 2
 ++ ~No, I won't risk any chance of a trap. They die!~ DO ~ActionOverride("DEDER",Enemy())
ActionOverride("ARKANIS",Enemy())~ EXIT
 
CHAIN IMOEN2 C0CandleReArkanisImoenTalk.1
~Thank you, <CHARNAME>. Arkanis, Deder... please help us get through here. We can trust you, right?~
EXTERN ARKANI3 1

INTERJECT ARKANI3 1 C0CandleReArkanisC6
== C0CR#DE3 ~We'd better move quickly, <CHARNAME>. There'll be more of these shapeshifting fiends ahead. Best watch for traps as well—who knows what's been done to this place.~
== ARKANI3 ~Aye... don't trust a word from anyone else we find here... I'll put my axe through their skulls first. Fear not, child... we'll see you through this.~
	DO ~SetGlobal("C0CandleReArkanisC6Join","GLOBAL",1)
		ActionOverride("deder",ChangeAIScript("C0CR#C6S",DEFAULT))
		ChangeAIScript("C0CR#C6S",DEFAULT)
		ActionOverride("deder",ChangeEnemyAlly(Myself,CONTROLLED))
		ActionOverride("deder",UseItem("potn41",Myself))
		ChangeEnemyAlly(Myself,CONTROLLED)
		UseItem("potn09",Myself)~ EXIT

I_C_T2 TETHTO3 0 C0CandleReArkanisC6Interject
== ARKANI3 IF ~InMyArea("ARKANIS")~ THEN ~Bah! Lies, <CHARNAME>, heed them not. The Watchers never heard anyone speak of such a thing!~
== TETHTO3 ~Calm yourself, Arkanis. There was reason to keep this secret from the Watchers, as well. Until we had full knowledge of the threat, some things had to be kept secret.~
END

I_C_T2 HULL3 0 C0CandleReArkanisC6Interject2
== ARKANI3 IF ~InMyArea("ARKANIS")~ THEN ~By Moradin's hammer! Young Hull, too? This is truly a waking nightmare...~
END

CHAIN IF WEIGHT #-1 ~Global("C0CandleReArkanisC6Join","GLOBAL",2)~ THEN ARKANI3 C0CandleReArkanisC6End
~This is as far as we can go, my <PRO_GIRLBOY>. The Watchers must know of what has transpired here... but the end of the path will not be too far ahead.~
== ARKANI3 ~It pains us that we cannot protect you any further, but you have grown much since you first left. Even though your journey will undoubtedly only become more difficult... I can see you won't need the two of us any longer.~
== C0CR#DE3 IF ~InMyArea("DEDER")~ THEN ~Don't worry, <CHARNAME>. We'll do everything we can to clear out these filth from Candlekeep's walls. You can rest assured of that.~
== ARKANI3 ~Aye... this is goodbye once more, but I know we will meet again, someday.~
END
  ++ ~Thank you, Arkanis, Deder. Take care of yourselves.~ EXTERN ARKANI3 C0CandleReArkanisC6End.1
  ++ ~Just get going, the both of you.~ EXTERN ARKANI3 C0CandleReArkanisC6End.1
  
CHAIN ARKANI3 C0CandleReArkanisC6End.1
~Go now, <PRO_GIRLBOY>... go, and live well.~
DO ~ActionOverride("deder",EscapeAreaObject("Door2615"))
EscapeAreaObject("Door2615")~ EXIT

CHAIN IF WEIGHT #-1 ~Dead("arkanis")
Global("C0CandleReArkanisC6Join","GLOBAL",2)~ THEN C0CR#DE3 C0CandleReArkanisC6End
~The path to the surface isn't far, <CHARNAME>. You'll be able to find your way out from here.~
== C0CR#DE3 ~I'm going to head back now. Someone'll need to report everything that's happened here. Sorry I can't help you more, but I know you'll be fine.~
== C0CR#DE3 ~Good luck, <CHARNAME>. Find the bastard who set this up and give him what he deserves... and come back alive.~
DO ~EscapeAreaObject("Door2615")~ EXIT
  
// Canderous
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReCanderousQuest","GLOBAL",1) Global("C0CandleReCanderousHeal","GLOBAL",1)~ THEN C0CR#CAN C0CandleReCanderousHealing
~That should take care of your wounds. <CHARNAME>. But how could you be injured like this here in the keep? Did something happen?~
END
  ++ ~The worker attacked me! He was an assassin after my life.~ + C0CandleReCanderous.3
  ++ ~It's nothing. I had an accident, that is all.~ + C0CandleReCanderous.4

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#CAN C0CandleReCanderous
~Good <DAYNIGHTALL>, <CHARNAME>. I'm glad we got a chance to see each other before you leave. May Helm watch over you and Gorion on your journey.~
END
  + ~Global("C0CandleReCanderousQuest","GLOBAL",0)~ + ~You look as busy as ever, Canderous. Is there anything I can do to help you?~ + C0CandleReCanderous.1
  ++ ~Thank you. I'll be going now.~ EXIT

CHAIN C0CR#CAN C0CandleReCanderous.1
~I would hate to trouble you on the day of your departure, but there is something, in fact.~
== C0CR#CAN	~As you can see, the clinic is especially full of patients today. We've almost used up all of our bandages and medicines here. I was informed that we were to receive a new supply of stock this morning, but it has yet to arrive. I have asked the priests of Oghma, and they have told me that the worker in charge of delivery has been late to perform their duties.~
== IMOEN2 IF ~IsValidForPartyDialog("%bg1_imoen%")~ ~What? Don't look at me! I wouldn't steal stuff used for healing people, they're too important. That wouldn't be even slightly funny.~
== C0CR#CAN ~If you could go to the priests' quarters and inquire as to their status, I would be most grateful.~
DO ~AddJournalEntry(%Quest2_Entry_1%,QUEST) SetGlobal("C0CandleReCanderousQuest","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#CAN C0CandleReCanderousAgain
~You have returned, <CHARNAME>. Forgive me, but there is much to be done right now, so I do not have time for longer conversation.~
END
  + ~Global("C0CandleReCanderousQuest","GLOBAL",1)
     PartyHasItem("C0CR#BAG")~ + ~I've found your medical supplies.~ DO ~TakePartyItem("C0CR#BAG") DestroyItem("C0CR#BAG")~ + C0CandleReCanderous.2
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
DO ~AddJournalEntry(%Quest2_Entry_2%,QUEST_DONE) AddexperienceParty(100) SetGlobal("C0CandleRECanderousQuest","GLOBAL",2)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)~ THEN C0CR#CAN C0CandleReCanderousNotPC
~Good <DAYNIGHTALL> to you, <GABBER>.~
EXIT

// Canderous - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)
GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#CAN C0CandleReCanderousC6
~<CHARNAME>! I heard from the Watchers that you had returned. It is so good to see you back, and in good health.~
END
IF ~IsValidForPartyDialog("AJANTIS")~ EXTERN AJANTJ C0CandleReCanderousC6Ajantis
IF ~!IsValidForPartyDialog("AJANTIS")~ EXTERN C0CR#CAN C0CandleReCanderousC6.1

CHAIN AJANTJ C0CandleReCanderousC6Ajantis
~Canderous? Canderous Leighsfeld?~
== C0CR#CAN ~Ajantis Ilvastarr? By Helm, it truly is you! How many years has it been?~
== AJANTJ ~Indeed, it has been a long time, old friend! We've not met for almost a decade. So this is where you have been serving all these years since you left Waterdeep.~
== C0CR#CAN ~Aye, Candlekeep is my home now. I see you have earned your place in the Order. Good for you, Ajantis...~
== AJANTJ ~What of you, Canderous? Do you not intend to return and complete your training? I see your wound has long healed... our seniors would undoubtedly be pleased to see your return.~
== C0CR#CAN ~No... perhaps if fate had been slightly different, we would have served as fellow squires, but I am content with my current place. This is far from Waterdeep, but I find the quiet of the library's halls a comforting haven from the battles that led to my injury, and even people in such a peaceful place always need healing.~
== AJANTJ ~I see. A worthy cause it is, and I am certain the monks of Candlekeep greatly value you for it. I respect your decision, my friend. Hopefully we may meet again in the future, outside of this castle.~
== C0CR#CAN ~That may be, my brother. I intend to return home to Waterdeep when I have a chance... perhaps then, once you have taken your oaths and become a knight proper, we can have a proper celebration.~
EXTERN C0CR#CAN C0CandleReCanderousC6.1

CHAIN C0CR#CAN C0CandleReCanderousC6.1
~Candlekeep doesn't look any different, <CHARNAME>, but I can tell things have changed in subtle ways. I've been trying to stay so vigilant I can barely get peaceful sleep... if you know anything of use, please let me know.~
END
++ ~I'll need to look around to know exactly what's going on, but I know the Iron Throne's behind a lot of the troubles in the region.~ + C0CandleReCanderousC6.2
++ ~Things are quite complicated around the Sword Coast, and I'm still in the midst of untangling this mess. I'll tell you what I know when I know.~ + C0CandleReCanderousC6.3

CHAIN C0CR#CAN C0CandleReCanderousC6.2
~So it is the Iron Throne... by Helm, my instinct was correct. You may already know, <CHARNAME>, but several leaders of that foul group have recently entered the castle halls.~
= ~They acted civil enough in talk, but the stench of evil upon them was poignant. I do not trust them... but as guests of the keep, I cannot bring accusations to the First Reader or the Keeper without evidence of wrongdoing.~
= ~Be wary of their actions, <CHARNAME>, but do not act rashly. You have only just returned. I hope you are not forced to leave again so quickly.~
EXIT

CHAIN C0CR#CAN C0CandleReCanderousC6.3
~As you say, <CHARNAME>. But please, tell me if I can ever be of assistance.~
EXIT

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#CAN C0CandleReCanderousNotPC
~Be vigilant, <GABBER>. Evil has made its stealthy entrance in this sacred place.~
EXIT

// Deder
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0) !PartyHasItem("MISC41")~ THEN C0CR#DED C0CandleReDeder
~Hey there, <GABBER>.~
EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0) PartyHasItem("MISC41")~ THEN C0CR#DED C0CandleReDeder.1
~Is that a star sapphire, <CHARNAME>? Never thought someone'd find one here of all places. I know better than to ask where you found it.~
= ~That'll fetch you a good price once you're out there. If you're interested, though, I've got something here that you might like to trade it for.~
END
++ ~What is it?~ + C0CandleReDeder.1-1
++ ~Maybe some other time.~ + C0CandleReDeder.1-2

CHAIN C0CR#DED C0CandleReDeder.1-1
~My ma's old dagger. Now wait, I know that sounds like a bad deal, but hear me out. It's nothing fancy, but it cuts faster than any other of its kind you'll ever see. My mother, Isala, used this to survive the hard life in Sembia all those years ago.~
= ~It's probably not worth as much to most as that gem you've got, but it was made in the East so it'll survive this iron crisis, and that might make it worth a good bit even when you stop gettin' use out of it. I wouldn't offer it to anyone else, given its sentimental value, but I'd hate to let a friend go out into the dangerous world without giving them some more help if I can.~
= ~Anyways, it's up to you whether you want to make the deal or not. I'm sure you know best.~
END
++ ~I'll take the dagger.~ DO ~TakePartyItem("MISC41") DestroyItem("MISC41") GiveItemCreate("C0CR#DAG",Player1,1,0,0)~ + C0CandleReDeder.1-3
++ ~I think I'll hold onto the gem.~ + C0CandleReDeder.1-2

CHAIN C0CR#DED C0CandleReDeder.1-2
~Your choice. Offer's still open while you're around.~
EXIT

CHAIN C0CR#DED C0CandleReDeder.1-3
~Here. Take care of it... I'm sure my old ma down in Uroglan's realm will be happy if it shanks a few more bandits instead of wasting away here.~
= ~Good luck, <CHARNAME>. When you come back, we'll talk all about your stories over a few drinks at Winthrop's.~
EXIT

// Deder - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#DED C0CandleReDederC6
~It's good to see you back, <CHARNAME>. I knew the rough-and-tumble world out there wouldn't be enough to keep you down.~
== C0CR#DED ~If it were any other day, I'd gather up all the old faces and throw you a proper welcome. Unfortunately, today is a special occasion... tch. *spit*~
END
  ++ ~You're obviously frustrated, Deder. What's changed around here?~ + C0CandleReDederC6.1
  ++ ~Someone angered you? Did you already poison them?~ + C0CandleReDederC6.2
  ++ ~I don't have time to listen to your problems right now, Deder. We'll catch up some other time.~ + C0CandleReDederC6.0
  
CHAIN C0CR#DED C0CandleReDederC6.0
~As you wish, <CHARNAME>. Just watch out for those Iron Throne scum upstairs. Much as I'd like to stir up some trouble, I don't think the monks would appreciate it. I'll be off now. There's something else that I can't put my finger on that's been bothering me.~
DO ~EscapeArea()~ EXIT

CHAIN C0CR#DED C0CandleReDederC6.1
~Everything is as it was... on the surface, at least. The only thing standing out are those bastards from the Iron Throne.~
== C0CR#DED ~I hoped I'd heard the last of them after I left Sembia... never did I think they'd choose this of all places for their scheming. Hmph, excuse me—"peaceful negotiations". I've been eavesdropping on their meetings every chance I get, and it's all just honeyed words coming from serpents' tongues.~
== C0CR#DED ~You'd best steer clear of them. By the Black Hound, I've had half a mind to poison them myself several times just listening to them talk. I can't betray the trust of the Watchers though... hopefully those scum fall prey to some "accidents" on their way back to Sembia, and the world will be better off for it.~
== C0CR#DED ~That's not what's really concerning me, though. Something is wrong around these parts, and I just don't know what. I know every person who's spent longer than a day in this castle by face and name, and yet sometimes I blink and I feel like the person I'm looking at is someone else entirely. Maybe I'm getting old, but I trust my eyes. And that means it's definitely the people I can't trust.~
== C0CR#DED ~See you later, <CHARNAME>. I'm going to take another walk around and see if I can't figure out what's making the hairs on my feet stand on end all day.~
END
IF ~!PartyHasItem("C0CR#DAG")~ DO ~EscapeArea()~ EXIT
+ ~PartyHasItem("C0CR#DAG")~ + ~Wait, Deder. I've still got your mother's dagger. You can have it back.~ DO ~TakePartyItem("C0CR#DED") DestroyItem("C0CR#DED") AddExperienceParty(2000)~ + C0CandleReDederC6.3
+ ~PartyHasItem("C0CR#DAG")~ + ~Goodbye.~ DO ~EscapeArea()~ EXIT

CHAIN C0CR#DED C0CandleReDederC6.2
~Oh, no. All's fine and dandy. That's what everybody would prefer to believe until this whole thing blows over, at least. Me, my right eye hasn't been able to stop twitching for days now and I can't quite figure out why.~
EXTERN C0CR#DED C0CandleReDederC6.1

CHAIN C0CR#DED C0CandleReDederC6.3
~That old thing's still with you, eh? I wasn't sure I'd see it again, but I'm happy to. Was it of help to you out there?~
END
++ ~It was.~ + C0CandleReDederC6.4
++ ~For a while, definitely.~ + C0CandleReDederC6.4
++ ~Not really. I just thought it'd be wrong to sell it.~ + C0CandleReDederC6.5

CHAIN C0CR#DED C0CandleReDederC6.4
~I'm glad. I'm sure my ma will be happy to know this memento of her old days was good for something again for a while after all.~
EXTERN C0CR#DED C0CandleReDederC6.5

CHAIN C0CR#DED C0CandleReDederC6.5
~Well, in any case, thank you for bringing it back to me, <CHARNAME>. I'll be going now, but watch yourself while you're here. Candlekeep's not all that you remember it to be.~
EXIT

// Mordaine
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#MOR C0CandleReMordaine
~Oh, it's you, <CHARNAME>.~
== IMOEN2 IF ~IsValidForPartyDialog("%bg1_imoen%")~ ~Hey, it's Ms. Nose-in-the-books-all-day. With—surprise, surprise—her nose in another book.~
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
DO ~AddJournalEntry(%Quest1_Entry_1%,QUEST)
GiveItemCreate("C0CR#LET",Player1,1,0,0)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
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
== IMOEN2 IF ~IsValidForPartyDialog("%bg1_imoen%")~ ~Oh, c'mon, you don't need to deny it. I promise we won't spill your secret... on purpose, heh.~
== C0CR#MOR IF ~IsValidForPartyDialog("%bg1_imoen%")~ ~What's gotten into you two? You're both saying such strange things.~
EXTERN C0CR#MOR C0CandleReMordaineQuestComplete.2

CHAIN C0CR#MOR C0CandleReMordaineQuestComplete.2
~I asked that reader to bring me some of the potions I asked for during the last delivery to the castle. Things to bolster memory, keep fatigue at bay, you get the idea. He gave me the wrong ones, and it's all sorts of nonsense that I've no use for.~
= ~I told him, he'd better find where my order went and get it to me, or else I'll make sure he'll still be washing dishes in his current position for the next decade. I paid a good bit of gold for those potions!~
= ~You know what, <CHARNAME>? Here, take this with you. I couldn't find the intended owner for this bottle, and I can't use it myself. It's a very strange concoction... but I don't think it's dangerous. Maybe it'll do you some good out there.~
DO ~AddJournalEntry(%Quest1_Entry_2%,QUEST_DONE) AddexperienceParty(100) GiveItemCreate("potn36",Player1,1,0,0)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
IsGabber("%bg1_imoen%")~ THEN C0CR#MOR C0CandleReMordaineImoen
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

// Mordaine - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)~ THEN C0CR#MOR C0CandleReMordaineC6
~So, you've finally come back home, <CHARNAME>. The songs of your exploits have reached even here.~
= ~They're already recording the manuscripts and lyrics in the scrolls upstairs, of course. And I'll wager they'll have to write even more in the future, thanks to you.~
END
++ ~It has been a very eventful journey. What's new around here?~ + C0CandleReMordaineC6.1
++ ~You have always been interested in every piece of writing in these halls, Mordaine. Any new fascinating texts you'd like to share?~ + C0CandleReMordaineC6.1

CHAIN C0CR#MOR C0CandleReMordaineC6.1
~The books are old, but the faces around here are always changing. Perhaps it is my lack of sleep, but at moments I cannot help but believe that I mean it literally... still, I would prefer to think it a trick of the eyes. Better that, than what it would mean were I truly seeing what I think I do. Aside from that, there are the visitors, though they are all from the way of commerce. They do not interest me, aside from that one... odd fellow.~
= ~Koveras, I believe his name is. A polite enough man, certainly, and with a wealth of knowledge that can challenge even myself. Still, there is something off about him... and he's spoken at length with Ulraunt as well... though of what, I could not say. Perhaps be wary of the Keeper if you come across him here.~
= ~Still, I doubt there is much to be concerned of. Candlekeep has gone without incident for many years... I cannot imagine that would simply change in one day.~
EXIT

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#MOR C0CandleReMordaineC6
~Now, which of these books have I not read all the way through yet...?~
EXIT

// Osprey
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#OSP C0CandleReOsprey
~<CHARNAME>! Good <DAYNIGHTALL>. May your day be blessed with knowledge and wisdom.~
== C0CR#OSP ~As you see, I have been making my daily prayer to lord Deneir. Perhaps I should pray for you, as well, for you are soon to embark upon a long journey.~
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

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#OSP C0CandleReOsprey2
~May the First Scribe's illuminating candle of wisdom always light your path, my dear friend.~
EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
IsGabber("%bg1_imoen%")~ THEN C0CR#OSP C0CandleReOspreyImoen
~Hello, Imoen! I'm glad to see you here to pay your respects to the gods of knowledge. Perhaps you have the time to pray with me for a while? It will only take an hour... perhaps two, if you're inclined...~
== IMOEN2 ~Er, listen, Osprey... thanks, but I'm busy right now. I've got, um... chores. Yeah, chores! Gotta get to them right now!~
EXIT

// Osprey
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#OSP C0CandleReOspreyC6
~Oh, <CHARNAME>! I'm so very glad to see you've come home. I only just heard that you were here, and I was terribly worried I'd end up missing you!~
END
  ++ ~Missing me? Are you going somewhere, with that big backpack you're carrying?~ + C0CandleReOspreyC6.1
  ++ ~It's been a while, Osprey. Why don't we meet up later to catch up?~ + C0CandleReOspreyC6.2

CHAIN C0CR#OSP C0CandleReOspreyC6.1
~I'm... leaving Candlekeep today. High Librarian Cadderly Bonaduce wanted me to follow him to the Spirit Soaring to become one of his glyphscribes, and the First Reader approved it. You know what he said to me? "It's time for this little bird to fly". I didn't think he could say such silly things!~
= ~It's going to be a long journey, and it'll probably be years before I come back, but I couldn't say no to such a rare opportunity. My biggest regret was... well, I guess it wasn't a problem after all. I got to see you again before I went.~
END
  ++ ~I'm happy for you, Osprey. I'm sure you'll do well.~ + C0CandleReOspreyC6.3
  ++ ~Go, then. I'd hate to keep you for too long.~ + C0CandleReOspreyC6.4

CHAIN C0CR#OSP C0CandleReOspreyC6.3
~Thank you, <CHARNAME>... I'm so nervous, and I don't want to disappoint Cadderly with my inexperience... but I'll do my best regardless.~
EXTERN C0CR#OSP C0CandleReOspreyC6.4

CHAIN C0CR#OSP C0CandleReOspreyC6.4
~Well, I think it's time for me to be off now. I still have to say my farewells to the other scribes and the rest of my friends. Take care of yourself, <CHARNAME>, and write to me in the future so I know where you are. Goodbye!~
DO ~EscapeArea()~ EXIT

CHAIN C0CR#OSP C0CandleReOspreyC6.2
~Oh, no, I... I can't, <CHARNAME>, I'm sorry. I'd really, really love to, but I don't want to risk being left behind if I'm late.~
EXTERN C0CR#OSP C0CandleReOspreyC6.1

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

// Paloma - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)
Global("C0CandleRePalomaC6","GLOBAL",0)~ THEN C0CR#GFM C0CandleRePalomaC6
~Zzz... mmm... who is it? Do you have berries and honey water? I already told you... I don't want to see anyone... unless they have honey water...~
DO ~SetGlobal("C0CandleRePalomaC6","GLOBAL",1)~
== IMOEN2 IF ~InParty("%bg1_imoen%")~ THEN ~Oh no... it's Paloma, Gorion's familiar. Look at how weak she is, <CHARNAME>.~
== C0CR#GFM ~*sniff* No, wait... I recognize this scent... <CHARNAME>? Is that you? Oh, I must be dreaming... yes, it must be a dream... I've been so tired... ever since Gorion...~
END
  ++ ~Oh, Paloma...~ EXTERN C0CR#GFM C0CandleRePalomaC6.1
  ++ ~It's not a dream. It's me.~ EXTERN C0CR#GFM C0CandleRePalomaC6.2
  ++ ~Look closer, you stupid little dragon.~ EXTERN C0CR#GFM C0CandleRePalomaC6.3

CHAIN C0CR#GFM C0CandleRePalomaC6.1
~<CHARNAME>, since you're here, even though I know you're not... let me know... do you remember what happened? Did that day really happen? Or was it a nightmare? I... I remember, I was foraging for fruit... then Gorion called me, told me we needed to go... so I made myself invisible and went scouting...~
== C0CR#GFM ~Then that horrible, horrible man, in the black and spiky armor... he scared me so much, I had to run away and hide... it was so shameful, Gorion told me to keep an eye out, so I did, both of them... and then... and then—~
== IMOEN2 IF ~InParty("%bg1_imoen%")~ THEN ~...~
== C0CR#GFM ~I... I don't remember. I just remember hurting... and then everything went black. When I woke up again... I was tucked up here... Tethtoril came to see me, and I told him I was so, so tired, I didn't want to go out and play anymore.~
== C0CR#GFM ~He just nodded and gave me a pat on the head, and asked me if I wanted anything to eat... and then I've been resting here ever since... it's so strange. I sleep and I sleep, but I'm never any less tired... I just want to sleep more...~
== C0CR#GFM ~Mmm... I wonder, if I sleep again, will I even wake up...? I don't know... Gorion would know. Where did he go, <CHARNAME>? When will I see him again?~
END
  ++ ~He's gone, Paloma. I'm sorry.~ EXTERN C0CR#GFM C0CandleRePalomaC6.4
  ++ ~Gorion's dead.~ EXTERN C0CR#GFM C0CandleRePalomaC6.5
  ++ ~Don't worry about it, Paloma. Just rest.~ EXTERN C0CR#GFM C0CandleRePalomaC6.7

CHAIN C0CR#GFM C0CandleRePalomaC6.2
~Hee hee... <CHARNAME>, you're so silly... you're supposed to have left, remember, so how could you be here? You were with Gorion, on that day...~
EXTERN C0CR#GFM C0CandleRePalomaC6.1

CHAIN C0CR#GFM C0CandleRePalomaC6.3
~Oh, you've gotten so mean, <CHARNAME>... but since this is a dream, I'll forgive you. Even though you're being mean, it's nice to see you... again...~
EXTERN C0CR#GFM C0CandleRePalomaC6.1

CHAIN C0CR#GFM C0CandleRePalomaC6.4
~Gone...? Gone forever? No, no, I don't believe that, I know I was hurting, but I—~
EXTERN C0CR#GFM C0CandleRePalomaC6.6

CHAIN C0CR#GFM C0CandleRePalomaC6.5
~"Dead"? No, no, I don't believe that, I know I was hurting, but I—~
EXTERN C0CR#GFM C0CandleRePalomaC6.6

CHAIN C0CR#GFM C0CandleRePalomaC6.6
~Oh. Oh... I understand now... that's right, I'm dreaming. You're not really here, <CHARNAME>... of course I'd imagine something so silly. You're being silly, <CHARNAME>... but that wasn't funny.~
EXTERN C0CR#GFM C0CandleRePalomaC6.7

CHAIN C0CR#GFM C0CandleRePalomaC6.7
~Alright, I get it... I should sleep more... and then... when I wake up... I'll see you and Gorion... we'll play together when I'm not tired anymore...~
== C0CR#GFM ~Hey, <CHARNAME>... I know you're not really here, but Gorion told me once... he had something important... something very, very important, that you should see... just you...~
== C0CR#GFM ~It's in that chest there... I was told not to look... but when I woke up before, I felt like I *had* to know, but not why... <CHARNAME>, you know I've always been naughty, so... I read it all...~
== C0CR#GFM ~When you see it... if you didn't already... you'll be surprised... but don't ever forget, <CHARNAME>, you'll always, always, *always*, be Gorion's...~
== C0CR#GFM ~...~
DO ~ApplySpellRES("C0CR#SLP",Myself)~
== C0CR#GFM ~Zzz...~
END
  ++ ~Good night, Paloma...~ EXIT
  ++ ~(Pat the pseudodragon on the head)~ EXIT
  ++ ~Finally, you've stopped talking.~ EXIT

// Tethtoril
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReTethtorilSpeech","GLOBAL",2)~ THEN TETHTO C0CandleReTethtorilInsight
~Well, well, young <CHARNAME>. It looks like you have finally arrived.~
= ~I was hoping to speak with you one more time before you departed. I was taking my regular walk around the castle courtyard, you see, as I do every day, hearing the daily stories of all the good folk. And I have heard your name repeated often today, in particular.~
END
  ++ ~What exactly have you been hearing?~ + C0CandleReTethtorilInsight.1
  ++ ~I'm sorry, Tethtoril, but I don't have time right now. Gorion's waiting for me.~ + C0CandleReTethtorilInsight.0
  ++ ~I really don't have time to speak with you right now, old man.~ + C0CandleReTethtorilInsight.0

CHAIN TETHTO C0CandleReTethtorilInsight.0
~So be it. Go and speak with Gorion then, child. Take care of yourself in the world outside, and... I wish you good luck, for the trials ahead.~
DO ~SetGlobal("C0CandleReTethtorilSpeech","GLOBAL",3)
EscapeArea()~ EXIT

CHAIN TETHTO C0CandleReTethtorilInsight.1
~Well, that would certainly depend on who I have asked. But you have certainly left a good impression on the day of farewell, it seems, with the many simple favors you have made. Delivering swords, bolts and books for the Watchers, clearing rats from peevish Reevor's storehouse, even curing Dreppin's poor cow...~
= ~Your journey is an urgent one, young <CHARNAME>, and you have seen blood from those who would do you harm even here, where it should be safest. And yet, I am glad to see you have not forgotten to give a helping hand to those who ask.~
= ~I cannot be sorry enough that we could not have done more for you, child. You will face many dark days ahead, I will not lie, and even with Gorion at your side, your trials will only be greater... but to the end, I hope you will never lose your heart, and always be willing to continue helping others, no matter how petty the concern.~
= ~Nor do I hope that you ever forget that you are the pride of Candlekeep. Treasure your memories and experiences of this place—of your home and those who call you their friend—and look forward with courage. One day, everyone will welcome your safe return, with your heart and mind abundant with newfound wisdom.~
= ~Now go, child. Gorion is waiting for you. I do not doubt that we will meet again.~
DO ~SetGlobal("C0CandleReTethtorilSpeech","GLOBAL",3)
AddXPObject(Player1,2500)
EscapeArea()~ EXIT