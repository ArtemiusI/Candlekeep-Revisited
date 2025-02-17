// ASHATIEL

I_C_T BDDAUSTO 5 C0OspreyDauston
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~*This* is Lord Dauston the Dawnknight? He's... well, he's looking a few bricks short of a load right now, don't you think?~
END

INTERJECT BDDAUSTO 3 C0OspreyDauston2
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~I've heard of the name... Aun of the Asters, one of the most famed champions of the Morninglord. I've read about his deeds from the history tomes back in Candlekeep. And... the Shining Lady, Caelar Argent, is his kin.~
EXTERN BDDAUSTO 6

// LITITA

EXTEND_BOTTOM BDLITILA 0
+ ~IsValidForPartyDialogue("C0CR2OS")~ + ~Osprey, can you communicate with them?~ EXTERN C0CR2OSJ bdlitila
END

CHAIN C0CR2OSJ bdlitila
~I can try... O souls of the departed, focus your thoughts upon my voice, for I speak as a holy servant of Deneir.~
== BDSOTUK ~I hear your voice... you come into view.~
END
++ ~Thank you, Osprey. Spirit, can you understand me now? Tell me who you were in life.~ DO ~AddXPObject("C0Drake",500)~ EXTERN BDLITILA 1
++ ~Finally, you speak sense. More or less. Who were you?~ EXTERN BDLITILA 1
++ ~What do you want from us, spirits?~ EXTERN BDLITILA 1

// TAIELD

EXTEND_TOP BDTAIELD 1 #3
+ ~InParty("C0CR2OS")~ + ~Osprey, you look like you have something to say~ DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2) SetGlobal("bd_sdd301_taield_skill","global",2)~ EXTERN C0CR2OSJ OSPREY-TAIELD
END

CHAIN C0CR2OSJ OSPREY-TAIELD
~Oh, I'm not sure I'm fit to be giving advice on combat morale... oh, very well.~
== C0CR2OSJ ~You're a half-elf, like me, so I think I can understand what it's like. I'm sure you feel out of place, and it's like there's nobody around who you can talk to.~
== BDTAIELD ~I admit I've felt somewhat alienated. It's hard to feel part of the team when I'm so obviously different.~
== C0CR2OSJ ~I've only known my human father for my whole life, and didn't even recognize the world outside the walls of my home. Without my teacher to guide me, I would've felt completely lost too.~
== C0CR2OSJ ~But even if you feel different from the people around you, there's always something you can find in common. Something worth learning, something you both want to protect. And if you've found that thing, then you start to forget about the ephemeral things that you thought were keeping you apart. I'm sure you have something you care about as much as they do, right?~
EXTERN BDTAIELD 6

// TAKOS

I_C_T BDTAKOS 4 C0OspreyTakos
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~The crusaders did this? Why, the nerve of them... claiming to do the right thing, and then leaving nothing but destruction in their path. If I find the men who did this, I'll be sure to give them a taste of my hammer!~
END

// TRISTIAN

EXTEND_BOTTOM BDTRISTI 14
+ ~InParty("C0CR2OS")~ + ~Osprey.~ DO ~SetGlobal("bd_tristian_vs_npc","locals",1)~ EXTERN C0CR2OSJ OSPREY-TRISTIAN
END

CHAIN C0CR2OSJ OSPREY-TRISTIAN
~Hehe, you can count on me. I've played these sorts of games against Karan, Tethtoril, master Cadderly... I'm sure I'll catch on.~
EXTERN BDTRISTI 15

// Thrix the Profane

EXTEND_BOTTOM BDTHRIX 21 26 30 34 38 42 46 50 54 58 62 66 70 74 78 82 86 90
IF ~Global("C02_Saved_Osprey","bd4500",0)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 22 27 31 35 39 43 47 51 55 59 63 67 71 75 79 83 87 91 #1
IF ~Global("C02_Saved_Osprey","bd4500",0)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 23 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 #10
IF ~Global("C02_Saved_Osprey","bd4500",0)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 24 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 #5
IF ~Global("C02_Saved_Osprey","bd4500",0)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager1
END

