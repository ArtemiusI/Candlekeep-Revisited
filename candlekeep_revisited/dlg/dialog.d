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
@260
= @261
END
  + ~Global("C0CandleReArkanisQuest","GLOBAL",0)~ + @262 + C0CandleReArkanis.1
  ++ @263 EXIT

CHAIN C0CR#ARK C0CandleReArkanis.1
@264
== C0CR#ARK @265
== %bg1_imoen_dlg% IF ~IsValidForPartyDialog("%bg1_imoen%")~ @266
== C0CR#ARK IF ~IsValidForPartyDialog("%bg1_imoen%")~ @267
== C0CR#DED @268
DO ~AddJournalEntry(%Quest3_Entry_1%,QUEST) SetGlobal("C0CandleReArkanisQuest","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#ARK C0CandleReArkanis.2
@269
END
  + ~Global("C0CandleReArkanisQuest","GLOBAL",0)~ + @262 + C0CandleReArkanis.1
  + ~Global("C0CandleReArkanisQuest","GLOBAL",1)
	 PartyHasItem("BOOK18")
     PartyHasItem("BOOK35")~ + @270 + C0CandleReArkanis.3
  ++ @271 EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)
Global("C0CandleReArkanisQuest","GLOBAL",2)~ THEN C0CR#ARK C0CandleReArkanis.4
@272
EXIT

CHAIN C0CR#ARK C0CandleReArkanis.3
@273
DO ~TakePartyItem("BOOK18") TakePartyItem("BOOK35")~
== C0CR#ARK @274
== C0CR#DED @275
== C0CR#ARK @276
DO ~AddJournalEntry(%Quest3_Entry_2%,QUEST_DONE) AddexperienceParty(100) GiveItemCreate("arow02",Player1,30,0,0) SetGlobal("C0CandleReArkanisQuest","GLOBAL",2)~ EXIT

CHAIN IF WEIGHT #-1 ~IsGabber("%bg1_imoen%")~ THEN C0CR#ARK C0CandleReArkanisImoen
@277
== %bg1_imoen_dlg% @278
EXIT

EXTEND_TOP INNKE2 6
+ ~Global("C0CandleReArkanisQuest","GLOBAL",1) OR(2) !PartyHasItem("BOOK18") !PartyHasItem("BOOK35")~ + @279 EXTERN INNKE2 C0CandleReArkanisQuestWinthrop
+ ~Global("C0CandleReArkanisQuest","GLOBAL",1) OR(2) !PartyHasItem("BOOK18") !PartyHasItem("BOOK35")~ + @280 DO ~StartStore("Inn2616",LastTalkedToBy(Myself))~ EXIT 
END

CHAIN INNKE2 C0CandleReArkanisQuestWinthrop
@281
EXIT

// Arkanis - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)
GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#ARK C0CandleReArkanisC6
@282
END
  ++ @283 + C0CandleReArkanisC6.1
  ++ @284 + C0CandleReArkanisC6.0

CHAIN C0CR#ARK C0CandleReArkanisC6.0
@285
EXIT
  
CHAIN C0CR#ARK C0CandleReArkanisC6.1
@286
== C0CR#ARK @287
== C0CR#ARK @288
EXIT

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#ARK C0CandleReArkanisC6
@289
EXIT

INTERJECT ARKANI3 3 C0CandleReArkanisImoenTalk
== %bg1_imoen_dlg% IF ~IsValidForPartyDialog("%bg1_imoen%")~ THEN @290
END
 ++ @291 EXTERN %bg1_imoen_dlg% C0CandleReArkanisImoenTalk.1
 ++ @292 EXTERN ARKANI3 2
 ++ @293 DO ~ActionOverride("DEDER",Enemy())
ActionOverride("ARKANIS",Enemy())~ EXIT
 
CHAIN %bg1_imoen_dlg% C0CandleReArkanisImoenTalk.1
@294
EXTERN ARKANI3 1

INTERJECT ARKANI3 1 C0CandleReArkanisC6
== C0CR#DE3 @295
== ARKANI3 @296
	DO ~SetGlobal("C0CandleReArkanisC6Join","GLOBAL",1)
		ActionOverride("deder",ChangeAIScript("C0CR#C6S",DEFAULT))
		ChangeAIScript("C0CR#C6S",DEFAULT)
		ActionOverride("deder",ChangeEnemyAlly(Myself,CONTROLLED))
		ActionOverride("deder",UseItem("potn41",Myself))
		ChangeEnemyAlly(Myself,CONTROLLED)
		UseItem("potn09",Myself)~ EXIT

