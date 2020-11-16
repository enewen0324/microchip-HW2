ORG 0
    LCALL reset
    ;
    MOV sp,#4FH
    MOV 20H,#20H
    ;
    ;initial value
    MOV 10H,#01H
    MOV 11H,#02H
    MOV 12H,#0F0H
    MOV 13H,#0FH
    ;initial value end
    ;push varible to self stack
    MOV R0,20H
    INC R0
    MOV @R0,#70H
    INC R0
    MOV @R0,#01H
    INC R0
    MOV @R0,#71H
    INC R0
    MOV @R0,#00H
    MOV 20H,R0
    ;
    ;first call
    ACALL two_led_control
    ;second call
    ;thrid call
    ;four call
    LJMP endl
two_led_control:
    PUSH ACC
    PUSH 0
    PUSH 1
    PUSH 2
    PUSH 3
    PUSH 4
    PUSH 5
    PUSH 6
    PUSH 7
    ; POP varible from self stack
    MOV R0,20H  ;R4567 -> Pn1,func1,Pn2,func2
    MOV 7H,@R0
    DEC R0
    MOV 6H,@R0
    DEC R0
    MOV 5H,@R0
    DEC R0
    MOV 4H,@R0
    DEC R0
    MOV 20H,R0
    MOV R3,#10H
    ; POP varible from self stack end
two_start:   
    ; put varible in self stack
    MOV R0,20H
    INC R0
    MOV @R0,4H
    INC R0
    MOV @R0,6H
    MOV 20H,R0
    ; put varible in self stack end 
    ACALL show
    ; put varible in self stack
    MOV R0,20H
    INC R0
    MOV @R0,5H
    INC R0
    MOV @R0,#10H
    MOV 20H,R0
    ; put varible in self stack end
    ACALL rotate
    ; put varible in self stack
    MOV R0,20H
    INC R0
    MOV @R0,7H
    INC R0
    MOV @R0,#12H
    MOV 20H,R0
    ; put varible in self stack end
    ACALL rotate
    DJNZ R3,two_start

    POP 7
    POP 6
    POP 5
    POP 4
    POP 3
    POP 2
    POP 1
    POP 0
    POP ACC
    RET

rotate:
    PUSH ACC
    PUSH 0
    PUSH 1
    PUSH 5
    MOV R0,20H
    MOV 1H,@R0
    DEC R0
    MOV 5H,@R0
    DEC R0
    MOV 20H,R0
    CJNE R5, #00H , not_zero
    AJMP FI_FIRST
not_zero:    
    CJNE R5, #01H , is_two
is_one:
    MOV A,@R1
    RR A
    RR A
    MOV @R1,A
    INC R1
    MOV A,@R1
    RR A
    RR A
    MOV @R1,A
    AJMP FI_FIRST
is_two:
    MOV A,@R1
    RL A
    RL A
    MOV @R1,A
    INC R1
    MOV A,@R1
    RL A
    RL A
    MOV @R1,A
FI_FIRST:
    POP 5
    POP 1
    POP 0
    POP ACC
    RET
    
show:
    PUSH 0
    PUSH 1
    PUSH 2
    MOV R0,20H
    MOV 1H,@R0
    DEC R0
    MOV 2H,@R0
    DEC R0
    MOV 20H,R0
    MOV R0,2H
    MOV @R0,10H
    MOV @R1,12H
    ACALL short_pause
    MOV @R0,11H
    MOV @R1,13H
    ACALL short_pause
    POP 2
    POP 1
    POP 0
    RET

custom_pause:
    PUSH 0
    PUSH 1
    PUSH 2
    
    MOV R0,20H
    MOV 1H,@R0
    DEC R0
    MOV 2H,@R0
    DEC R0
    MOV 20H,R0
pause:
    PUSH 1
    DJNZ R1, $
    POP 1
    DJNZ R2 , pause

    POP 2
    POP 1
    POP 0
    RET

short_pause:
    PUSH 0
    MOV R0,#0FFH
    DJNZ R0, $
    POP 0
    RET

long_pause:
    PUSH 0
    PUSH 1
    MOV R0,#0FFH
    MOV R1,#0FFH
l_pause:
    PUSH 1
    DJNZ R1, $
    POP 1
    DJNZ R0 , l_pause
    POP 1
    POP 0
    RET
reset:  
    CLR A
    CLR c
    MOV R0,#00H
    MOV R1,#00H
    MOV R2,#00H
    MOV R3,#00H
    MOV R4,#00H
    MOV R5,#00H
    MOV R6,#00H
    MOV R7,#00H
    RET
endl:
END