CHAIN BDTHRIX ThrixWager1
~Hmm... perhaps the priestess of Deneir may be a worthy wager. My minions are trained in the use of instruments of war and torture, but useless with other tools. Perhaps a trained scribe is exactly what I need.~
END
++ ~Fine. Ask your riddle, and if I lose, then you can have Osprey.~ DO ~SetGlobal("C02OspreySacrifice","bd4500",1) SetGlobal("bd_thrix_sacrifice_companion","global",1)~ EXTERN BDTHRIX 116
++ ~Osprey is a friend of great importance to me. I'll not risk her to you.~ DO ~SetGlobal("C02_Saved_Osprey","bd4500",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN C0CR2OSJ ThrixWager2
++ ~I would be a poor friend to put Osprey's soul at risk for your games, devil. We may gamble, but it'll be with my soul as the wager, none other.~ EXTERN BDTHRIX 113
++ ~You've made a grave mistake threatening my friend, devil. Stand aside if you value your life.~ EXTERN BDTHRIX 12

CHAIN C0CR2OSJ ThrixWager2
~Thank you, <CHARNAME>, but I'd sooner risk myself than anyone else if I had to. But the wiser choice would be to not play this twisted game at all.~
== BDTHRIX ~Hmph. Perhaps the overwhelming stench of piousness would soon grow tiresome regardless. Very well, I shall choose another.~
END
IF ~RandomNum(4,1)~ EXTERN BDTHRIX 78
IF ~RandomNum(4,2)~ EXTERN BDTHRIX 79
IF ~RandomNum(4,3)~ EXTERN BDTHRIX 80
IF ~RandomNum(4,4)~ EXTERN BDTHRIX 81

EXTEND_BOTTOM BDTHRIX 118
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END

EXTEND_BOTTOM BDTHRIX 119
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END

EXTEND_BOTTOM BDTHRIX 120
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END

EXTEND_BOTTOM BDTHRIX 121
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END

EXTEND_BOTTOM BDTHRIX 122
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END

CHAIN BDTHRIX ThrixWager4
~Now, Deneirrath... it will soon be time to cast off those colors and replace them with an attire more suited for a devil's servant.~
END
++ ~I'm sorry, Osprey. I've made a mistake.~ DO ~SetGlobal("C02_thrix_mark_osprey","global",1)~ EXTERN C0CR2OSJ ThrixWager5
++ ~I don't think so. Stay away from her, Thrix.~ EXTERN BDTHRIX 10

CHAIN C0CR2OSJ ThrixWager5
~My lord Deneir will not give me up so easily, cornugon... I am certain of that.~
DO ~SetGlobal("bd_thrix_plot","global",11)~ EXTERN BDTHRIX 140

CHAIN IF WEIGHT #-1 ~Global("C02OspreySacrifice","bd4500",1)~ THEN C0CR2OSJ ThrixTalk0
~<CHARNAME>... what should I say? What *can* I even say?~
END
+ ~!Global("C02_thrix_mark_osprey","global",1)~ + ~I don't know what I was thinking, Osprey. Please forgive me.~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk1
+ ~Global("C02_thrix_mark_osprey","global",1)~ + ~I don't know what I was thinking, Osprey. Please forgive me.~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk3
+ ~!Global("C02_thrix_mark_osprey","global",1)~ + ~The chance of gaining more power to end this threat was one I had to take, Osprey. Someone like you should understand that.~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk2
+ ~Global("C02_thrix_mark_osprey","global",1)~ + ~The chance of gaining more power to end this threat was one I had to take, Osprey. Someone like you should understand that.~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk3
+ ~!Global("C02_thrix_mark_osprey","global",1)~ + ~If you don't know, then keep quiet.~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk4
+ ~Global("C02_thrix_mark_osprey","global",1)~ + ~If you don't know, then keep quiet.~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk3

CHAIN C0CR2OSJ ThrixTalk1
~*sigh* If it were anyone else... but I can't remain angry at you, <CHARNAME>. Besides... we have something more important to worry about. Let's just pretend this never happened, alright?~
EXIT