I_C_T2 TETHTO3 0 C0CandleReArkanisC6Interject
== ARKANI3 IF ~InMyArea("ARKANIS")~ THEN @297
== TETHTO3 @298
END

I_C_T2 HULL3 0 C0CandleReArkanisC6Interject2
== ARKANI3 IF ~InMyArea("ARKANIS")~ THEN @299
END

CHAIN IF WEIGHT #-1 ~Global("C0CandleReArkanisC6Join","GLOBAL",2)~ THEN ARKANI3 C0CandleReArkanisC6End
@300
== ARKANI3 @301
== C0CR#DE3 IF ~InMyArea("DEDER")~ THEN @302
== ARKANI3 @303
END
  ++ @304 EXTERN ARKANI3 C0CandleReArkanisC6End.1
  ++ @305 EXTERN ARKANI3 C0CandleReArkanisC6End.1
  
CHAIN ARKANI3 C0CandleReArkanisC6End.1
@306
DO ~ActionOverride("deder",EscapeAreaObject("Door2615"))
EscapeAreaObject("Door2615")~ EXIT

CHAIN IF WEIGHT #-1 ~Dead("arkanis")
Global("C0CandleReArkanisC6Join","GLOBAL",2)~ THEN C0CR#DE3 C0CandleReArkanisC6End
@307
== C0CR#DE3 @308
== C0CR#DE3 @309
DO ~EscapeAreaObject("Door2615")~ EXIT
  
// Canderous
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReCanderousQuest","GLOBAL",1) Global("C0CandleReCanderousHeal","GLOBAL",1)~ THEN C0CR#CAN C0CandleReCanderousHealing
@310
END
  ++ @311 + C0CandleReCanderous.3
  ++ @312 + C0CandleReCanderous.4

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#CAN C0CandleReCanderous
@313
END
  + ~Global("C0CandleReCanderousQuest","GLOBAL",0)~ + @314 + C0CandleReCanderous.1
  ++ @315 EXIT

CHAIN C0CR#CAN C0CandleReCanderous.1
@316
== C0CR#CAN	@317
== %bg1_imoen_dlg% IF ~IsValidForPartyDialog("%bg1_imoen%")~ @318
== C0CR#CAN @319
DO ~AddJournalEntry(%Quest2_Entry_1%,QUEST) SetGlobal("C0CandleReCanderousQuest","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#CAN C0CandleReCanderousAgain
@320
END
  + ~Global("C0CandleReCanderousQuest","GLOBAL",1)
     PartyHasItem("C0CR#BAG")~ + @321 DO ~TakePartyItem("C0CR#BAG") DestroyItem("C0CR#BAG")~ + C0CandleReCanderous.2
  + ~Global("C0CandleReCanderousQuest","GLOBAL",0)~ + @314 + C0CandleReCanderous.1
  ++ @322 EXIT

CHAIN C0CR#CAN C0CandleReCanderous.2
@323
END
IF ~HPPercentLT(Player1,100)~ EXTERN C0CR#CAN C0CandleReCanderous.injured
IF ~!HPPercentLT(Player1,100)~ EXTERN C0CR#CAN C0CandleReCanderous.notinjured

CHAIN C0CR#CAN C0CandleReCanderous.injured
@324
DO ~SetGlobal("C0CandleReCanderousHeal","GLOBAL",1)
		StartCutSceneMode()
		CutSceneId("CANDEROUS")
        Wait(1)
        ForceSpell(Player1,CLERIC_CURE_LIGHT_WOUNDS)
        Wait(1)
        StartDialogueNoSet(Player1)~ EXIT

CHAIN C0CR#CAN C0CandleReCanderous.notinjured
@325
END
  ++ @311 + C0CandleReCanderous.3
  ++ @326 + C0CandleReCanderous.4
  
CHAIN C0CR#CAN C0CandleReCanderous.3
@327
== C0CR#CAN @328
EXTERN C0CR#CAN C0CandleReCanderous.5

CHAIN C0CR#CAN C0CandleReCanderous.4
@329
EXTERN C0CR#CAN C0CandleReCanderous.5

CHAIN C0CR#CAN C0CandleReCanderous.5
@330
= @331
DO ~AddJournalEntry(%Quest2_Entry_2%,QUEST_DONE) AddexperienceParty(100) SetGlobal("C0CandleRECanderousQuest","GLOBAL",2)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)~ THEN C0CR#CAN C0CandleReCanderousNotPC
@332
EXIT

