BEGIN C0CR2OS
BEGIN C0CR2OSJ

CHAIN IF WEIGHT #-1 ~AreaCheck("bd4700")
GlobalLT("bd_plot","global",570)~ THEN C0CR2OS OSPREY-BD4700
~We can't stop fighting, <CHARNAME>! I'm still with you!~
DO ~SetGlobal("C0Osprey_kicked_bd4700","global",1)
                 SetGlobal("bd_joined","locals",0)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReSoDOspreyStart","GLOBAL",0)~ THEN C0CR2OS OSPREY-SOD-START
~There... there you are, <CHARNAME>! I was worried I'd never find you in this city, as packed as it is. You still recognize me, don't you?~
== BDSCHAEL IF ~InMyArea("bdschael")~ THEN ~A friend of yours, <CHARNAME>?~
== C0CR2OS IF ~InMyArea("bdschael")~ THEN ~Oh! You're, um, Captain Corwin, aren't you? The Flaming Fist told me how I could recognize you after I signed on... forgive me, but could you give me a moment? I need to talk with <CHARNAME>.~
DO ~SetGlobal("C0CandleReSoDOspreyStart","GLOBAL",1)~
END
  ++ ~Osprey? What are you doing here?~ + OSPREY-SOD-START-1
  ++ ~Of course I recognize you. You haven't changed at all, Osprey.~ + OSPREY-SOD-START-2
  ++ ~I thought you had left with Cadderly when we last met at Candlekeep.~ + OSPREY-SOD-START-3

CHAIN C0CR2OS OSPREY-SOD-START-1
~I came to help, of course! The news of everything that's been happening here, from the coronation to the crusade reached all the way to the Spirit Soaring.~
EXTERN C0CR2OS OSPREY-SOD-START-4

CHAIN C0CR2OS OSPREY-SOD-START-2
~I—I haven't? I was hoping I might have, at least a little... oh, never mind. That's not important right now. In case you're wondering why I came back, it's because I'm here to help!~
EXTERN C0CR2OS OSPREY-SOD-START-4

CHAIN C0CR2OS OSPREY-SOD-START-3
~Well... yes. But I couldn't just stay in Erlkazar when things were getting so bad at home! The moment I got the news about what's been going on, I rushed back as fast as my legs could carry me.~
EXTERN C0CR2OS OSPREY-SOD-START-4

CHAIN C0CR2OS OSPREY-SOD-START-4
~I've been spending all this time studying as Master Cadderly's disciple, and it's been wonderful, but I couldn't just stay and focus on books and worship when I'd heard that the Sword Coast was being plagued by war.~
= ~Master Cadderly could tell that my thoughts were elsewhere, so he encouraged me to put my studies on hold and come home to do what I could, if it was what I wanted. So I took the fastest route back home, and when I arrived at Baldur's Gate, I heard about some of what you've been through, so... I thought I'd seek you out.~
= ~Still, I never thought things would be anywhere near this bad. All these people around every corner, it's so suffocating. Nothing like Candlekeep, is it? And they're all so tired and hungry... I wouldn't feel right without at least trying to do something.~
END
  ++ ~You've always been the sort to go out of your way to try and help people.~ + OSPREY-SOD-START-5
  ++ ~That's just more proof that you haven't changed.~ + OSPREY-SOD-START-5
  ++ ~If you're here to help, why don't you come with me?~ + OSPREY-SOD-START-6

CHAIN C0CR2OS OSPREY-SOD-START-5
~Really? Heh, I guess I can say I've taken all of Tethtoril's teachings to heart.~
EXTERN C0CR2OS OSPREY-SOD-START-7

CHAIN C0CR2OS OSPREY-SOD-START-6
~You don't even need to ask. The reason I was going around the city was to try to find you. Now that you're here, I can put some of my training to good use!~
EXTERN C0CR2OS OSPREY-SOD-START-8

