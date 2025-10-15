// ASHATIEL

I_C_T BDDAUSTO 5 C0OspreyDauston
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~*This* is Lord Dauston the Dawnknight? He's... well, he's looking a few bricks short of a load right now, don't you think?~
END

INTERJECT BDDAUSTO 3 C0OspreyDauston2
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~I've heard of the name... Aun of the Asters, one of the most famed champions of the Morninglord. I've read about his deeds from the history tomes back in Candlekeep. And... the Shining Lady, Caelar Argent, is his kin.~
EXTERN BDDAUSTO 6

// IMOEN

I_C_T BDIMOEN 67 C0OspreyImoen
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~Imoen! It's been so long!~
== BDIMOEN ~Who... Osprey? It really is you, isn't it? I thought maybe I was still delirious from the poison, and mistook someone else for you!~
== C0CR2OSJ IF ~GlobalGT("C0OspreySoDTalk1","GLOBAL",1)~ THEN ~I heard about what happened to you from <CHARNAME>. Those from the crusade did this, didn't they? How vile, to act like they're righteous while working with assassins.~
== C0CR2OSJ IF ~!GlobalGT("C0OspreySoDTalk1","GLOBAL",1)~ THEN ~Poison? So that's why you weren't with <CHARNAME>... those from the crusade did this, didn't they? How vile, to act like they're righteous while working with assassins.~
== BDIMOEN ~I'm fine, Osprey... I'm sorry I can't get as excited as I would to see a familiar face, the way I am now. But I am really happy to see you.~
END

EXTEND_BOTTOM BDIMOEN 109
+ ~IsValidForPartyDialogue("C0CR2OS")~ + ~You didn't bring Osprey with you? I'm sure she would have wanted to come along.~ EXTERN BDIMOEN bdimoen.1
END

CHAIN BDIMOEN bdimoen.1
~I... didn't tell her. She was distraught after what happened, but I thought it'd be better if she went back to Erlkazar. She seemed to thrilled to become Cadderly's student, so I didn't have the heart to ask her to come and become a fugitive like us.~
= ~Don't worry, though. I left a letter behind explaining things just before I left. If nothing else, she'll know you're safe.~
EXTERN BDIMOEN 119

// JUNIA

INTERJECT BDJUNIA 16 C0OspreyJunia
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~Hang on, that's not right. Don't you mean Lathander, the Morninglord? You must be more exhausted than you look.~
EXTERN BDDAUSTO 6

CHAIN IF WEIGHT #-1 ~Dead("BDYMORI")
AreaCheck("BD2000")
Global("KNOW_VELSHAROON","GLOBAL",0)
NearLocation(Myself,4089,408,10)~ THEN C0CR2OSJ VelsharoonTalk
~Ohhh... this isn't good. This is even worse than I thought, <CHARNAME>, after seeing all these undead.~
DO ~SetGlobal("KNOW_VELSHAROON","GLOBAL",1)~
END
  ++ ~What do you mean?~ + VelsharoonTalk.1
  ++ ~Fighting the undead isn't anything new to me.~ + VelsharoonTalk.2

CHAIN C0CR2OSJ VelsharoonTalk.1
~Have you read "The Profane Faiths", <CHARNAME>? Maybe not... the monks never really let us look at it. Maybe they felt like it'd be a bad influence on us.~
= ~I—please don't tell Tethtoril when you see him again, but I... might have read it out of curiosity, just once. There's a god mentioned in one chapter—Velsharoon, the Lich-Lord. He was a Red Wizard who claimed the portfolio of necromancy and ascended to godhood. And these marks... I've seen them before in that very book.~
= ~Unless I'm mistaken, there must have been a priest who raised these undead with purpose not too long ago. A truly evil, and likely powerful one. We'd better be careful. If this trap was laid for us, they may not be too far behind... or ahead of us.~
EXIT

CHAIN C0CR2OSJ VelsharoonTalk.2
~No, it's not that. It's...~
EXTERN C0CR2OSJ VelsharoonTalk.1