// Canderous - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~NumTimesTalkedTo(0)
GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#CAN C0CandleReCanderousC6
@333
END
IF ~IsValidForPartyDialog("AJANTIS")~ EXTERN AJANTJ C0CandleReCanderousC6Ajantis
IF ~!IsValidForPartyDialog("AJANTIS")~ EXTERN C0CR#CAN C0CandleReCanderousC6.1

CHAIN AJANTJ C0CandleReCanderousC6Ajantis
@334
== C0CR#CAN @335
== AJANTJ @336
== C0CR#CAN @337
== AJANTJ @338
== C0CR#CAN @339
== AJANTJ @340
== C0CR#CAN @341
EXTERN C0CR#CAN C0CandleReCanderousC6.1

CHAIN C0CR#CAN C0CandleReCanderousC6.1
@342
END
++ @343 + C0CandleReCanderousC6.2
++ @344 + C0CandleReCanderousC6.3

CHAIN C0CR#CAN C0CandleReCanderousC6.2
@345
= @346
= @347
EXIT

CHAIN C0CR#CAN C0CandleReCanderousC6.3
@348
EXIT

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#CAN C0CandleReCanderousNotPC
@349
EXIT

// Deder
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0) !PartyHasItem("MISC41")~ THEN C0CR#DED C0CandleReDeder
@350
EXIT

CHAIN IF WEIGHT #-1 ~IsGabber(Player1)
Global("Chapter","GLOBAL",0) PartyHasItem("MISC41")~ THEN C0CR#DED C0CandleReDeder.1
@501
= @502
END
++ @503 + C0CandleReDeder.1-1
++ @504 + C0CandleReDeder.1-2

CHAIN C0CR#DED C0CandleReDeder.1-1
@505
= @506
= @507
END
++ @508 DO ~TakePartyItem("MISC41") DestroyItem("MISC41") GiveItemCreate("C0CR#DAG",Player1,1,0,0)~ + C0CandleReDeder.1-3
++ @509 + C0CandleReDeder.1-2

CHAIN C0CR#DED C0CandleReDeder.1-2
@510
EXIT

CHAIN C0CR#DED C0CandleReDeder.1-3
@511
= @512
EXIT

// Deder - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#DED C0CandleReDederC6
@351
== C0CR#DED @352
END
  ++ @353 + C0CandleReDederC6.1
  ++ @354 + C0CandleReDederC6.2
  ++ @355 + C0CandleReDederC6.0
  
CHAIN C0CR#DED C0CandleReDederC6.0
@356
DO ~EscapeArea()~ EXIT

CHAIN C0CR#DED C0CandleReDederC6.1
@357
== C0CR#DED @358
== C0CR#DED @359
== C0CR#DED @360
== C0CR#DED @361
END
+ ~PartyHasItem("C0CR#DAG")~ + @513 DO ~TakePartyItem("C0CR#DED") DestroyItem("C0CR#DED") AddExperienceParty(2000)~ + C0CandleReDederC6.3
+ ~PartyHasItem("C0CR#DAG")~ + @374 DO ~EscapeArea()~ EXIT
IF ~!PartyHasItem("C0CR#DAG")~ DO ~EscapeArea()~ EXIT

CHAIN C0CR#DED C0CandleReDederC6.2
@362
EXTERN C0CR#DED C0CandleReDederC6.1

CHAIN C0CR#DED C0CandleReDederC6.3
@514
END
++ @515 + C0CandleReDederC6.4
++ @516 + C0CandleReDederC6.4
++ @517 + C0CandleReDederC6.5

CHAIN C0CR#DED C0CandleReDederC6.4
@518
EXTERN C0CR#DED C0CandleReDederC6.5

CHAIN C0CR#DED C0CandleReDederC6.5
@519
EXIT

// Mordaine
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#MOR C0CandleReMordaine
@363
== %bg1_imoen_dlg% IF ~IsValidForPartyDialog("%bg1_imoen%")~ @364
== C0CR#MOR @365
END
  ++ @366 + C0CandleReMordaine.1
  ++ @367 + C0CandleReMordaine.1
  ++ @368 + C0CandleReMordaine.1

CHAIN C0CR#MOR C0CandleReMordaine.1
@369
= @370
= @371
END
  + ~Global("C0CandleReMordaineQuest","GLOBAL",0)~ + @372 DO ~SetGlobal("C0CandleReMordaineQuest","GLOBAL",1)~ + C0CandleReMordaine.2
  ++ @373 EXIT
  ++ @374 EXIT
  
