# microchip-HW2
林正中微處理機實驗

## memory design

|byte|value|
|----|-----|
|10H |first state of func1|
|11H |second state of func1|
|12H |first state of func2|
|13H |second state of func2|

if func is L2R/R2L put #01H , #02H as initial value

20H 'self stack pointer start at 21H'
every varible pass to my API should put in stack sequentially

## API
- two_led_control(Pn1,func1,Pn2,func2)
    - func==0: simple switch 
    - func==1: L2R 
    - func==2: R2L 
<!-- - LED_L2R(Pn)
- LED_R2L(Pn)
- LED_costum_switch(Pn,pattarn1,pattarn2) -->
- short_pause() //total pause time is #FFH cycle
- long_pause()  //total pause time is #FFH*FFH cycle
- custom_pause(time1,time2) //total pause time is time1*time2 cycle
- PUSH_ALL() //Wrong ,dont use it. If you are interested in why, you can try to call this api
- POP_ALL() //Wrong ,dont use it. If you are interested in why, you can try to call this api 
