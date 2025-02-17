ADD_TRANS_TRIGGER GORION 0 ~!IsValidForPartyDialog("%bg1_imoen%")~ DO 0
EXTEND_TOP GORION 0
+ ~IsValidForPartyDialog("%bg1_imoen%")~ + @212 EXTERN %bg1_imoen_dlg% C0CandleReImoenFarewell
END

CHAIN %bg1_imoen_dlg% C0CandleReImoenFarewell
@213
END
 ++ @214 + C0CandleReImoenFarewell.1
 ++ @215 + C0CandleReImoenFarewell.2

CHAIN %bg1_imoen_dlg% C0CandleReImoenFarewell.1
@216
EXTERN %bg1_imoen_dlg% C0CandleReImoenFarewell.2

CHAIN %bg1_imoen_dlg% C0CandleReImoenFarewell.2
@217
= @218
= @219
DO ~SetGlobal("C0CandleReImoenJoins","GLOBAL",3)
ClearAllActions()
StartCutSceneMode()
StartCutScene("ch1cut01")~ EXIT

INTERJECT IMOEN 7 C0CandleReImoenJoins
== IMOEN @220
END
 ++ @221 + C0CandleReImoenJoins.1
 ++ @222 + C0CandleReImoenJoins.0

INTERJECT IMOEN 6 C0CandleReImoenJoins
== IMOEN @220
END
 ++ @221 + C0CandleReImoenJoins.1
 ++ @222 + C0CandleReImoenJoins.0
 
INTERJECT IMOEN 7 C0CandleReImoenJoins
== IMOEN @220
END
 ++ @221 + C0CandleReImoenJoins.1
 ++ @222 + C0CandleReImoenJoins.0

CHAIN IMOEN C0CandleReImoenJoins.0
@223
EXIT

CHAIN IMOEN C0CandleReImoenJoins.1
@224
= @225
END
 ++ @226 + C0CandleReImoenJoins.2
 ++ @227 + C0CandleReImoenJoins.3
 ++ @228 + C0CandleReImoenJoins.4

CHAIN IMOEN C0CandleReImoenJoins.2
@229
DO ~SetGlobal("C0CandleReImoenJoins","GLOBAL",2)
SetGlobal("X#ImFriendTalk","GLOBAL",-1)
SetGlobal("C0CandleReImoenJoined","LOCALS",1)
JoinParty()~ EXIT

CHAIN IMOEN C0CandleReImoenJoins.3
@230
EXIT

CHAIN IMOEN C0CandleReImoenJoins.4
@231
EXIT

CHAIN IF WEIGHT #-1 ~Global("C0CandleReImoenJoins","GLOBAL",2)~ THEN IMOENP C0CandleReImoenKicked
@232
END
++ @233 DO ~JoinParty()~ EXIT
++ @234 + C0CandleReImoenKicked.1

CHAIN IMOENP C0CandleReImoenKicked.1
@235
DO ~SetDialog("%bg1_imoen%")
SetGlobal("C0CandleReImoenJoins","GLOBAL",-1)
EscapeAreaMove("%bg1_eet_symbol%2600",2843,1895,S)~ EXIT

// Interjections
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

I_C_T2 HULL 1 C0CandleReImoenInterjectHull
== %bg1_imoen_dlg% IF ~IsValidForPartyDialog("%bg1_imoen%")~ THEN @236
END

I_C_T2 HULL 3 C0CandleReImoenInterjectHull
== %bg1_imoen_dlg% IF ~IsValidForPartyDialog("%bg1_imoen%")~ THEN @237
END

I_C_T2 INNKE2 6 C0CandleReImoenInterjectWinthrop
== INNKE2 IF ~IsValidForPartyDialog("%bg1_imoen%")~ THEN @238
== %bg1_imoen_dlg% @239
== INNKE2 @240
== %bg1_imoen_dlg% @241
== INNKE2 @242
END

I_C_T2 REEVOR 0 C0CandleReImoenInterjectReevor
== %bg1_imoen_dlg% IF ~IsValidForPartyDialog("%bg1_imoen%")~ THEN @243
END

// Assassin
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CHAIN IF WEIGHT #-1 ~Global("C0CandleReImoenAssassin","GLOBAL",1)~ THEN %bg1_imoen_dlg% C0CandleReImoenAssassin
@244
DO ~SetGlobal("C0CandleReImoenAssassin","GLOBAL",2)~ 
= @245
END
  ++ @246 + C0CandleReImoenAssassin.1
  ++ @247 + C0CandleReImoenAssassin.2
  ++ @248 + C0CandleReImoenAssassin.3
  
CHAIN %bg1_imoen_dlg% C0CandleReImoenAssassin.1
@249
EXTERN %bg1_imoen_dlg% C0CandleReImoenAssassin.4

CHAIN %bg1_imoen_dlg% C0CandleReImoenAssassin.2
@250
EXTERN %bg1_imoen_dlg% C0CandleReImoenAssassin.4

CHAIN %bg1_imoen_dlg% C0CandleReImoenAssassin.3
@251
EXTERN %bg1_imoen_dlg% C0CandleReImoenAssassin.4

CHAIN %bg1_imoen_dlg% C0CandleReImoenAssassin.4
@252
END
  ++ @253 + C0CandleReImoenAssassin.5
  ++ @254 + C0CandleReImoenAssassin.6
  ++ @255 + C0CandleReImoenAssassin.7
  
CHAIN %bg1_imoen_dlg% C0CandleReImoenAssassin.5
@256
EXTERN %bg1_imoen_dlg% C0CandleReImoenAssassin.8

CHAIN %bg1_imoen_dlg% C0CandleReImoenAssassin.6
@257
EXTERN %bg1_imoen_dlg% C0CandleReImoenAssassin.8

CHAIN %bg1_imoen_dlg% C0CandleReImoenAssassin.7
@258
EXTERN %bg1_imoen_dlg% C0CandleReImoenAssassin.8

CHAIN %bg1_imoen_dlg% C0CandleReImoenAssassin.8
@259
EXIT

CHAIN IF WEIGHT #-1 ~IsGabber(Player1) GlobalLT("Chapter","GLOBAL",1)~ THEN %bg1_imoen_dlg% C0CandleReImoenAssassin
@500
EXIT