CHAIN C0CR#MOR C0CandleReMordaine.2
@375
= @376
DO ~AddJournalEntry(%Quest1_Entry_1%,QUEST)
GiveItemCreate("C0CR#LET",Player1,1,0,0)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#MOR C0CandleReMordaine
@377
END
  + ~Global("C0CandleReMordaineQuest","GLOBAL",0)~ + @372 DO ~SetGlobal("C0CandleReMordaineQuest","GLOBAL",1)~ + C0CandleReMordaine.2
  + ~Global("C0CandleReMordaineQuest","GLOBAL",2)~ + @378 DO ~SetGlobal("C0CandleReMordaineQuest","GLOBAL",3)~ + C0CandleReMordaineQuestComplete
  ++ @379 EXIT

CHAIN C0CR#MOR C0CandleReMordaineQuestComplete
@380
END
  ++ @381 + C0CandleReMordaineQuestComplete.1
  ++ @382 + C0CandleReMordaineQuestComplete.1
  ++ @383 + C0CandleReMordaineQuestComplete.2
  
CHAIN C0CR#MOR C0CandleReMordaineQuestComplete.1
@384
== %bg1_imoen_dlg% IF ~IsValidForPartyDialog("%bg1_imoen%")~ @385
== C0CR#MOR IF ~IsValidForPartyDialog("%bg1_imoen%")~ @386
EXTERN C0CR#MOR C0CandleReMordaineQuestComplete.2

CHAIN C0CR#MOR C0CandleReMordaineQuestComplete.2
@387
= @388
= @389
DO ~AddJournalEntry(%Quest1_Entry_2%,QUEST_DONE) AddexperienceParty(100) GiveItemCreate("potn36",Player1,1,0,0)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
IsGabber("%bg1_imoen%")~ THEN C0CR#MOR C0CandleReMordaineImoen
@390
== %bg1_imoen_dlg% @391
EXIT

EXTEND_TOP READ2 0
+ ~Global("C0CandleReMordaineQuest","GLOBAL",1) PartyHasItem("C0CR#LET")~ + @392 EXTERN READ2 C0CandleReMordaineQuestReader
END

CHAIN READ2 C0CandleReMordaineQuestReader
@393
DO ~TakePartyItem("C0CR#LET") DestroyItem("C0CR#LET")~
= @394
DO ~SetGlobal("C0CandleReMordaineQuest","GLOBAL",2)~ EXIT

// Mordaine - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)~ THEN C0CR#MOR C0CandleReMordaineC6
@395
= @396
END
++ @397 + C0CandleReMordaineC6.1
++ @398 + C0CandleReMordaineC6.1

CHAIN C0CR#MOR C0CandleReMordaineC6.1
@399
= @400
= @401
EXIT

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#MOR C0CandleReMordaineC6
@402
EXIT

// Osprey
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#OSP C0CandleReOsprey
@403
== C0CR#OSP @404
END
  + ~!ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)~ + @405 + C0CandleReOsprey.highroll
  + ~ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)~ + @405 + C0CandleReOsprey.lowroll
  ++ @406 + C0CandleReOsprey.rude
  
CHAIN C0CR#OSP C0CandleReOsprey.rude
@407
EXIT

CHAIN C0CR#OSP C0CandleReOsprey.highroll
@408
DO ~GiveItemCreate("C0CR#RIN",Player1,1,0,0)~ EXIT

CHAIN C0CR#OSP C0CandleReOsprey.lowroll
@409
EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
!NumTimesTalkedTo(0)
IsGabber(Player1)~ THEN C0CR#OSP C0CandleReOsprey2
@410
EXIT

CHAIN IF WEIGHT #-1 ~Global("Chapter","GLOBAL",0)
IsGabber("%bg1_imoen%")~ THEN C0CR#OSP C0CandleReOspreyImoen
@411
== %bg1_imoen_dlg% @412
EXIT

// Osprey
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)~ THEN C0CR#OSP C0CandleReOspreyC6
@413
END
  ++ @414 + C0CandleReOspreyC6.1
  ++ @415 + C0CandleReOspreyC6.2

CHAIN C0CR#OSP C0CandleReOspreyC6.1
@416
= @417
END
  ++ @418 + C0CandleReOspreyC6.3
  ++ @419 + C0CandleReOspreyC6.4

