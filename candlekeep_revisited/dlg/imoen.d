ADD_TRANS_TRIGGER GORION 0 ~!IsValidForPartyDialog("IMOEN")~ DO 0
EXTEND_TOP GORION 0
+ ~IsValidForPartyDialog("IMOEN")~ + ~I'm ready to go right now.~ EXTERN IMOEN2 C0CandleReImoenFarewell
END

CHAIN IMOEN2 C0CandleReImoenFarewell
~So... guess this is it, huh?~
END
 ++ ~I wish you could come with me.~ + C0CandleReImoenFarewell.1
 ++ ~Goodbye, Imoen.~ + C0CandleReImoenFarewell.2

CHAIN IMOEN2 C0CandleReImoenFarewell.1
~Nah, I know that's not possible. Gorion would say it's too dangerous. I can guess what kind of trouble you're probably getting yourself into.~
EXTERN IMOEN2 C0CandleReImoenFarewell.2

CHAIN IMOEN2 C0CandleReImoenFarewell.2
~Take care of yourself, and, uh... aw, heck. I'm no good at this parting stuff. Never had to do it before. Not like this.~
= ~Just... make sure you come back in one piece, okay? I'm sure it won't be too long. And then show me the new stuff you've picked up!~
= ~See ya, <CHARNAME>.~
DO ~SetGlobal("C0CandleReImoenJoins","GLOBAL",3)
ClearAllActions()
StartCutSceneMode()
StartCutScene("ch1cut01")~ EXIT

INTERJECT IMOEN 7 C0CandleReImoenJoins
== IMOEN ~So, you headin' out with Mr. G right away? Said your farewells an' all?~
END
 ++ ~Not yet. I was just about to.~ + C0CandleReImoenJoins.1
 ++ ~Yep. I'll be off soon.~ + C0CandleReImoenJoins.0

INTERJECT IMOEN 6 C0CandleReImoenJoins
== IMOEN ~So, you headin' out with Mr. G right away? Said your farewells an' all?~
END
 ++ ~Not yet. I was just about to.~ + C0CandleReImoenJoins.1
 ++ ~Yep. I'll be off soon.~ + C0CandleReImoenJoins.0
 
INTERJECT IMOEN 7 C0CandleReImoenJoins
== IMOEN ~So, you headin' out with Mr. G right away? Said your farewells an' all?~
END
 ++ ~Not yet. I was just about to.~ + C0CandleReImoenJoins.1
 ++ ~Yep. I'll be off soon.~ + C0CandleReImoenJoins.0

CHAIN IMOEN C0CandleReImoenJoins.0
~Alright, then... guess this is goodbye. Keep in touch if you can, alright? Tell me what it's like out there. Maybe one day I'll be seein' it for myself!~
EXIT

CHAIN IMOEN C0CandleReImoenJoins.1
~Yeah, you better make sure you say goodbye to everyone. They'll sure miss you. Who knows when you'll be back.~
= ~Actually... if you've got a bit more time, why don't I tag along? I'll take any excuse to get away from my chores for the day. One last run 'round the castle before you go, what d'ya say?~
END
 ++ ~Sure. Let's hang out together one more time.~ + C0CandleReImoenJoins.2
 ++ ~Thanks, Imoen, but I can meet everyone on my own.~ + C0CandleReImoenJoins.3
 ++ ~I don't have time to babysit you today, Imoen. Go away!~ + C0CandleReImoenJoins.4

CHAIN IMOEN C0CandleReImoenJoins.2
~Right you are. You and me, doin' odd jobs, maybe a prank or two. It'll be good memories for when you go, right?~
DO ~SetGlobal("C0CandleReImoenJoins","GLOBAL",2)
SetGlobal("X#ImFriendTalk","GLOBAL",-1)
SetGlobal("C0CandleReImoenJoined","LOCALS",1)
JoinParty()~ EXIT

CHAIN IMOEN C0CandleReImoenJoins.3
~Alright, fine. If ya say so. Just make sure you talk to everybody, okay? Spent all your life here, people won't like it if you head off without a word. Go on then, you.~
EXIT

CHAIN IMOEN C0CandleReImoenJoins.4
~Hmph! Well, that's some gratitude, and when I was bein' all considerate. Fine, I'll do my own thing now. You get going then if you're feelin' so cranky.~
EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReImoenJoins","GLOBAL",2)~ THEN IMOENP C0CandleReImoenKicked
~Hey, what's up? You done hanging around, and it's time for you to go?~
END
++ ~No, not yet. You can stay for a bit longer.~ DO ~JoinParty()~ EXIT
++ ~Yeah. See you around, Imoen.~ + C0CandleReImoenKicked.1

CHAIN IMOENP C0CandleReImoenKicked.1
~Okay, well... I'll be heading off then. Maybe we'll see each other around some time? Bye.~
DO ~SetDialog("IMOEN")
SetGlobal("C0CandleReImoenJoins","GLOBAL",-1)
EscapeAreaMove("AR2600",2843,1895,S)~ EXIT

// Interjections
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

