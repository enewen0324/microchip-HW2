custom_pause:
    PUSH 0
    PUSH 1
    PUSH 2
    
    MOV R0,20H
    MOV R1,@R0
    DEC R0
    MOV R2,@R0
    DEC R0
    MOV 20H,R0
pause:
    PUSH 1
    DJNZ R1, &
    POP 1
    DJNZ R2 , pause

    POP 2
    POP 1
    POP 0
    RET

short_pause:
    PUSH 0
    MOV R0,#0FFH
    DJNZ R0, &
    POP 0
    RET

long_pause:
    PUSH 0
    PUSH 1
    MOV R0,#0FFH
    MOV R1,#0FFH
l_pause:
    PUSH 1
    DJNZ R1, &
    POP 1
    DJNZ R0 , l_pause
    POP 1
    POP 0
    RET
