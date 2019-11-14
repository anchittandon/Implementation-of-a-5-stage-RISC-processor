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
    mov r2, 0          @ Starting address of the array
    mov r3, 5    @ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
    mul r3, r3, 4
    add r4, r2, r3  @ Ending address of the array
    call .quicksort
    .terminate:
        b .terminate


.partition:
    mov r3, r4      @ address of pivot(the last element)
    sub r4, r4, 4   @ address of j (the second last element)

    ld r5, 0[r2]    @ access the value of ith element (first element)
    ld r6, 0[r3]    @ access the value of the pivot element
    ld r7, 0[r4]    @ access the value of jth element (second last element)
    .loop:
        cmp r2, r4  @ if i>j then swap pivot with i
        bgt .swap
        cmp r6, r5
        bgt .continue_i     @ if value of ith element < pivot, move to (i+1)th elemet
        cmp r7, r6
        bgt .continue_j     @ if value of jth element > pivot, move to (j-1)th elemet
        st r5, 0[r4]        @ swap elements and move forward
        st r7, 0[r2]
        add r2, r2, 4       @ increment i
        ld r5, 0[r2]        @ load the next ((i+1)th) value
        sub r4, r4, 4       @ decrement j
        ld r7, 0[r4]        @ load the next ((j-1)th) value
        b .loop
        .continue_i:
            add r2, r2, 4
            ld r5, 0[r2]
            b .loop
        .continue_j:
            sub r4, r4, 4
            ld r7, 0[r4]
            b .loop
    .swap:
        st r5, 0[r3]
        st r6, 0[r2]
        ret

.quicksort:
    cmp r2, r4      @ check the number of elements to be sorted
    bgt .return     @ return if no element is to be sorted
    sub sp, sp, 16      @ make the activation block for recursive calls
    st r2, 0[sp]       @ store the initial address, final address and return address in the stack
    st r4, 8[sp]
    st ra, 12[sp]

    call .partition
    st r2, 4[sp]    @ store the address of the pivot element received from the partition function in the stack

    ld r2, 0[sp]
    call .quicksort     @ sort the subarray containing elements having value less than the pivot

    ld r2, 4[sp]
    add r2, r2, 4       @ load the initial address of the second subarray to be sorted in r2
    ld r4, 8[sp]        @ load back the final address of the second subarray to be sorted in r4
    call .quicksort     @ sort the subarray containing elements having value more than the pivot

    ld ra, 12[sp]       @ retrieve the return address
    add sp, sp, 16      @ delete the activation block
    .return:
        ret
 