CHAIN C0CR2OS OSPREY-SOD-START-7
~In any case, I've been looking all over the city trying to find you, and now that I have... can I come with you? I'm sure I can be of help.~
END
  ++ ~Of course. I wouldn't say no to an old friend.~ + OSPREY-SOD-START-8
  ++ ~As long as you've improved your skills, you can stick around.~ + OSPREY-SOD-START-8
  ++ ~Not right now, Osprey, but if you plan to fight the crusade, we'll probably see each other again soon.~ + OSPREY-SOD-START-9
  ++ ~I don't need you around, Osprey.~ + OSPREY-SOD-START-10

CHAIN C0CR2OS OSPREY-SOD-START-8
~Great! I can't say it'll quite be like the old times, but I can finally follow Imoen's example and do something for you.~
EXTERN C0CR2OS OSPREY-SOD-START-11

CHAIN C0CR2OS OSPREY-SOD-START-9
~Oh. Of course I've already signed up for the expedition, but... I was hoping we could spend some time catching up first.~
EXTERN C0CR2OS OSPREY-SOD-START-12

CHAIN C0CR2OS OSPREY-SOD-START-10
~Oh. I was hoping you'd be happier to see me, and we could catch up. But since I've signed up with the Flaming Fist, we'll be travelling together anyway...~
EXTERN C0CR2OS OSPREY-SOD-START-12

CHAIN C0CR2OS OSPREY-SOD-START-11
~I'll show you just how much I've learned from my time learning at the Spirit Soaring. You won't be disappointed.~
DO ~SetGlobal("C0CandleReSoDJoined","GLOBAL",1) JoinParty()~ EXIT

CHAIN C0CR2OS OSPREY-SOD-START-12
~If now's not a good time, then I'll take my leave for now. You can find me here in the city if you need my help, though. I'll be at the Sorcerous Sundries most of the time. See you, <CHARNAME>, my friend.~
DO ~EscapeAreaMove("bd0121",480,618,NE)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReSoDOspreyStart","GLOBAL",1) Global("C0CandleReSoDJoined","GLOBAL",0)~ THEN C0CR2OS OSPREY-SOD-START2
~Hey there, <CHARNAME>. Is there something I can do for you, old friend?~
END
  ++ ~I need your help, Osprey. Will you join me?~ + OSPREY-SOD-START2-1
  ++ ~Nothing right now.~ EXIT
  ++ ~Just saying hello.~ + OSPREY-SOD-START2-2

CHAIN C0CR2OS OSPREY-SOD-START2-1
~Of course! I've been waiting for you to ask.~
EXTERN C0CR2OS OSPREY-SOD-START-11

CHAIN C0CR2OS OSPREY-SOD-START2-2
~If you ever need any assistance, just ask.~
EXIT

CHAIN IF WEIGHT #-1 ~GlobalGT("bd_joined","locals",0)~ THEN C0CR2OS OSPREY-SOD-PROLOGUE
~Oh. Do you need me to go? I would hate to be a burden on you, but I'd prefer to be of help to you if I can.~
END
  ++ ~Just wait here for a while. I'll be back.~ + OSPREY-SOD-PROLOGUE-1
  + ~GlobalGT("bd_npc_camp_chapter","global",1)
GlobalLT("bd_npc_camp_chapter","global",5)
OR(2)
!Range("ff_camp",999)
NextTriggerObject("ff_camp")
!IsOverMe("C0CandleRe")~ + ~Go back to the camp for now. I'll come back for you.~ DO ~SetGlobal("bd_npc_camp","locals",1)~ + OSPREY-SOD-PROLOGUE-1
  ++ ~Stay with me, then.~ DO ~JoinParty()~ EXIT

CHAIN C0CR2OS OSPREY-SOD-PROLOGUE-1
~Alright. Take care of yourself, <CHARNAME>.~
DO ~SetGlobal("bd_joined","locals",0)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReSoDJoined","GLOBAL",1) Global("bd_joined","locals",0)~ THEN C0CR2OS OSPREY-SOD-PROLOGUE2
~You're back! Are you here to take me with you, <CHARNAME>?~
END
  ++ ~Yes.~ + OSPREY-SOD-PROLOGUE2-1
  ++ ~Not yet.~ EXIT

CHAIN C0CR2OS OSPREY-SOD-PROLOGUE2-1
~Lets go, then. Deneir's blessings are with us.~
DO ~JoinParty()~ EXIT
