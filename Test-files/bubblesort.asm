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
    mov r2, 0       @ Starting address of the array
    mov r3, 6    @ REPLACE 6 WITH N, where, N is the number of numbers being sorted
    call .bubblesort
    .terminate:
        b .terminate
.bubblesort:
    mov r4, r3      @ store the number of elements to be sorted in one iteration in r4 (which ititially is equal to the number of elements)
    .traverse:
        ld r5, 0[r2]    @ loads the ith element in r5
        ld r6, 4[r2]    @ loads the (i+1)th element in r6
        cmp r5, r6      @ compare the
        bgt .exchange   @ if ith element greater then exchange them
        b .next         @ else move to the (i+1)th and (i+2)th elements
        .exchange:
            st r6, 0[r2]
            st r5, 4[r2]
        .next:
            add r2, r2, 4   @ move to the (i+1)th and (i+2)th elements by just incrementing the base address
            sub r4, r4, 1   @ decreaese r4 since now  less comparision has to be made
            cmp r4, 1   @ keep traversing till all comparision in that iterations are completed
            bgt .traverse
            mov r2, r0  @ again intialise r2 to the base address for next iteration
            sub r3, r3, 1   @ this iteration has 1 less element to sort to decrease r3
            mov r4, r3  @ store this in r4(which contains the number of elements to be sorted) and continue
            cmp r3, 1   @ keep sorting till all the elements are sorted
            bgt .traverse
            ret