CHAIN C0CR#OSP C0CandleReOspreyC6.3
@420
EXTERN C0CR#OSP C0CandleReOspreyC6.4

CHAIN C0CR#OSP C0CandleReOspreyC6.4
@421
DO ~EscapeArea()~ EXIT

CHAIN C0CR#OSP C0CandleReOspreyC6.2
@422
EXTERN C0CR#OSP C0CandleReOspreyC6.1

// Firebead
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

INTERJECT FIREB1 2 C0CandleReFirebead
== FIREB1 IF ~Class(Player1,MAGE_ALL)~ THEN @423
== FIREB1 @424
END
  ++ @425 DO ~GiveItemCreate("scrl68",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll
  ++ @426 DO ~GiveItemCreate("scrl72",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll
  ++ @427 DO ~GiveItemCreate("scrla6",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll
  ++ @428 DO ~GiveItemCreate("scrl78",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll
  ++ @429 DO ~GiveItemCreate("scrl79",Player1,1,0,0)~ EXTERN FIREB1 C0CandleReFirebeadScroll

CHAIN FIREB1 C0CandleReFirebeadScroll
@430
COPY_TRANS FIREB1 2

// Paloma - C6
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~GlobalGT("Chapter","GLOBAL",0)
Global("C0CandleRePalomaC6","GLOBAL",0)~ THEN C0CR#GFM C0CandleRePalomaC6
@431
DO ~SetGlobal("C0CandleRePalomaC6","GLOBAL",1)~
== %bg1_imoen_dlg% IF ~InParty("%bg1_imoen%")~ THEN @432
== C0CR#GFM @433
END
  ++ @434 EXTERN C0CR#GFM C0CandleRePalomaC6.1
  ++ @435 EXTERN C0CR#GFM C0CandleRePalomaC6.2
  ++ @436 EXTERN C0CR#GFM C0CandleRePalomaC6.3

CHAIN C0CR#GFM C0CandleRePalomaC6.1
@437
== C0CR#GFM @438
== %bg1_imoen_dlg% IF ~InParty("%bg1_imoen%")~ THEN @439
== C0CR#GFM @440
== C0CR#GFM @441
== C0CR#GFM @442
END
  ++ @443 EXTERN C0CR#GFM C0CandleRePalomaC6.4
  ++ @444 EXTERN C0CR#GFM C0CandleRePalomaC6.5
  ++ @445 EXTERN C0CR#GFM C0CandleRePalomaC6.7

CHAIN C0CR#GFM C0CandleRePalomaC6.2
@446
EXTERN C0CR#GFM C0CandleRePalomaC6.1

CHAIN C0CR#GFM C0CandleRePalomaC6.3
@447
EXTERN C0CR#GFM C0CandleRePalomaC6.1

CHAIN C0CR#GFM C0CandleRePalomaC6.4
@448
EXTERN C0CR#GFM C0CandleRePalomaC6.6

CHAIN C0CR#GFM C0CandleRePalomaC6.5
@449
EXTERN C0CR#GFM C0CandleRePalomaC6.6

CHAIN C0CR#GFM C0CandleRePalomaC6.6
@450
EXTERN C0CR#GFM C0CandleRePalomaC6.7

CHAIN C0CR#GFM C0CandleRePalomaC6.7
@451
== C0CR#GFM @452
== C0CR#GFM @453
== C0CR#GFM @454
== C0CR#GFM @439
DO ~ApplySpellRES("C0CR#SLP",Myself)~
== C0CR#GFM @455
END
  ++ @456 EXIT
  ++ @457 EXIT
  ++ @458 EXIT

// Tethtoril
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReTethtorilSpeech","GLOBAL",2)~ THEN TETHTO C0CandleReTethtorilInsight
@459
= @460
END
  ++ @461 + C0CandleReTethtorilInsight.1
  ++ @462 + C0CandleReTethtorilInsight.0
  ++ @463 + C0CandleReTethtorilInsight.0

CHAIN TETHTO C0CandleReTethtorilInsight.0
@464
DO ~SetGlobal("C0CandleReTethtorilSpeech","GLOBAL",3)
EscapeArea()~ EXIT

CHAIN TETHTO C0CandleReTethtorilInsight.1
@465
= @466
= @467
= @468
= @469
DO ~SetGlobal("C0CandleReTethtorilSpeech","GLOBAL",3)
AddXPObject(Player1,2500)
EscapeArea()~ EXIT