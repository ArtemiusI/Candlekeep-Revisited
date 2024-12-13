BEGIN C0CR#GOR
BEGIN C0CR#JON
BEGIN C0CR#ERI
BEGIN C0CR#ULR
BEGIN C0CR#DOG

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionBegin","GLOBAL",0)~ THEN C0CR#GOR C0CandleReGorion
@12
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
@13
DO ~GiveGoldForce(400)~
= @14
END
IF ~AreaCheck("%bg1_eet_symbol%2617")~ DO ~PlaySong(0) EscapeArea()~ EXIT
IF ~AreaCheck("%bg1_eet_symbol%2616")~ DO ~PlaySong(0) ActionOverride("DEEDER",EscapeAreaObject("Door2600")) EscapeAreaObject("Door2600")~ EXIT
IF ~AreaCheck("%bg1_eet_symbol%2600")~ DO ~PlaySong(0) ActionOverride("C0CR#GFM",EscapeAreaObject("Door2608"))
               ActionOverride("C0CR#JON",EscapeAreaObject("Door2608"))
							 ActionOverride("C0CR#ERI",EscapeAreaObject("Door2608"))
							 ActionOverride("C0CR#DOG",EscapeAreaObject("Door2608"))
							 EscapeAreaObject("Door2608")~ EXIT

// Bard
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionBard
@15
= @16
END
  ++ @17 EXTERN C0CR#GOR C0CandleReGorionBard.1
  ++ @18 EXTERN C0CR#GOR C0CandleReGorionBard.2
  ++ @19 EXTERN C0CR#GOR C0CandleReGorionBard.2

CHAIN C0CR#GOR C0CandleReGorionBard.1
@20
EXTERN C0CR#GOR C0CandleReGorionBard.3

CHAIN C0CR#GOR C0CandleReGorionBard.2
@21
EXTERN C0CR#GOR C0CandleReGorionBard.3

CHAIN C0CR#GOR C0CandleReGorionBard.3
@22
= @23
DO ~GiveItemCreate("potn60",Player1,1,0,0)~
= @24
END
  ++ @25 EXTERN C0CR#GOR C0CandleReGorionBard.4
  ++ @26 EXTERN C0CR#GOR C0CandleReGorionBard.5
  ++ @27 EXTERN C0CR#GOR C0CandleReGorionBard.6

CHAIN C0CR#GOR C0CandleReGorionBard.4
@28
EXTERN C0CR#GOR C0CandleReGorionBard.6

CHAIN C0CR#GOR C0CandleReGorionBard.5
@29
EXTERN C0CR#GOR C0CandleReGorionBard.6

CHAIN C0CR#GOR C0CandleReGorionBard.6
@30
EXTERN C0CR#GOR C0CandleReGorionEnd

// Cleric
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionCleric
@31
END
  ++ @32 EXTERN C0CR#GOR C0CandleReGorionCleric.1
  ++ @33 EXTERN C0CR#GOR C0CandleReGorionCleric.2
  ++ @34 EXTERN C0CR#GOR C0CandleReGorionCleric.3

CHAIN C0CR#GOR C0CandleReGorionCleric.1
@35
EXTERN C0CR#GOR C0CandleReGorionCleric.2

CHAIN C0CR#GOR C0CandleReGorionCleric.2
@36
DO ~GiveItemCreate("scrl56",Player1,1,0,0) GiveItemCreate("scrl59",Player1,1,0,0)~
= @37
= @38
EXTERN C0CR#GOR C0CandleReGorionEnd

CHAIN C0CR#GOR C0CandleReGorionCleric.3
@39
EXTERN C0CR#GOR C0CandleReGorionCleric.2

// Mage
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionMage
@40
= @41
END
  ++ @42 EXTERN C0CR#GOR C0CandleReGorionMage.1
  ++ @43 EXTERN C0CR#GOR C0CandleReGorionMage.2
  ++ @44 EXTERN C0CR#GOR C0CandleReGorionMage.3

CHAIN C0CR#GOR C0CandleReGorionMage.1
@45
EXTERN C0CR#GOR C0CandleReGorionMage.3

CHAIN C0CR#GOR C0CandleReGorionMage.2
@46
EXTERN C0CR#GOR C0CandleReGorionMage.3