CHAIN C0CR2OSJ ThrixTalk2
~I guess I should count myself lucky you had the wit to solve the devil's riddle, at least. Otherwise... well, since we avoided the worst, I'll try not to think about where I'll be.~
EXIT

CHAIN C0CR2OSJ ThrixTalk3
~The devil isn't what I'm afraid of, <CHARNAME>. I trust in my lord Deneir to protect me... but I don't know about you, anymore. You've changed so much... too much.~
= ~I'm going to try my best to forget this... but I don't think that'll be likely.~
EXIT

CHAIN C0CR2OSJ ThrixTalk4
~...~
= ~As you wish.~
EXIT

// TSOLAK

I_C_T BDTSOLAK 5 C0OspreyTsolak
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~*whisper* Undeath snuffs out any goodness that a person may have had, <CHARNAME>. We can't trust a word it says.~
END

// VIDYAD

EXTEND_BOTTOM BDVIDYAD 9
+ ~InParty("C0CR2OS")~ + ~Osprey, any ideas?~ EXTERN C0CR2OSJ OSPREY-VIDYAD
END

CHAIN C0CR2OSJ OSPREY-VIDYAD
~Oh, I think I've heard one like this before... surely it must be bees, right?~
EXTERN BDVIDYAD 10

// WYNAN

EXTEND_BOTTOM BDWYNAN 14
+ ~InParty("C0CR2OS")~ + ~Osprey, can you take care of this?~ EXTERN C0CR2OSJ OSPREY-WYNAN
END

CHAIN C0CR2OSJ OSPREY-WYNAN
~Of course. With Deneir's blessing, we'll be free from this malignance.~
DO ~SetGlobal("BD_SDD200","GLOBAL",3)
SetGlobal("BD2100GL","GLOBAL",3)
SetGlobal("C0_sdd200_osprey","bd2100",1)
StartCutSceneMode()
ClearAllActions()
StartCutSceneEx("C02OSCV1",FALSE)~ EXIT
/*
// TALK 1

CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk1","GLOBAL",1)~ THEN C0CR2OSJ T1
~By the way, <CHARNAME>, I've been meaning to ask you... isn't Imoen with you? I thought I'd find her along with you for sure.~
DO ~SetGlobal("C0OspreySoDTalk1","GLOBAL",2)~
END
  ++ ~She was attacked by an assassin. They're taking care of her at the palace.~ + T1-1
  ++ ~The Shining Lady's dogs got to her. She's still alive, though.~ + T1-1

CHAIN C0CR2OSJ T1-1
~Imoen was attacked? By... crusaders? I heard from the Fist that there were rumors some had gotten into the city, but I never thought they'd get directly to you in the Ducal Palace of all places.~
= ~I should be thanking the gods that you're alright! I... I'm sure Imoen will be fine too. The Grand Dukes wouldn't accept any but the best healers to serve them.~
= ~But still, I can't believe it. The crusade... there truly is something darker lurking under its bright banner, just like I've heard.~
END
  ++ ~What have you heard, exactly?~ + T1-2
  ++ ~Anyone can raise a banner and claim to be fighting for the right thing. All the people on the streets would tell a different story.~ + T1-3
  ++ ~Let's leave this for another time. Bright or dark, we'll be confronting the crusade personally soon enough.~ + T1-4

CHAIN C0CR2OSJ T1-2
~Before I left the Spirit Soaring, I tried to find as much history as I could on the Shining Lady, Caelar Argent. She's a warrior of the Order of the Aster... the last in a long lineage of Lathanderite paladins, though never properly anointed in knighthood herself, and the records have never told of the reason.~
= ~Despite so, her recorded deeds have all been as heroic as any paladin. the crusade was said to have been born from those whose lives she saved and willingly followed her cause to protect and save others like themselves.~
= ~So... I could not believe that those following the cause of someone so righteous could be plundering the Sword Coast so thoughtlessly. I've wondered about how such a thing could make sense, if it were merely those taking advantage of her name for their own ends, or... if history has not been entirely truthful.~
= ~I guess we'll see for ourselves soon enough, won't we? If you want to know anything else about the crusade, in case it helps, you can ask me whenever you want.~
END
  ++ ~Thanks, Osprey. It'll be a great help having a scholar like you along.~ + T1-5
  ++ ~I can always expect you to have some kind of relevant knowledge in that head of yours.~ + T1-5

CHAIN C0CR2OSJ T1-3
~That's true. I also had my doubts, when I was learning what I could about the crusade and its leader...~
EXTERN C0CR2OSJ T1-2

CHAIN C0CR2OSJ T1-4
~You're right. We'll only know the truth if we seek it ourselves. The expedition is not far, so I'll just have to be patient and scrutinize every bit of knowledge that comes our way. Just like our tutors used to tell us.~
EXIT

CHAIN C0CR2OSJ T1-5
~Heh. Well, I can't let Mordaine laugh at me for slacking on my studies once I return home, now can I?~
EXIT
*/
// TALK 2

CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk2","GLOBAL",1)~ THEN C0CR2OSJ T2
~<CHARNAME>, now that we're away from the camp... do you think now's a good time to talk?~
DO ~SetGlobal("C0OspreySoDTalk2","GLOBAL",2)~
END
  ++ ~Is this about what happened while we were leaving the city?~ + T2-1
  ++ ~By all means, say what's on your mind.~ + T2-1
  ++ ~Fine, but make it quick.~ + T2-1

CHAIN C0CR2OSJ T2-1
~I... I didn't want to bring this up myself, because I figured you would tell me when you were ready. But then that man confronted you in front of so many people, and that was when I realized there wasn't much point in waiting any longer.~
= ~You should know, <CHARNAME>, when I arrived back at the Sword Coast, I didn't have a chance to return to Candlekeep, but I did exchange some letters with the old faces. With Tethtoril, and Winthrop, and Arkanis... they told me about what happened. And... about what you learned when you came back as well.~
END
  ++ ~You've already known for a while that I'm a Bhaalspawn, then?~ + T2-2
  ++ ~That's a relief. I wasn't sure how I was going to tell you myself.~ + T2-3
  ++ ~Does that concern you? Scare you, even?~ + T2-5
  ++ ~If you already know, there's no point in talking about it. Just follow my command, and everything will be fine.~ + T2-6

CHAIN C0CR2OSJ T2-2
~Yes. I found out from Tethtoril. I... was less surprised by the knowledge and more that he decided that I should know about it.~
EXTERN C0CR2OSJ T2-5

CHAIN C0CR2OSJ T2-3
~I think even Tethtoril believed it might be possible you wouldn't want to tell me. That's why he let me know in his first letter. And it was like he expected me to come back... because when I arrived at Baldur's Gate, there was already a courier waiting for me.~
EXTERN C0CR2OSJ T2-5

CHAIN C0CR2OSJ T2-4
~No... no, of course not. I've known you for long enough, <CHARNAME>, and even if I didn't... I respect Gorion enough to believe that he made the right decision to bring you to Candlekeep all those years ago.~
EXTERN C0CR2OSJ T2-5

CHAIN C0CR2OSJ T2-5
~Thinking back, I think even master Cadderly already knew, and expected that I would want to find you.~
= ~I was surprised that he was so accepting of my decision to leave the Spirit Soaring when I had only been an student for such a short time, but if it was because he wanted me to support you after I found out the truth, then it all makes sense. And...~
EXTERN C0CR2OSJ T2-6

CHAIN C0CR2OSJ T2-6
~Of course you can trust that I would support you, <CHARNAME>. I can't give up on a friend that easily, and besides... I have to respect Gorion's memory as well. Tethtoril and my father raised me, but Gorion was also one of my most respected teachers. He'd have wanted me to do what I can for you too.~
= ~Besides... Imoen's not with you now, so someone has to make up for her absence. My hands might be clumsy and slow compared to hers, and I definitely don't have all the practical experience she does from having followed you, but I've still learned enough to be able to back you up.~
= ~So don't you worry, my friend. Even if other people won't see you for who you are, I'll be here to make sure there's someone you can count on. Don't you ever treat me like a stranger. I'm still Osprey, the little scribe who's all fingers and thumbs, knocking the books off the shelves when I trip over, just like you remember... heh.~
EXIT