INTERJECT BDJUNIA 33 C0OspreyJunia2
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~Stop lying! Lathander would never condone anything as vile as what you're suggesting. YOU'RE the necromancer, and by the guiding light of Deneir, you'll pay for the evil you've already done!~
END
IF ~IsValidForPartyDialogue("Dynaheir")~ EXTERN BDDYNAHJ 95
IF ~!IsValidForPartyDialogue("Dynaheir")~ EXTERN BDJUNIA 34

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
+ ~InParty("C0CR2OS")~ + ~Osprey, you look like you have something to say.~ DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2) SetGlobal("bd_sdd301_taield_skill","global",2)~ EXTERN C0CR2OSJ OSPREY-TAIELD
END

CHAIN C0CR2OSJ OSPREY-TAIELD
~I'm not sure I'm fit to be giving advice on combat morale... oh, very well.~
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

// TIAX

I_C_T BDTIAX 38 C0OspreyTiax
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~Cyricists, right? What do you expect.~
END

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

// TALK 2

CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk2","GLOBAL",2)~ THEN C0CR2OSJ T2
~<CHARNAME>, now that we're away from the camp... do you think now's a good time to talk?~
DO ~SetGlobal("C0OspreySoDTalk2","GLOBAL",3)~
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
  ++ ~Does that concern you? Scare you, even?~ + T2-4
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
END
  ++ ~Don't worry about that. The value of having a familiar face nearby is already plenty.~ + T2-7
  ++ ~As long as you watch where you're walking. There's more dangerous things to be knocking over out here than just some dusty old shelves.~ + T2-8
  ++ ~You'd better pull your weight. Old friend or no, if you're a liability, I won't hesitate to leave you behind.~ + T2-9

CHAIN C0CR2OSJ T2-7
~Well, I can definitely serve as that, if nothing else. But my magic has improved greatly as well since Cadderly took me under his wing, so that's more that you can look forward to seeing.~
EXTERN C0CR2OSJ T2-10

CHAIN C0CR2OSJ T2-8
~Hehe, I'll try to keep the missteps to a minimum. I just can't promise it'll *never* happen. Otherwise, you might confuse me for an impostor.~
EXTERN C0CR2OSJ T2-10

CHAIN C0CR2OSJ T2-9
~Noted. I wouldn't expect any special treatment, no matter what. Otherwise, I wouldn't be able to look at my old father in the eye, would I?~
EXTERN C0CR2OSJ T2-10

CHAIN C0CR2OSJ T2-10
~So don't you worry, my friend. Even if other people won't see you for who you are, I'll be here to make sure there's someone you can count on. Don't you ever treat me like a stranger. I'm still Osprey, the little scribe who's all fingers and thumbs, knocking the books off the shelves when I trip over, just like you remember... heh.~
EXIT

// TALK 3

CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk3","GLOBAL",2)~ THEN C0CR2OSJ T3
~How are you feeling, <CHARNAME>?~
DO ~SetGlobal("C0OspreySoDTalk3","GLOBAL",3)~
END
  ++ ~I'm fine.~ + T3-1
  ++ ~That's all you want to ask? Nothing on what just happened?~ + T3-2
  ++ ~Not good at all. My head's filled with questions. And quite a bit of pain.~ + T3-3
  ++ ~Leave me alone.~ + T3-0

CHAIN C0CR2OSJ T3-0
~Sorry. But if you need to talk, I'm here to listen.~
EXIT

CHAIN C0CR2OSJ T3-1
~I can't believe that you are, to be honest... but I'll take your word for it.~
EXTERN C0CR2OSJ T3-2

CHAIN C0CR2OSJ T3-2
~Of course I'm confused and curious about the sudden appearance of that symbol, but you falling onto the ground had me more concerned above all else.~
= ~After traveling with you for a bit, I'd gotten used to just seeing you as the friend who'd play and read alongside me and Imoen all those years ago. I almost forgot that you're more than that.~
= ~It must be hard. You're already carrying the hopes of an entire city, you shouldn't also have to carry their fear. I...~
END
  ++ ~Are you worried about me?~ + T3-4
  ++ ~Are you scared of me?~ + T3-4
  ++ ~I'd rather talk about anything but this right now.~ + T3-0

