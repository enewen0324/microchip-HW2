# microchip-HW2
林正中微處理機實驗

## memory design

|byte|value|
|----|-----|
|10H |first state of pattern1|
|11H |second state of pattern1|
|12H |first state of pattern2|
|13H |second state of pattern2|
|......|......|
|20H|self stack pointer start at 21H|

if func is L2R/R2L put #01H , #02H as initial value

every varible pass to my API should put in self stack sequentially

## API
- two_led_control(Pn1,pattern1,Pn2,pattern2)
    - pattern==0: simple switch 
    - pattern==1: L2R 
    - pattern==2: R2L 
    - `會根據first and second state及pattern去找出LED燈亮的順序`
<!-- - LED_L2R(Pn)
- LED_R2L(Pn)
- LED_costum_switch(Pn,pattarn1,pattarn2) -->
- short_pause() 
    - total pause time is #FFH cycle
- long_pause()
    - total pause time is #10H*FFH*FFH cycle
- custom_pause(time1,time2)
    - total pause time is time1*time2 cycle
- PUSH_ALL()
    - Wrong ,dont use it. If you are interested in why, you can try to call this api
- POP_ALL()
    - Wrong ,dont use it. If you are interested in why, you can try to call this api 
## QUICK START
![](https://i.imgur.com/dnFPcQk.png)
in phase1
```
    MOV 10H,#07FH  ;01111111
    MOV 11H,#0BFH  ;10111111
    MOV 12H,#0F0H ;11110000
    MOV 13H,#0FH  ;00001111

    MOV R0,20H
    INC R0
    MOV @R0,#02H ;pattern R2L
    INC R0
    MOV @R0,#00H ;pattern simple switch
    MOV 20H,R0
    
    ACALL two_led_control
```
