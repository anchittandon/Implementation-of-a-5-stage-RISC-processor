.main:
    mov r2, 2
    mov r3, 3
    mov r5, 5
    mov r6, 6
    mov r9, 9
    mov r10, 10
    call .foo
    add r1, r2, r3
    sub r4, r1, r6
    b .end
.foo:
    add r8, r9, r10
    ret

.end:
    nop