CHAIN C0CR2OSJ T3-3
~I can imagine. Even I'm in shock at what I just saw.~ 
EXTERN C0CR2OSJ T3-2

CHAIN C0CR2OSJ T3-4
~I'm worried *for* you, <CHARNAME>. I know you probably have changed in ways I don't even know yet, but I hope you'll never forget that there are still those who want the best for you. For you to not only to live, but also to be happy.~
= ~I want that. I'm sure Tethtoril does as well. Winthrop, too. And all of our old friends, even Mordaine. And Gorion... if he's watching over us, I'm sure that's also what he'd want.~
END
  ++ ~Don't worry about how I feel. As long as I have the trust of people close to me, that's enough.~ + T3-5
  ++ ~Thank you, Osprey.~ + T3-5
  ++ ~I'm not so weak as to need your reassurance.~ + T3-6

CHAIN C0CR2OSJ T3-5
~That's the spirit. Keep your spirits up, and remember I'm with you all the way. And if anyone wants to mess with my friend while I'm around, I'll give them a knock on the head with this hammer!~
EXIT

CHAIN C0CR2OSJ T3-6
~It's never a sign of weakness to lay your heart out with your friends, <CHARNAME>. But I understand, you probably just need time to process things. I'll drop it for now.~
EXIT

// TALK 4

CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk4","GLOBAL",2)~ THEN C0CR2OSJ T4
~Look at this, <CHARNAME>. Doesn't it look familiar? Maybe nostalgic, even?~
DO ~SetGlobal("C0OspreySoDTalk4","GLOBAL",3)~
END
  ++ ~"Harping by Moonlight", written by Elminster? That takes me back.~ + T4-1
  ++ ~There's something I haven't read in a long time.~ + T4-1
  ++ ~Doesn't look familiar to me.~ + T4-2
  ++ ~Stop waving that in my face. Go away.~ + T4-0

CHAIN C0CR2OSJ T4-0
~...Alright.~
EXIT

CHAIN C0CR2OSJ T4-1
~Elminster's Approaches to Life. I think it was the first book we were assigned to read together—you, me, and Mordaine. Imoen, too, but we both know she just slipped off to play instead. Still, she turned out to be familiar with it from front to back at some point anyway...~
= ~I don't know about you, but at the time, it did feel really boring to me. I suppose it wasn't something expected for us to understand at our age... but I've been revisiting it lately, and I have a deeper appreciation for the lessons it taught us.~
= ~It was all about the natures of good and evil, and of how it's as much a force as the laws of nature in the world we live in. I guess our tutors thought it'd be a way to steer us in the right direction, but all I could do at the time was try not to fall asleep.~
END
  ++ ~Those were good times.~ + T4-3
  ++ ~Me too. I wish I could've just been given more stories of epic adventures.~ + T4-4
  ++ ~And look at you now. You'd have hated the old you.~ + T4-5

CHAIN C0CR2OSJ T4-2
~Awh, you've really forgotten? You'll make Tethtoril cry if he finds out.~
EXTERN C0CR2OSJ T4-1

CHAIN C0CR2OSJ T4-3
~They were, weren't they?~
EXTERN C0CR2OSJ T4-6

CHAIN C0CR2OSJ T4-4
~I can't imagine you'd be desperate for those anymore, right? You're living in one now.~
EXTERN C0CR2OSJ T4-6

CHAIN C0CR2OSJ T4-5
~I don't know if I'd go that far... it's better to appreciate how the things I've learned have shaped me as a person. It makes me feel like I've grown into who I am now.~
EXTERN C0CR2OSJ T4-6

CHAIN C0CR2OSJ T4-6
~That was before everything changed. But it was sooner than just the day you left, wasn't it? Eventually, Tethtoril focused on me as his main pupil, and left your tutelage fully to Gorion...~
= ~Thinking about it, that was probably all to prepare you for this life, while I was never expected to leave at all.~
END
  ++ ~You're not envious, are you?~ + T4-7
  ++ ~Well, you're here anyway, so life can still surprise you.~ + T4-8
  ++ ~Would you have preferred to stay in Candlekeep and become a scribe, like your father?~ + T4-9

