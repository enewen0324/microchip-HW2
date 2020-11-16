PUSH_ALL:
    PUSH ACC
    PUSH 0
    PUSH 1
    PUSH 2
    PUSH 3
    PUSH 4
    PUSH 5
    PUSH 6
    PUSH 7
    RET
POP_ALL:
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