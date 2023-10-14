#SingleInstance Force
#NoEnv
SendMode Input
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 75, 25
SetBatchLines -1
CoordMode, Pixel, Window



;====================================================================================================================;
;===================================================== VARIABLES ====================================================;
;====================================================================================================================;
flag := false
;global clientName = "client.exe"
global clientName = "127.0.0.1.exe"
global yugaoPId = 17816
global dpsId = 12888
global tankPId = 0
global waypoint = 0
global waypointTries = 0

;====================================================================================================================;
;==================================================== GUI CONFIG ====================================================;
;====================================================================================================================;



;SetTimer, treeTraining, 1000
;SetTimer, waterTraining, 1000
SetTimer, autoAttack, 200
;SetTimer, trainChakraFish, 10000
;SetTimer, autoAttackBot, 2000
;SetTimer, autoJump, 2500
;SetTimer, scrollsAndTrain, 5000
;SetTimer, nextWaypoint, 5000
AppsKey::Pause

autoAttack:
  ;ControlSend,, {f}, ahk_pid 6364
  ;ControlSend,, {Esc}, ahk_pid %yugaoPId%
  ControlSend,, {r}, ahk_pid %yugaoPId%
  ;ControlSend,, {r}, ahk_exe Naruto Story.exe ahk_class naruto_story
  ;ControlSend,, {f}, ahk_pid 15456
return

treeTraining: ;; Chakra Control from 1 to 35
  ControlSend,, ^{Left}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 300
  ControlSend,, {Space}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 300
  ControlSend,, ^{Right}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 300
  ControlSend,, {Space}, ahk_exe Naruto Story.exe ahk_class naruto_story
return

waterTraining: ;; Chakra Control from 35 to 50
  ControlSend,, {Up}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Up}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Up}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Space}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Up}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Up}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Down}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Down}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Down}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Space}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Down}, ahk_exe Naruto Story.exe ahk_class naruto_story
  Sleep, 100
  ControlSend,, {Down}, ahk_exe Naruto Story.exe ahk_class naruto_story
return

;6::
autoAttackBot:
  ;ImageSearch, OutputVarX, OutputVarY, X1, Y1, X2, Y2, ImageFile
  ImageSearch, x_actualTarget, y_actualTarget, 964, 895, %A_ScreenWidth%, %A_ScreenHeight%, *TransBlack C:\Users\aerwi\Mi unidad\AutoHotkey Scripts\Naruto Story\img\bosshealth.png
  if (ErrorLevel = 0){

     ;MsgBox, Encontre Tengo Enemigo
  }
  if (ErrorLevel = 1){
     ControlSend,, {f}, ahk_exe Naruto Story.exe ahk_class naruto_story
  }
  if (ErrorLevel = 2){
     MsgBox, FileNotFound
  }

return

autoJump:
  ControlSend,, {Space}, ahk_pid 21356
  ControlSend,, {f}, ahk_pid 21356
  ;ControlSend,, {f}, ahk_pid 9764
return

scrollsAndTrain:
  ;ControlSend,, {Esc}, ahk_exe Naruto Story.exe ahk_class naruto_story
  ControlSend,, {Esc}, ahk_pid %yugaoPId%
  ;Sleep, 100
  ;ControlSend,, {F6}, ahk_exe Naruto Story.exe ahk_class naruto_story
  ControlSend,, {F6}, ahk_pid %yugaoPId%
  Sleep, 100
  ;ControlSend,, {f}, ahk_exe Naruto Story.exe ahk_class naruto_story
  ControlSend,, {f}, ahk_pid %yugaoPId%
  ;ControlSend,, {f}, ahk_pid %dpsId%
  ;MsgBox, %yugaoPId%
return

;f::
multiAttack:
  ControlSend,, {Esc}, ahk_pid %yugaoPId%
  ControlSend,, {f}, ahk_pid %yugaoPId%
  Sleep, 100
  ControlSend,, {Esc}, ahk_pid %dpsId%
  ControlSend,, {f}, ahk_pid %dpsId%
return

;Space::
multiJump:
  ControlSend,, {Space}, ahk_pid %yugaoPId%
  ControlSend,, {Space}, ahk_pid %dpsId%
return

;5::
nextWaypoint:
  If (waypoint <= 8){
    Loop {
    ImageSearch, xCavebot, yCavebot, 1734, 115, 1878, 231, *w0 *h0 C:\Users\aerwi\Mi unidad\AutoHotkey Scripts\Naruto Story\img\cavebot\%waypoint%.png
    If (ErrorLevel = 0){
        MouseClick, Left, xCavebot+2, yCavebot+2, 1
        Sleep, 5000
      }
      If (ErrorLevel = 1){
        waypointTries++
      }
      If (ErrorLevel = 2){
        MsgBox, Cant open file
      }
    } Until waypointTries = 25
    waypoint++
  } else {
    waypoint := 0
  }
return

trainChakraFish:
  ;ControlClick, Right, 974, 385, 1
return


  ;## Credits by Aerwix ## :