CHAIN C0CR2OSJ T4-7
~Oh, did I come across as that? I didn't mean to. Actually, I was thinking the opposite.~
EXTERN C0CR2OSJ T4-9

CHAIN C0CR2OSJ T4-8
~Well, it was a spur of the moment decision for me. I couldn't exactly sit by and do nothing while my homeland is being threatened.~
EXTERN C0CR2OSJ T4-9

CHAIN C0CR2OSJ T4-9
~To be honest, if it weren't for the fact that the Sword Coast—and you moreso—needed as much help as it could, I would have been happy to spend the rest of my days following in my father's footsteps, whether it was in Candlekeep, or the Spirit Soaring.~
= ~If anyone would have been expected to leave, I might've been the last on the list of our circle of old friends. You, Imoen, Mordaine, Deder... even Canderous and Arkanis would have been more likely.~
= ~And yet, against all odds, here I am. They'd all be surprised to know what I'm doing now... Mordaine, especially. She'd be furious.~
END
  ++ ~She always said she'd leave to find her father once she was ready.~ + T4-10
  ++ ~Not easy to continue your rivalry in your current positions, I imagine.~ + T4-11
  ++ ~Let's leave this for another time.~ + T4-15

CHAIN C0CR2OSJ T4-10
~She's never talked about why she was left at the library with us, and I wonder if even she knows the full reasons... but I've suspected that her father, wherever he is, is caught up in something important, and wanted to leave her out of it... but she, on the other hand, just wants to help him as well as she can.~
EXTERN C0CR2OSJ T4-12

CHAIN C0CR2OSJ T4-11
~Oh, you know that was always just a silly idea she'd hold on to. I'd always said I'd much rather see her as a friend than a rival. And I know she feels the same... she just won't say it.~
EXTERN C0CR2OSJ T4-12

CHAIN C0CR2OSJ T4-12
~Mordaine and I are about as close to each other as you are to Imoen. Even though she can be difficult and argumentative...~
= ~We're both seekers of knowledge, but our reasons are different. Mordaine seeks it for her own purposes, but my goal is to record it so that they can be used by others in the future. She wants to better herself, while I'm happy to help her in that way.~
= ~Of course, no matter how many times I tell her that, she insists on calling us rivals anyway. And then she'll pull my hair.~
END
  ++ ~When things in the Sword Coast are settled, you should visit Candlekeep and meet her again.~ + T4-13
  ++ ~Are you going to accompany her, when she's ready to leave herself?~ + T4-14
  ++ ~That's enough for now. I like talking about our friends, but we have work to do.~ + T4-15

CHAIN C0CR2OSJ T4-13
~Oh, definitely. And whenever she's decided she's ready to join us out here in the world...~
EXTERN C0CR2OSJ T4-16

CHAIN C0CR2OSJ T4-14
~I'll be at her side. Just like Imoen's been at yours. And maybe one day, the four of us might even go on an adventure together, what do you think?~
EXTERN C0CR2OSJ T4-16

CHAIN C0CR2OSJ T4-15
~Right... agreed.~
EXTERN C0CR2OSJ T4-16

CHAIN C0CR2OSJ T4-16
~In any case, that's enough reminiscing for one day, don't you think? I love talking about the past, but it's even better to have a chance to revisit it ourselves, and that won't happen until peace is restored.~
= ~Go on, <CHARNAME>. I'm ready to follow your lead.~
END
 ++ ~Osprey.~ + T4-17
 ++ ~Let's go, then.~ EXIT

CHAIN C0CR2OSJ T4-17
~What?~
END
 ++ ~You're wearing your tunic backwards again.~ + T4-18
 ++ ~Never mind.~ EXIT

CHAIN C0CR2OSJ T4-18
~I am? Aaah! I am! Why did nobody tell me?~
= ~I'm too heavily geared to change it now... but if I wear my armor like this... nobody will notice, right?~
END
  ++ ~Looks like some things will never change.~ + T4-19
  ++ ~I imagine plenty of people already have.~ + T4-19
  ++ ~You've distracted us both long enough. Let's go.~ EXIT

CHAIN C0CR2OSJ T4-19
~Oh, just stop teasing me! But it looks like this is just how I am, no matter how hard I try to change it.~
EXIT