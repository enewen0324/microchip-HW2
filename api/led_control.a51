two_led_control:
    ACALL PUSH_ALL
    ; POP varible from self stack
    MOV R0,20H  ;R4567 -> Pn1,func1,Pn2,func2
    MOV R7,@R0
    DEC R0
    MOV R6,@R0
    DEC R0
    MOV R5,@R0
    DEC R0
    MOV R4,@R0
    DEC R0
    MOV 20H,R0
    MOV R3,#10H
    ; POP varible from self stack end
two_start:   
    ; put varible in self stack
    MOV R0,20H
    INC R0
    MOV @R0,R4
    INC R0
    MOV @R0,R6
    MOV 20H,R0
    ; put varible in self stack end 
    ACALL show
    ; put varible in self stack
    MOV R0,20H
    INC R0
    MOV @R0,R5
    INC R0
    MOV @R0,#10H
    MOV 20H,R0
    ; put varible in self stack end
    ACALL rotate
    ; put varible in self stack
    MOV R0,20H
    INC R0
    MOV @R0,R5
    INC R0
    MOV @R0,#12H
    MOV 20H,R0
    ; put varible in self stack end
    ACALL rotate
    DJNZ R3,two_start

    ACALL POP_ALL

rotate:
    PUSH ACC
    PUSH 0
    PUSH 1
    PUSH 5
    MOV R0,20H
    MOV A,@R0
    DEC R0
    MOV R1,@R0
    DEC R0
    MOV 20H,R0
    CJNE R5, #00H , not_zero
    AJMP FI_FIRST
not_zero:    
    CJNE R5, #01H , is_one
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
    AJMP FI_FIRST
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
    MOV R1,@R0
    DEC R0
    MOV R2,@R0
    DEC R0
    MOV 20H,R0
    MOV R0,R2
    MOV @R0,10H
    MOV @R1,12H
    ACALL short_pause
    MOV @R0,11H
    MOV @R1,13H
    POP 2
    POP 1
    POP 0
    RET