CHAIN C0CR#GOR C0CandleReGorionMage.3
@47
END
 ++ @48 + C0CandleReGorionMage.4

CHAIN C0CR#GOR C0CandleReGorionMage.4
@49
= @50
= @51
DO ~SetGlobal("C0CandleReGorionFamiliar","GLOBAL",1)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#016")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionFamiliar","GLOBAL",1)~ THEN C0CR#GFM C0CandleReGorionMageFam
@52
== C0CR#GOR @53
== C0CR#GFM @54
== C0CR#GOR @55
== C0CR#GFM @56
== C0CR#GOR @57
END
  ++ @58 EXTERN C0CR#GOR C0CandleReGorionMageFam.1
  ++ @59 EXTERN C0CR#GOR C0CandleReGorionMageFam.1
  ++ @60 EXTERN C0CR#GFM C0CandleReGorionMageFam.2

CHAIN C0CR#GOR C0CandleReGorionMageFam.1
@61
END
IF ~!Class(Player1,SORCERER)~ DO ~ActionOverride(Player1,AddSpecialAbility("SPWI123")~ EXTERN C0CR#GOR C0CandleReGorionMageFam.3
IF ~Class(Player1,SORCERER)~ DO ~GiveItemCreate("SCRL6D",Player1,1,0,0)~ EXTERN C0CR#GOR C0CandleReGorionMageFam.2

CHAIN C0CR#GOR C0CandleReGorionMageFam.2
@62
EXTERN C0CR#GOR C0CandleReGorionMageFam.3

CHAIN C0CR#GOR C0CandleReGorionMageFam.3
@63
EXTERN C0CR#GOR C0CandleReGorionEnd

CHAIN C0CR#GFM C0CandleReGorionMageFam.2
@56
END
  ++ @64 EXTERN C0CR#GOR C0CandleReGorionMageFam.1
  ++ @65 EXTERN C0CR#GOR C0CandleReGorionMageFam.1

// Fighter
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionJondalarBegin","GLOBAL",0)~ THEN C0CR#JON C0CandleReJondalarFighter
@66
DO ~SetGlobal("C0CandleReGorionJondalarBegin","GLOBAL",1)~
== C0CR#JON @67
END
  ++ @68 EXTERN C0CR#JON C0CandleReJondalarFighter.1
  ++ @69 EXTERN C0CR#JON C0CandleReJondalarFighter.2

CHAIN C0CR#JON C0CandleReJondalarFighter.1
@70
EXTERN C0CR#JON C0CandleReJondalarFighter.3

CHAIN C0CR#JON C0CandleReJondalarFighter.2
@71
EXTERN C0CR#JON C0CandleReJondalarFighter.3

CHAIN C0CR#JON C0CandleReJondalarFighter.3
@72
END
  ++ @73 EXTERN C0CR#JON C0CandleReJondalarFighter.4
  ++ @74 EXTERN C0CR#JON C0CandleReJondalarFighter.5

CHAIN C0CR#JON C0CandleReJondalarFighter.4
@75
EXTERN C0CR#JON C0CandleReJondalarFighter.6

CHAIN C0CR#JON C0CandleReJondalarFighter.5
@76
EXTERN C0CR#JON C0CandleReJondalarFighter.6

CHAIN C0CR#JON C0CandleReJondalarFighter.6
@77
= @78
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
@79
= @80
EXTERN C0CR#JON C0CandleReJondalarFighter.8

CHAIN C0CR#JON C0CandleReJondalarFighter.8
@81
DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#010")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionJondalarBegin","GLOBAL",1)~ THEN JONDAL C0CandleReJondalarNew
@82
DO ~SetGlobal("C0CandleReGorionJondalarBegin","GLOBAL",2)~ EXTERN JONDAL 1

CHAIN C0CR#JON C0CandleReGorionFighter
@83
== C0CR#GOR @84
END
  ++ @85 EXTERN C0CR#GOR C0CandleReGorionFighter.1
  ++ @86 EXTERN C0CR#GOR C0CandleReGorionFighter.2

CHAIN C0CR#GOR C0CandleReGorionFighter.1
@87
EXTERN C0CR#GOR C0CandleReGorionFighter.3

CHAIN C0CR#GOR C0CandleReGorionFighter.2
@88
EXTERN C0CR#GOR C0CandleReGorionFighter.3

CHAIN C0CR#GOR C0CandleReGorionFighter.3
@89
== C0CR#JON @90
== C0CR#GOR @91
EXTERN C0CR#GOR C0CandleReGorionEnd

// Thief
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReDederStart","GLOBAL",1)~ THEN C0CR#DED C0CandleReDederStart
@92
= @93
END
  ++ @94 EXTERN C0CR#DED C0CandleReDederStart.1
  ++ @95 EXTERN C0CR#DED C0CandleReDederStart.2
  ++ @96 EXTERN C0CR#DED C0CandleReDederStart.4

CHAIN C0CR#DED C0CandleReDederStart.1
@97
EXTERN C0CR#DED C0CandleReDederStart.3

CHAIN C0CR#DED C0CandleReDederStart.2
@98
= @99
== C0CR#DED IF ~OR(2) TriggerOverride(Player1,HaveSpellRES("C0AS#P1")) TriggerOverride(Player1,HaveSpellRES("SPCL423"))~ THEN @100
EXTERN C0CR#DED C0CandleReDederStart.3

CHAIN C0CR#DED C0CandleReDederStart.3
@101
= @102
EXTERN C0CR#DED C0CandleReDederStart.4

CHAIN C0CR#DED C0CandleReDederStart.4
@103
= @104
	DO ~SetGlobal("C0CandleReDederStart","GLOBAL",2)
		ClearAllActions()
		StartCutSceneMode()
		StartCutScene("C0CR#013")~ EXIT

CHAIN C0CR#DED C0CandleReGorionThief
@105
== C0CR#GOR @106
== C0CR#DED @107
== C0CR#GOR @108
== C0CR#GOR @109
== C0CR#DED @110
DO ~GiveItemCreate("potn10",Player1,2,0,0)~
== C0CR#DED @111
== C0CR#GOR @112
== C0CR#GOR @113
EXTERN C0CR#GOR C0CandleReGorionEnd

// Ranger
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionErikBegin","GLOBAL",0)~ THEN C0CR#ERI C0CandleReErikRanger
@114
DO ~SetGlobal("C0CandleReGorionErikBegin","GLOBAL",1)~
== C0CR#ERI @115
== C0CR#DOG @116
== C0CR#ERI @117
END
  ++ @118 + C0CandleReErikRanger.1
  ++ @119 + C0CandleReErikRanger.4
  ++ @120 + C0CandleReErikRanger.4

CHAIN C0CR#ERI C0CandleReErikRanger.1
@121
= @122
= @123
END
  ++ @124 EXTERN C0CR#ERI C0CandleReErikRanger.2
  ++ @125 EXTERN C0CR#ERI C0CandleReErikRanger.3

CHAIN C0CR#ERI C0CandleReErikRanger.2
@126
END
IF ~True()~ EXTERN C0CR#ERI C0CandleReErikRanger.6
IF ~CheckStatGT(Player1,0,PROFICIENCYCROSSBOW)~ DO ~GiveItemCreate("XBOW04",Player1,1,0,0) GiveItemCreate("BOLT01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYLONGBOW)~ DO ~GiveItemCreate("BOW03",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSHORTBOW)~ DO ~GiveItemCreate("BOW05",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYDART)~ DO ~GiveItemCreate("DART01",Player1,60,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSLING)~ DO ~GiveItemCreate("SLNG01",Player1,1,0,0) GiveItemCreate("BULL01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5

CHAIN C0CR#ERI C0CandleReErikRanger.3
@127
END
IF ~True()~ EXTERN C0CR#ERI C0CandleReErikRanger.6
IF ~CheckStatGT(Player1,0,PROFICIENCYCROSSBOW)~ DO ~GiveItemCreate("XBOW04",Player1,1,0,0) GiveItemCreate("BOLT01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYLONGBOW)~ DO ~GiveItemCreate("BOW03",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSHORTBOW)~ DO ~GiveItemCreate("BOW05",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYDART)~ DO ~GiveItemCreate("DART01",Player1,60,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSLING)~ DO ~GiveItemCreate("SLNG01",Player1,1,0,0) GiveItemCreate("BULL01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5

CHAIN C0CR#ERI C0CandleReErikRanger.4
@128
END
IF ~True()~ EXTERN C0CR#ERI C0CandleReErikRanger.6
IF ~CheckStatGT(Player1,0,PROFICIENCYCROSSBOW)~ DO ~GiveItemCreate("XBOW04",Player1,1,0,0) GiveItemCreate("BOLT01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYLONGBOW)~ DO ~GiveItemCreate("BOW03",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSHORTBOW)~ DO ~GiveItemCreate("BOW05",Player1,1,0,0) GiveItemCreate("AROW01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYDART)~ DO ~GiveItemCreate("DART01",Player1,60,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5
IF ~CheckStatGT(Player1,0,PROFICIENCYSLING)~ DO ~GiveItemCreate("SLNG01",Player1,1,0,0) GiveItemCreate("BULL01",Player1,40,0,0)~ EXTERN C0CR#ERI C0CandleReErikRanger.5

CHAIN C0CR#ERI C0CandleReErikRanger.5
@129
EXTERN C0CR#ERI C0CandleReErikRanger.6

CHAIN C0CR#ERI C0CandleReErikRanger.6
@130
	DO ~ClearAllActions()
		StartCutSceneMode()
		StartCutScene("C0CR#011")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("JonHit","GLOBAL",1)
Global("C0CandleReGorionErikBegin","GLOBAL",1)~ THEN ERIK C0CandleReErikNew
@131
DO ~SetGlobal("C0CandleReGorionErikBegin","GLOBAL",2)~ COPY_TRANS ERIK 0

CHAIN C0CR#ERI C0CandleReGorionRanger
@132
== C0CR#GOR @133
== C0CR#ERI @134
== C0CR#GOR @135
== C0CR#ERI @136
== C0CR#GOR @137
EXTERN C0CR#GOR C0CandleReGorionEnd

// Druid
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionDruid
@138
= @139
END
  ++ @140 EXTERN C0CR#GOR C0CandleReGorionDruid.1
  ++ @141 EXTERN C0CR#GOR C0CandleReGorionDruid.2
  ++ @142 EXTERN C0CR#GOR C0CandleReGorionDruid.3

CHAIN C0CR#GOR C0CandleReGorionDruid.1
@143
EXTERN C0CR#GOR C0CandleReGorionDruid.3

CHAIN C0CR#GOR C0CandleReGorionDruid.2
@144
EXTERN C0CR#GOR C0CandleReGorionDruid.3

CHAIN C0CR#GOR C0CandleReGorionDruid.3
@145
= @146
DO ~GiveItemCreate("ring03",Player1,5,0,0)
ActionOverride(Player1,SetItemFlags("ring03",IDENTIFIED,TRUE))~
= @147
= @148
EXTERN C0CR#GOR C0CandleReGorionEnd

// Monk
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionMonk
@149
= @150
END
  ++ @151 EXTERN C0CR#GOR C0CandleReGorionMonk.1
  ++ @152 EXTERN C0CR#GOR C0CandleReGorionMonk.2
  ++ @153 EXTERN C0CR#GOR C0CandleReGorionMonk.4

CHAIN C0CR#GOR C0CandleReGorionMonk.1
@154
EXTERN C0CR#GOR C0CandleReGorionMonk.3

CHAIN C0CR#GOR C0CandleReGorionMonk.2
@155
EXTERN C0CR#GOR C0CandleReGorionMonk.3

CHAIN C0CR#GOR C0CandleReGorionMonk.3
@156
EXTERN C0CR#GOR C0CandleReGorionMonk.4

CHAIN C0CR#GOR C0CandleReGorionMonk.4
@157
= @158
EXTERN C0CR#GOR C0CandleReGorionEnd

// Shaman
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionShaman
@159
= @160
END
  ++ @161 EXTERN C0CR#GOR C0CandleReGorionShaman.1
  ++ @162 EXTERN C0CR#GOR C0CandleReGorionShaman.1
  ++ @163 EXTERN C0CR#GOR C0CandleReGorionShaman.2

CHAIN C0CR#GOR C0CandleReGorionShaman.1
@164
EXTERN C0CR#GOR C0CandleReGorionShaman.2

CHAIN C0CR#GOR C0CandleReGorionShaman.2
@165
EXTERN C0CR#GOR C0CandleReGorionEnd

// Blackguard
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN C0CR#GOR C0CandleReGorionBlackguard
@166
END
  ++ @167 EXTERN C0CR#GOR C0CandleReGorionBlackguard.1
  ++ @168 EXTERN C0CR#GOR C0CandleReGorionBlackguard.1
  ++ @169 EXTERN C0CR#GOR C0CandleReGorionBlackguard.2

CHAIN C0CR#GOR C0CandleReGorionBlackguard.1
@170
EXTERN C0CR#GOR C0CandleReGorionBlackguard.2

CHAIN C0CR#GOR C0CandleReGorionBlackguard.2
@171
EXTERN C0CR#GOR C0CandleReGorionEnd

// Final Scene
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Detect(Player1) Global("C0CandleReGorionFinal","GLOBAL",0)~ THEN GORION C0CandleReGorionFinal
@172
DO ~SetGlobal("C0CandleReGorionFinal","GLOBAL",1)~
END
  + ~OR(2) Dead("SHANK") Dead("CARBOS")~ + @173 EXTERN GORION C0CandleReGorionFinal.1
  ++ @174 EXTERN GORION C0CandleReGorionFinal.2
  ++ @175 EXTERN GORION C0CandleReGorionFinal.6

CHAIN GORION C0CandleReGorionFinal.1
@176
EXTERN GORION C0CandleReGorionFinal.3

CHAIN GORION C0CandleReGorionFinal.2
@177
EXTERN GORION C0CandleReGorionFinal.3

CHAIN GORION C0CandleReGorionFinal.3
@178
= @179
END
  ++ @180 EXTERN GORION C0CandleReGorionFinal.4
  ++ @181 EXTERN GORION C0CandleReGorionFinal.5
  ++ @182 EXTERN GORION C0CandleReGorionFinal.6

CHAIN GORION C0CandleReGorionFinal.4
@183
EXTERN GORION C0CandleReGorionFinal.7

CHAIN GORION C0CandleReGorionFinal.5
@184
EXTERN GORION C0CandleReGorionFinal.7

CHAIN GORION C0CandleReGorionFinal.6
@185
DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#014")~ EXIT
	
CHAIN GORION C0CandleReGorionFinal.7
@186
DO ~ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#014")~ EXIT
	
CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionFinal","GLOBAL",1)~ THEN C0CR#ULR C0CandleReGorionFinalUlraunt
@187
== GORION @188
== C0CR#ULR @189
== GORION @190
== C0CR#ULR @191
== GORION @192
== C0CR#ULR @193
== GORION @194
== C0CR#ULR @195
== GORION @196
== C0CR#ULR @197
== C0CR#ULR @198
== GORION @199
== C0CR#ULR @200
== C0CR#ULR @201
DO ~SetGlobal("C0CandleReGorionFinal","GLOBAL",2)
	ClearAllActions()
	StartCutSceneMode()
	StartCutScene("C0CR#015")~ EXIT
	
CHAIN IF WEIGHT #-1 ~Global("C0CandleReGorionFinal","GLOBAL",2)~ THEN GORION C0CandleReGorionFinalPostUlraunt
@202
DO ~SetGlobal("C0CandleReGorionFinal","GLOBAL",3)~
END
  ++ @203 + C0CandleReGorionFinalPostUlraunt.1
  ++ @204 + C0CandleReGorionFinalPostUlraunt.2
  ++ @205 + C0CandleReGorionFinalPostUlraunt.3

CHAIN GORION C0CandleReGorionFinalPostUlraunt.1
@206
EXTERN GORION C0CandleReGorionFinalPostUlraunt.4

CHAIN GORION C0CandleReGorionFinalPostUlraunt.2
@207
EXTERN GORION C0CandleReGorionFinalPostUlraunt.4

CHAIN GORION C0CandleReGorionFinalPostUlraunt.3
@208
EXTERN GORION C0CandleReGorionFinalPostUlraunt.4

CHAIN GORION C0CandleReGorionFinalPostUlraunt.4
@209
= @210
= @211
EXTERN GORION 0	