I_C_T2 HULL 1 C0CandleReImoenInterjectHull
== IMOEN2 IF ~IsValidForPartyDialog("IMOEN")~ THEN ~Wow, that much gold for just running back and forth for a sword? Maybe I should try to arrange for his sword to 'disappear' for a bit then happen to 'find' it, what d'ya think?~
END

I_C_T2 HULL 3 C0CandleReImoenInterjectHull
== IMOEN2 IF ~IsValidForPartyDialog("IMOEN")~ THEN ~Whoa, looks like someone woke up on the wrong side of the bed this morning. Don't worry, <CHARNAME>, I'm sure the verbal whipping the Gatewarden's gonna give him will be way harsher than what he's saying to you. And maybe I'll slip some coins out of his purse too, heh heh.~
END

I_C_T2 INNKE2 6 C0CandleReImoenInterjectWinthrop
== INNKE2 IF ~IsValidForPartyDialog("IMOEN")~ THEN ~Oho, and I see a familiar face taggin' along with you too. Imoen, girl, does my memory fail me, or did I not entrust you with the cleanin' of the rooms upstairs, eh?~
== IMOEN2 ~Puffguts! Um... I'll get to it... later! Yeah, just need to find, um... a cleaning rag somewhere...~
== INNKE2 ~Now, haven't I always told you to be honest to your old man? You're spendin' time with <CHARNAME> before <PRO_HESHE> goes, I don't mind it. Just make sure you don't forget before the day's through, aye? You know this old back ain't as good at bendin' over to reach the corners as it used to be.~
== IMOEN2 ~Aww... come on. Alright, alright... I'll get to it after I'm done sendin' off <CHARNAME>.~
== INNKE2 ~That's a good girl.~
END

I_C_T2 REEVOR 0 C0CandleReImoenInterjectReevor
== IMOEN2 IF ~IsValidForPartyDialog("IMOEN")~ THEN ~Beware, rat nation. <CHARNAME> be here with <PRO_HISHER> mighty broom to claim all that is yours. Isn't this what we have cats for?~
END

// Assassin
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReImoenAssassin","GLOBAL",1)~ THEN IMOEN2 C0CandleReImoenAssassin
~Wh-what the heck was that?!~
DO ~SetGlobal("C0CandleReImoenAssassin","GLOBAL",2)~ 
= ~That man... he was trying to *kill* you, <CHARNAME>! No, worse, he was trying to kill *you* specifically! What is going on?~
END
  ++ ~I don't know. I've never met him in my life.~ + C0CandleReImoenAssassin.1
  ++ ~Maybe this has something to do with Gorion.~ + C0CandleReImoenAssassin.2
  ++ ~Don't know, don't care. He's dead now.~ + C0CandleReImoenAssassin.3
  
CHAIN IMOEN2 C0CandleReImoenAssassin.1
~Well, he sure knew who you were! He recognized you on sight!~
EXTERN IMOEN2 C0CandleReImoenAssassin.4

CHAIN IMOEN2 C0CandleReImoenAssassin.2
~But he was after you, <CHARNAME>! He said he's after "Gorion's ward"!~
EXTERN IMOEN2 C0CandleReImoenAssassin.4

CHAIN IMOEN2 C0CandleReImoenAssassin.3
~Wait, wait. Don't you understand what a big deal this is? Someone's after *your* life, <CHARNAME>!~
EXTERN IMOEN2 C0CandleReImoenAssassin.4

CHAIN IMOEN2 C0CandleReImoenAssassin.4
~We need to tell someone, <CHARNAME>. Someone just slipped into Candlekeep just to try and kill you. Maybe... maybe you shouldn't go, after all. You need people to protect you.~
END
  ++ ~Then they'll be in as much danger as me.~ + C0CandleReImoenAssassin.5
  ++ ~But I want to go.~ + C0CandleReImoenAssassin.6
  ++ ~Maybe you're right. I'll have to talk to Gorion.~ + C0CandleReImoenAssassin.7
  
CHAIN IMOEN2 C0CandleReImoenAssassin.5
~You're... right, but... nobody would be happy to leave you to face danger alone, either.~
EXTERN IMOEN2 C0CandleReImoenAssassin.8

CHAIN IMOEN2 C0CandleReImoenAssassin.6
~You serious? Even after just now, with someone trying to put a knife in you? <CHARNAME>...~
EXTERN IMOEN2 C0CandleReImoenAssassin.8

CHAIN IMOEN2 C0CandleReImoenAssassin.7
~Yeah. Do that. Gorion wouldn't want you to get hurt, either. Gorion would...~
EXTERN IMOEN2 C0CandleReImoenAssassin.8

CHAIN IMOEN2 C0CandleReImoenAssassin.8
~Sorry, <CHARNAME>, I'm just... really freaked out right now. Whatever you decide to do, it's your choice. I just... don't want my friend to die out there. Be careful, okay?~
EXIT

CHAIN IF WEIGHT #-1 ~IsGabber(Player1) GlobalLT("Chapter","GLOBAL",1)~ THEN IMOEN2 C0CandleReImoenAssassin
~C'mon, <CHARNAME>, let's make our rounds through the castle. We're not gonna get another chance like this again, y'know?~
EXIT
