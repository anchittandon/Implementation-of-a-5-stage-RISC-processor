.main:
    mov r0, 0
    mov r1, 12    @ replace 12 with the number to be sorted
    st r1, 0[r0]
    mov r1, 7    @ replace 7 with the number to be sorted
    st r1, 4[r0]
    mov r1, 11  @ replace 11 with the number to be sorted
    st r1, 8[r0]
    mov r1, 9   @ replace 9 with the number to be sorted
    st r1, 12[r0]
    mov r1, 3   @ replace 3 with the number to be sorted
    st r1, 16[r0]
    mov r1, 15  @ replace 15 with the number to be sorted
    st r1, 20[r0]
    mov r2, 0
    mov r3, 5    @ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
    mul r3, r3, 4
    add r4, r2, r3  @ Address of the last element of the array
    mov r6, r4  @ Make a copy of the address of the last element of the array
    call .mergesort
    .terminate:
        b .terminate
.mergesort:
    cmp r6, r2
    beq .end
    add r5, r2, r6      @
    div r5, r5, 8       @   find the address of the middle element
    mul r5, r5, 4       @
    sub sp, sp, 16      @ 4 elements have to stored so make space in stack
    st r2, 0[sp]        @
    st r5, 4[sp]        @
    st r6, 8[sp]        @ Store the elements in stack
    st ra, 12[sp]       @
    mov r6, r5
    call .mergesort
    ld r5, 4[sp]
    add r2, r5, 4   @ move the initial address of the second half of the array in r2
    ld r6, 8[sp]    @ move the final address of the second half of the array in r6
    call .mergesort
    call .merge
    ld r5, 4[sp]
    ld ra, 12[sp]   @ load back the return value appropriately
    add sp, sp, 16  @ delete the activation block
    .end:
        ret
.merge:
    ld r2, 0[sp]    @address of the first element of the first array
    ld r5, 4[sp]    @address of the last element of the first array
    add r7, r5, 4   @address of the first element of the second array
    ld r6, 8[sp]    @address of the last element of the second array
    add r8, r4, 4   @starting address of the temporary array (starting just after our initial array)
    sub r12, r6, r2
    div r12, r12, 4
    add r12, r12, 1     @ r12 stores the no of elements to be merged
    mov r13, r12    @
    mov r11, r7     @ initialise j (starting address of second address)
    mov r3, r2      @ initialise i (starting address of first address)
    mov r1, r8      @ why
    .loop:
        cmp r12, 0
        beq .copy
        cmp r3, r7
        beq .addallsecond
        cmp r11, r6
        bgt .addallfirst
        ld r9, [r3]     @ retrieve the value stored in first subarray
        ld r10, [r11]   @ retrieve the value stored in second subarray
        cmp r9, r10     @ compare them and add the greater one in the temporary array
        bgt .addsecond
        b .addfirst
        .addsecond:
            st r10, 0[r8]
            add r11, r11, 4
            b .repeat
        .addfirst:
            st r9, 0[r8]
            add r3, r3, 4
            b .repeat
        .addallsecond:
            ld r10, 0[r11]
            st r10, 0[r8]
            add r11, r11, 4
            b .repeat
        .addallfirst:
            ld r9, 0[r3]
            st r9, 0[r8]
            add r3, r3, 4
            b .repeat
        .repeat:
            sub r12, r12, 1     @ now 1 less elements have to be merged
            add r8, r8, 4       @ starting from this new location
            b .loop
    .copy:
        cmp r13, 0
        beq .return
        ld r10, 0[r1]
        st r10, 0[r2]
        add r1, r1, 4
        add r2, r2, 4
        sub r13, r13, 1
        b .copy
    .return:
        ret



